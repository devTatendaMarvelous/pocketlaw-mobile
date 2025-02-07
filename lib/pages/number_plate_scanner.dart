import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:pocket_law/model/Vehicle.dart';
import 'dart:io';

import 'package:pocket_law/widgets/custom_buttom.dart';
import 'package:pocket_law/widgets/helper.dart';

import '../generated/assets.dart';
import '../services/vehicle_service.dart';

class NumberPlateScanner extends StatefulWidget {
  @override
  _NumberPlateScannerState createState() => _NumberPlateScannerState();
}

class _NumberPlateScannerState extends State<NumberPlateScanner> {
  final ImagePicker _imagePicker = ImagePicker();
  final VehicleService _vehicleService = VehicleService();
  late TextRecognizer textRecognizer;
  bool isProcessing = false;
  String scannedText = "";
  XFile? pickedImage;

  @override
  void initState() {
    super.initState();
    initializeTextRecognizer();
  }

  void initializeTextRecognizer() {
    textRecognizer = TextRecognizer();
  }

  Future<void> scanNumberPlate(ImageSource source) async {
    if (isProcessing) return;
    setState(() => isProcessing = true);

    try {
      final XFile? pickedFile = await _imagePicker.pickImage(source: source);
      if (pickedFile == null) {
        setState(() => isProcessing = false);
        return;
      }
      pickedImage = pickedFile;
      final inputImage = InputImage.fromFilePath(pickedFile.path);
      final recognizedText = await textRecognizer.processImage(inputImage);

      setState(() {
        scannedText = recognizedText.text;
        isProcessing = false;
      });

      if (scannedText.isNotEmpty) {
        fetchVehicleData(scannedText);
      }
    } catch (e) {
      showErrorDialog("Failed to scan text: $e");
      setState(() => isProcessing = false);
    }
  }

  // Future<void> fetchVehicleData(String regNumber) async {
  //   showLoadingDialog("Fetching vehicle data...");
  //   var vehicle = await _vehicleService.fetchVehicle(regNumber);
  //   // Get.back();
  //   Navigator.pop(context);
  //
  //   if (vehicle != null) {
  //     Get.defaultDialog(
  //       title: "Vehicle Found",
  //       content: Column(
  //         children: [
  //           Text("Make: ${vehicle.data?.make}"),
  //           Text("Model: ${vehicle.data?.model}"),
  //           Text("Color: ${vehicle.data?.color}"),
  //         ],
  //       ),
  //     );
  //   } else {
  //     Get.snackbar("Error", "No vehicle found", snackPosition: SnackPosition.BOTTOM);
  //   }
  // }

  // void showErrorDialog(String message) {
  //   Get.defaultDialog(title: "Error", middleText: message);
  // }


  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    textRecognizer.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.theme.cardColor,
        title: Text("Number Plate Scanner"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF030D49),
              Color(0xFF1D1E33),
            ],
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildImageSection(),
                    const SizedBox(height: 30),
                    _buildScanButtons(),
                    const SizedBox(height: 30),
                    _buildScannedTextSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageSection() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        width: double.infinity,
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xFF2A3372),
        ),
        child: pickedImage != null
            ? ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.file(
            File(pickedImage!.path),
            fit: BoxFit.cover,
          ),
        )
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.assetsTrackingNumber,
              height: 100,
            ),
            const SizedBox(height: 10),
            Text(
              'Scan a number plate',
              style: GoogleFonts.roboto(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScanButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildScanButton(
          icon: Icons.camera_alt,
          label: 'Camera',
          onTap: () => scanNumberPlate(ImageSource.camera),
        ),
        const SizedBox(width: 20),
        _buildScanButton(
          icon: Icons.photo_library,
          label: 'Gallery',
          onTap: () => scanNumberPlate(ImageSource.gallery),
        ),
      ],
    );
  }

  Widget _buildScanButton({required IconData icon, required String label, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 120,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: Get.theme.primaryColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Get.theme.primaryColor.withValues(alpha: 2)),
        ),
        child: Column(
          children: [
            Icon(icon, size: 30, color: Get.theme.primaryColor.withValues(alpha: 1)),
            const SizedBox(height: 8),
            Text(
              label,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w500,
                color: Colors.blueGrey.shade100,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScannedTextSection() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: scannedText.isNotEmpty
          ? GestureDetector(
        onTap: ()=> fetchVehicleData(scannedText),
            child: Card(
                    color: Get.theme.primaryColor,
                    child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Text(
                  'Scanned Text',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500,
                    color:Colors.black ,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  scannedText,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
                    ),
                  ),
          )
          : const SizedBox.shrink(),
    );
  }


  Future<void> fetchVehicleData(String regNumber) async {
    showLoadingDialog("Fetching vehicle data...");
    var vehicle = await _vehicleService.fetchVehicle(regNumber);
    Navigator.pop(context);

    if (vehicle != null) {
      Get.to(VehicleDetailScreen(vehicle: vehicle));
    } else {
      Get.snackbar(
        'Not Found',
        'No vehicle information found',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red[100],
        colorText: Colors.red,
      );
    }
  }
}

class VehicleDetailScreen extends StatelessWidget {
  final Vehicle vehicle;

  const VehicleDetailScreen({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vehicle Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Vehicle", style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold
                        ),)),
                    _buildDetailRow(Icons.directions_car, 'Make', vehicle.data?.make),
                    const Divider(),
                    _buildDetailRow(Icons.model_training, 'Model', vehicle.data?.model),
                    const Divider(),
                    _buildDetailRow(Icons.color_lens, 'Color', vehicle.data?.color),
                    const Divider(),
                    _buildDetailRow(Icons.confirmation_number, 'Registration', vehicle.data?.registrationNumber),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                        child: Text("Crimes", style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold
                        ),)),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                        itemCount: vehicle.data?.crimes?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return _buildCrimeRow(
                              CupertinoIcons.padlock,
                              "${vehicle.data!.crimes![index].crime!.name}",
                              vehicle.data?.crimes![index].status,
                              "${vehicle.data!.crimes![index].offender!.name}"
                          );
                        },),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Get.theme.primaryColor, size: 28),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value ?? 'N/A',
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget _buildCrimeRow(IconData icon, String label, String? value,String? offender) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Get.theme.primaryColor, size: 28),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value ?? 'N/A',
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(width: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Offender",
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                offender ?? 'N/A',
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
