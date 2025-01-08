import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:pocketlaw/routes/routes.dart';
import 'package:pocketlaw/services/offender_service.dart';
import 'package:pocketlaw/widgets/custom_buttom.dart';

import '../model/Offender.dart';

class CreateOffender extends StatefulWidget {
  CreateOffender({super.key});

  @override
  State<CreateOffender> createState() => _CreateOffenderState();
}

class _CreateOffenderState extends State<CreateOffender> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _idNumber = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _licenseNumber = TextEditingController();
  final OffenderService _offenderService = OffenderService();
  Data? _fetchedOffender;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue.shade900,
        foregroundColor: CupertinoColors.white,
        title: Text("Offender Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _name,
                decoration: InputDecoration(
                  labelText: 'Full Name of Offender',
                  labelStyle: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  contentPadding: const EdgeInsets.all(17.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(color: Colors.black)),
                ),
                cursorColor: Colors.black,
                style: const TextStyle(color: Colors.black),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the full name of the offender';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _idNumber,
                decoration: InputDecoration(
                  labelText: 'ID Number',
                  labelStyle: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  contentPadding: const EdgeInsets.all(17.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(color: Colors.black)),
                ),
                cursorColor: Colors.black,
                style: const TextStyle(color: Colors.black),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the ID number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _licenseNumber,
                decoration: InputDecoration(
                  labelText: 'License Number',
                  labelStyle: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  contentPadding: const EdgeInsets.all(17.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(color: Colors.black)),
                ),
                cursorColor: Colors.black,
                style: const TextStyle(color: Colors.black),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the license number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: CustomButton(
                  label: "Charge",
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      _getOffender();
                      _licenseNumber.clear();
                      _name.clear();
                      _idNumber.clear();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _getOffender() async {
    final idNumber = _idNumber.text.trim();
    final name = _name.text.trim();
    final licenseNumber = _licenseNumber.text.trim();

    try {
      final offender = await _offenderService.getOffender(idNumber);

      if (offender != null && offender.data != null) {
        _fetchedOffender = offender.data;
        Get.toNamed(
          Routes.addCrime,
          arguments: {'offenderId': _fetchedOffender ?? {}
          },
        );
      } else {
        final newOffender =
        await _offenderService.addOffender(name, idNumber, licenseNumber);

        if (newOffender != null && newOffender.data != null) {
          Get.toNamed(
            Routes.addCrime,
            arguments: {'offenderId': newOffender.data?? {}},
          );
        } else {
          print('Failed to create a new offender.');
        }
      }
    } catch (e) {
      print('Error fetching or adding offender: $e');
    }
  }
}
