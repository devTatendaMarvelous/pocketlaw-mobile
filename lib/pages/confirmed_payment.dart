import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketlaw/model/PaymentResponse.dart';
import 'package:pocketlaw/widgets/custom_buttom.dart';

import '../routes/routes.dart';

class ConfirmedPaymentPage extends StatelessWidget {
  const ConfirmedPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the PaymentResponse passed via GetX arguments
    final PaymentResponse paymentResponse = Get.arguments;

    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.teal,
      //   elevation: 0,
      //   title: const Text(
      //     'Payment Confirmed',
      //     style: TextStyle(
      //       color: Colors.white,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      //   centerTitle: true,
      // ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Icon(
                Icons.check_circle,
                color: Colors.greenAccent.shade400,
                size: 100,
              ),
            ),

            const SizedBox(height: 20),

            // Confirmation Text
             Text(
              'Payment Successful!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900,
              ),
            ),

            const SizedBox(height: 10),
            const Text(
              'Thank you for your payment.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                elevation: 4,
                surfaceTintColor: CupertinoColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildDetailRow('Payment Reference', paymentResponse.data!.reference.toString()),
                      const Divider(),
                      buildDetailRow('Amount', '${paymentResponse.data!.amount} USD'),
                      const Divider(),
                      buildDetailRow('Status', paymentResponse.status),
                      const Divider(),
                      buildDetailRow('Currency', 'USD'),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 300,
              child: CustomButton(label: "Done", onPressed: ()=> {
              Get.offAllNamed(Routes.dashboard)
              }),
            ),

            SizedBox(height: 40,)
          ],
        ),
      ),
    );
  }



}

Widget buildDetailRow(String title, String? value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        Text(
          value!,
          style:  TextStyle(
            fontSize: 16,
            color: Colors.blue.shade900,
          ),
        ),
      ],
    ),
  );
}
