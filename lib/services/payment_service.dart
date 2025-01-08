import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pocketlaw/model/PaymentResponse.dart';
import 'package:pocketlaw/routes/routes.dart';
import 'package:pocketlaw/services/vehicle_service.dart';
import '../constants.dart';

class PaymentService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: baseURL,
  ));

  final VehicleService service = VehicleService();

  Future<void> addPayment(
      int crimeId, int paymentMethodId, double amount, int currencyId) async {
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
        var paymentResponse = PaymentResponse.fromJson(response.data);
        print(response.statusMessage);

        Get.toNamed(
          Routes.confirmPayment,
          arguments: paymentResponse,
        );
      } else {
        print(response.statusMessage);
        print(response.data);
      }
    } on DioException catch (e) {
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
      print('Exception occurred: $e');
    }
  }
}
