
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pocketlaw/constants.dart';
import 'package:pocketlaw/model/Vehicle.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../routes/routes.dart';
import '../widgets/helper.dart';

class VehicleService{
  final Dio _dio = Dio(BaseOptions(
    baseUrl: baseURL,
  ));

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('jwt_token');
  }

  Future<Vehicle?> fetchVehicle(String regNumber) async{

    showLoadingDialog("Processing...");

    try {
      var token = await getToken();
      var response = await _dio.request(
        '$baseURL/vehicles/$regNumber',
        options: Options(
          method: 'GET',
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        Navigator.of(Get.context!).pop();
        return Vehicle.fromJson(response.data);
      } else {
        Navigator.of(Get.context!).pop();
        print('Exception occurred while adding offender: ${response.data}');
        return null;
      }
    } on DioException catch (e) {
      Navigator.of(Get.context!).pop();
      _handleDioError(e);
    }catch (e){
      Navigator.of(Get.context!).pop();
      print('Exception: $e');
      return null;
    }
    return null;
    }

  void _handleDioError(DioException e) {
    if (e.response?.statusCode == 401  &&
        e.response?.data['error'] == 'Token Expired') {
      Get.snackbar(
        'Session Expired',
        'Your session has expired. Please log in again.',
        snackPosition: SnackPosition.TOP,
      );
      Get.offAllNamed(Routes.login);
    } else if(e.response?.statusCode == 404){

      Get.snackbar(
        'Error',
        'No vehicle',
        snackPosition: SnackPosition.TOP,
      );

    } else {
      print('DioError occurred: ${e.message}');
    }
  }

  }




