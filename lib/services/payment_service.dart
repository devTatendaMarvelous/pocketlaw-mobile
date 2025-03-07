import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
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
      int crimeId, int paymentMethodId, double amount, int currencyId) async {

    showLoadingDialog("Processing...");
    try {
      var token = await service.getToken();

      var data = json.encode({
        "crime_id": crimeId,
        "payment_method_id": paymentMethodId,
        "amount": amount,
        "currency_id": currencyId,
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
        print(response.statusMessage);

        Get.offAllNamed(
          Routes.confirmPayment,
          arguments: paymentResponse,
        );

      } else {
        Navigator.of(Get.context!).pop();
        print(response.statusMessage);
        print(response.data);
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
        print('DioError occurred: ${e.message}');
      }
    } catch (e) {
      Navigator.of(Get.context!).pop();
      print('Exception occurred: $e');
    }
  }
}
