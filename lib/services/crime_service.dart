
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pocket_law/model/Crimes.dart';
import 'package:pocket_law/services/vehicle_service.dart';


import '../constants.dart';
import '../routes/routes.dart';
import '../widgets/helper.dart';

class CrimeServices{
  final Dio _dio = Dio(BaseOptions(
    baseUrl: baseURL,
  ));

  VehicleService service = VehicleService();

  Future<bool> addCrime(int vehicleId,int offenderId, int crimeId, String location) async{

    showLoadingDialog("Processing...");

    try{

      var token = await service.getToken();

      var data = json.encode({
        "vehicle_id": vehicleId,
        "offender_id": offenderId,
        "crime_id": crimeId,
        "occurrence_time": DateTime.now().toIso8601String(),
        "location": location
      });

      var response = await _dio.request(
          '$baseURL/commited-crimes',
          options: Options(
            method: 'POST',
            headers: {
              'Authorization': 'Bearer $token',
            },
          ),
          data: data
      );

      if (response.statusCode == 200) {
        Navigator.of(Get.context!).pop();
        json.encode(response.data);
        return true;
      } else if (response.data['error'] == "Token Expired") {
        Navigator.of(Get.context!).pop();
        Get.offNamed(Routes.login);
        Get.snackbar('', 'Token Expired');
        return false;
      }else{
        Navigator.of(Get.context!).pop();
        return false;
      }

    } catch(e){
      Navigator.of(Get.context!).pop();
      print('Exception: $e');
      return false;
    }
  }

  Future<Crimes?> getCrimes() async{


    showLoadingDialog("Processing...");

    try{

      var response = await _dio.request(
          '$baseURL/crimes',
          options: Options(
            method: 'GET',
          ),
      );

      if (response.statusCode == 200) {
        Navigator.of(Get.context!).pop();
        json.encode(response.data);
        return Crimes.fromJson(response.data);
      } else if (response.data['error'] == "Token Expired") {
        Navigator.of(Get.context!).pop();
        Get.offNamed(Routes.login);
        Get.snackbar('', 'Token Expired');
        return null;
      }else{
        Navigator.of(Get.context!).pop();
        return null;
      }

    } catch(e){
      Navigator.of(Get.context!).pop();

      print('Exception: $e');
      return null;
    }

  }

}