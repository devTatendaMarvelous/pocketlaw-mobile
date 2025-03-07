import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:pocket_law/model/PaymentResponse.dart';
import 'package:pocket_law/routes/routes.dart';
import 'package:pocket_law/services/vehicle_service.dart';
import '../constants.dart';
import '../widgets/helper.dart';

class PaymentService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: baseURL,
  ));

  final VehicleService service = VehicleService();

  Future<void> addPayment(
      int crimeId, int paymentMethodId, double amount, int currencyId, String mobile) async {

    showLoadingDialog("Processing...");
    try {
      var token = await service.getToken();

      var data = json.encode({
        "crime_id": crimeId,
        "payment_method_id": paymentMethodId,
        "amount": amount,
        "currency_id": currencyId,
        "mobile": mobile
      });

      var response = await _dio.request(
        '/payments',
        options: Options(
          method: 'POST',
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        Navigator.of(Get.context!).pop();
        var paymentResponse = PaymentResponse.fromJson(response.data);
        if (kDebugMode) {
          print(response.statusMessage);
        }

        Get.offAndToNamed(
          Routes.confirmPayment,
          arguments: paymentResponse,
        );

      } else {
        Navigator.of(Get.context!).pop();
        if (kDebugMode) {
          print(response.statusMessage);
        }
        if (kDebugMode) {
          print(response.data);
        }
      }
    } on DioException catch (e) {
      Navigator.of(Get.context!).pop();
      if (e.response?.statusCode == 401 &&
          e.response?.data['error'] == 'Token Expired') {
        Get.snackbar(
          'Session Expired',
          'Your session has expired. Please log in again.',
          snackPosition: SnackPosition.BOTTOM,
        );
        Get.offAllNamed(Routes.login); // Replace with your login route
      } else {
        if (kDebugMode) {
          print('DioError occurred: ${e.message}');
        }
      }
    } catch (e) {
      Navigator.of(Get.context!).pop();
      if (kDebugMode) {
        print('Exception occurred: $e');
      }
    }
  }
}
