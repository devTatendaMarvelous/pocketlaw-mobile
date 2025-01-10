import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pocket_law/model/ComplaintResponse.dart';
import 'package:pocket_law/services/vehicle_service.dart';

import '../constants.dart';
import '../widgets/helper.dart';


class ComplaintService{

  final Dio _dio = Dio(BaseOptions(
    baseUrl: baseURL,
  ));

  final VehicleService service = VehicleService();

  Future<ComplaintResponse?> addComplain(
      String title, String attachment, String body) async {
    showLoadingDialog("Processing...");

    try {
      final token = await service.getToken();
      final response = await _dio.post(
        'https://pocketlaw.easygrab.co.zw/api/complaints',
        data: {
          "title": title,
          "attachment": attachment,
          "body": body,
        },
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200 && response.data != null) {
        Navigator.of(Get.context!).pop();
        return ComplaintResponse.fromJson(response.data);
      }
    } on DioException catch (e) {
      Navigator.of(Get.context!).pop();
      handleDioError(e);
    } catch (e) {
      Navigator.of(Get.context!).pop();
      print('Exception occurred while adding offender: $e');
    }

    return null;
  }

}