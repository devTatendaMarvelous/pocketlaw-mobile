import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

