import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/routes.dart';

void showLoadingDialog(String message) {
  showDialog(
    context: Get.context!,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Row(
          children: [
             CircularProgressIndicator(
              color: Colors.blue.shade900,
            ),
            const SizedBox(width: 15),
            Text(message),
          ],
        ),
      );
    },
  );
}
void showProcessingDialog(String message) {
  showDialog(
    context: Get.context!,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Row(
          children: [
            const SizedBox(width: 15),
            Text(message),
          ],
        ),
      );
    },
  );
}

void showMessageDialog(String message) {
  showDialog(
    context: Get.context!,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Rounded corners
        ),
        backgroundColor: Colors.white, // Background color
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.info, // Information icon
              size: 50,
              color: Colors.blue.shade900, // Icon color
            ),
            const SizedBox(height: 20),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
                color: Colors.black87, // Text color
              ),
            ),
          ],
        ),
        actions: [
          Center(
            child: TextButton(
              onPressed: Get.back,
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue.shade900, // Button background
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded button
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
              ),
              child: Text(
                "Ok",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Button text color
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}

void handleDioError(DioException e) {
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


