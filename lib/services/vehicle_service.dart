
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pocket_law/constants.dart';
import 'package:pocket_law/model/AddVehicleResponse.dart';
import 'package:pocket_law/model/Vehicle.dart';
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

  Future<AddVehicleResponse?> addVehicle(
      String make, String model, String color, String registrationNumber) async {
    showLoadingDialog("Creating New Vehicle...");

    try {
      final token = await getToken();
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      var data = json.encode({
        "make": make,
        "model": model,
        "color": color,
        "registration_number": registrationNumber
      });
      var dio = Dio();
      var response = await dio.post(
        'https://pocketlaw.easygrab.co.zw/api/vehicles',
        options: Options(
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200 && response.data != null) {
        // Navigator.of(Get.context!).pop(); // Close loading dialog
        // Get.snackbar(
        //   'Success',
        //   'Vehicle Added',
        //   colorText: Get.theme.primaryColor,
        //   snackPosition: SnackPosition.TOP,
        // );
        // Get.offAllNamed(Routes.dashboard);
        return AddVehicleResponse.fromJson(response.data);
      }
    } on DioException catch (e) {
      Navigator.of(Get.context!).pop();
      _handleDioError(e);
    } catch (e) {
      Navigator.of(Get.context!).pop();
      print('Exception occurred while adding vehicles: $e');
    }

    return null;
  }


  void _handleDioError(DioException e) {
    if (e.response?.statusCode == 401 && e.response?.data['error'] == 'Token Expired') {
      // Handle token expiration globally
      Get.snackbar(
        'Session Expired',
        'Your session has expired. Please log in again.',
        snackPosition: SnackPosition.TOP,
      );
      Get.offAllNamed(Routes.login);
    }
    // Do not show snackbars for other errors here; let UI layer handle
  }
  void _handleDioError2(DioException e) {
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
        e.response!.data.toString(),
        snackPosition: SnackPosition.TOP,
      );

    } else {
      print('DioError occurred: ${e.message}');
    }
  }

  }




