import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocket_law/model/Offender.dart';
import 'package:pocket_law/services/vehicle_service.dart';
import '../constants.dart';
import '../routes/routes.dart';

class OffenderService {
  final Dio _dio = Dio(BaseOptions(baseUrl: baseURL));
  final VehicleService service = VehicleService();

  Future<Offender?> getOffender(String idNumber) async {
    try {
      final token = await service.getToken();
      final response = await _dio.get(
        '/offenders/$idNumber',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200 && response.data != null) {
        return Offender.fromJson(response.data);
      }
    } on DioException catch (e) {
      _handleDioError(e);
    } catch (e) {
      print('Exception occurred while fetching offender: $e');
    }
    return null;
  }

  Future<Offender?> addOffender(
      String name, String idNumber, String licenseNumber) async {
    // Show loading dialog
    showLoadingDialog("Creating New Offender...");

    try {
      final token = await service.getToken();
      final response = await _dio.post(
        '/offenders',
        data: {
          "name": name,
          "id_number": idNumber,
          "license_number": licenseNumber,
        },
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      if (response.statusCode == 200 && response.data != null) {
        Navigator.of(Get.context!).pop();
        return Offender.fromJson(response.data);
      }
    } on DioException catch (e) {
      Navigator.of(Get.context!).pop();
      _handleDioError(e);
    } catch (e) {
      Navigator.of(Get.context!).pop(); // Ensure the dialog is dismissed
      print('Exception occurred while adding offender: $e');
    }

    return null;
  }

  void _handleDioError(DioException e) {
    if (e.response?.statusCode == 401 &&
        e.response?.data['error'] == 'Token Expired') {
      Get.snackbar(
        'Session Expired',
        'Your session has expired. Please log in again.',
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.offAllNamed(Routes.login);
    } else {
      print('DioError occurred: ${e.message}');
    }
  }

  void showLoadingDialog(String message) {
    showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            children: [
              const CircularProgressIndicator(),
              const SizedBox(width: 15),
              Text(message),
            ],
          ),
        );
      },
    );
  }
}
