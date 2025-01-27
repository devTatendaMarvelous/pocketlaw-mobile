import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pocket_law/pages/crimes_list.dart';
import 'package:pocket_law/routes/routes.dart';

import '../generated/assets.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[900],
        elevation: 0,
        title: const Text(
          'Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 150,
                        child: Image.asset(Assets.assetsSignboard),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Pocket Law',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                      ),
                      const SizedBox(height: 8),
                      const SizedBox(height: 16),
                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          _buildActionCard(Icons.person_add, 'New Offender',
                              onTap: () =>
                                  Get.toNamed(Routes.createOffender)),
                          _buildActionCard(CupertinoIcons.car, 'Add Vehicle',
                              onTap: () =>
                                  Get.toNamed(Routes.addVehicle)),
                          _buildActionCard(
                              Icons.add_comment_rounded, 'Add Complaint',
                              onTap: () => Get.toNamed(Routes.addComplaint)),
                          _buildActionCard(Icons.document_scanner, 'Scan Plate', onTap: () {
                            Get.toNamed(Routes.plateScanner);
                          }),
                        ],
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
           Text(
                '© 2025 Pocket Law. All rights reserved.',
                style: GoogleFonts.quattrocentoSans(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.right,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionCard(IconData icon, String title,
      {required VoidCallback onTap}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 1,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.blue[900]),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey[800]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActivityTile(String title, String description) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      tileColor: Colors.grey[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      leading: Icon(Icons.check_circle_outline, color: Colors.blue[900]),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.grey[800],
        ),
      ),
      subtitle: Text(
        description,
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey[600],
        ),
      ),
    );
  }
}
