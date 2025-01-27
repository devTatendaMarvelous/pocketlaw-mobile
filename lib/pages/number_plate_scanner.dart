import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'dart:io';

import 'package:pocket_law/widgets/custom_buttom.dart';

import '../generated/assets.dart';

class NumberPlateScanner extends StatefulWidget {
  @override
  _NumberPlateScannerState createState() => _NumberPlateScannerState();
}

class _NumberPlateScannerState extends State<NumberPlateScanner> {
  final ImagePicker _imagePicker = ImagePicker();
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

    setState(() {
      isProcessing = true;
    });

    try {
      final XFile? pickedFile = await _imagePicker.pickImage(source: source);
      if (pickedFile == null) {
        setState(() {
          isProcessing = false;
        });
        return;
      }

      pickedImage = pickedFile;
      final inputImage = InputImage.fromFilePath(pickedFile.path);
      final recognizedText = await textRecognizer.processImage(inputImage);

      setState(() {
        scannedText = recognizedText.text;
      });
    } catch (e) {
      print("Error during text recognition: $e");
      showErrorDialog("Failed to scan text: $e");
    } finally {
      setState(() {
        isProcessing = false;
      });
    }
  }

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
        title: Text("Number Plate Scanner"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            pickedImage != null
              ? Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.file(
                    File(pickedImage!.path),
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              )
              : SizedBox(
                    height: 150,
                    child: Image.asset(Assets.assetsTrackingNumber)
                    ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 150,
                  child: CustomButton(
                    onPressed: () => scanNumberPlate(ImageSource.camera),
                    label : isProcessing ? "Scanning..." : "Camera 📷",
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: CustomButton(
                    onPressed: () => {
                      scanNumberPlate(ImageSource.gallery),
                    },
                    label : isProcessing ? "Scanning..." : "Gallery 🌌",
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              scannedText.isNotEmpty ? "Scanned Text:" : "No text scanned yet.",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              scannedText,
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
