import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocket_law/pages/crimes_list.dart';
import 'package:pocket_law/routes/routes.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildButton(
              context,
              label: 'New Offender',
              onPressed: () => Get.toNamed(Routes.createOffender),
            ),
            const SizedBox(height: 20),
            _buildButton(
              context,
              label: 'View Crimes List',
              onPressed: () => Get.to(() => CrimesList()),
            ),
            const SizedBox(height: 20),
            _buildButton(
              context,
              label: 'Settings',
              onPressed: () => Get.toNamed(""),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, {
    required String label,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue[900],
        minimumSize: const Size(300, 60),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 17.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
