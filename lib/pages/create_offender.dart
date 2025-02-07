import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:pocket_law/routes/routes.dart';
import 'package:pocket_law/services/offender_service.dart';
import 'package:pocket_law/widgets/custom_buttom.dart';

import '../generated/assets.dart';
import '../model/Offender.dart';
import '../widgets/custom_textformfield.dart';
import '../widgets/helper.dart';

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
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final OffenderService _offenderService = OffenderService();
  Data? _fetchedOffender;

  @override
  void dispose() {
    _idNumber.dispose();
    _name.dispose();
    _licenseNumber.dispose();
    _phoneNumber.dispose();
    _email.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue.shade900,
        title: Text("Offender Details"),
      ),
      body: SizedBox.expand(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF0A0E21),
                Color(0xFF1D1E33),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 200,
                        child: Image.asset(Assets.assetsTraff,color: Colors.white,)
                    ),
                    SizedBox(height: 20,),
                     Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            CustomTextFormField(
                              controller: _name,
                              labelText: 'Full Name of Offender',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter the full name of the offender';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            CustomTextFormField(
                              controller: _phoneNumber,
                              labelText: 'Phone Number',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter the phone number';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            CustomTextFormField(
                              controller: _email,
                              labelText: 'Email (optional)',
                            ),
                            const SizedBox(height: 20),
                            CustomTextFormField(
                              controller: _idNumber,
                              labelText: 'ID Number',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter the ID number';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            CustomTextFormField(
                              controller: _licenseNumber,
                              labelText: 'License Number',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter the license number';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: 350,
                              height: 50,
                              child: CustomButton(
                                label: "Charge",
                                onPressed: () {

                                  if (_formKey.currentState?.validate() ?? false) {
                                    _getOffender();
                                    _licenseNumber.clear();
                                    _name.clear();
                                    _idNumber.clear();
                                    _phoneNumber.clear();
                                    _email.clear();
                                  }

                                },
                              ),
                            ),
                          ],
                        )

                      ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _getOffender() async {
    final idNumber = _idNumber.text.trim();
    final name = _name.text.trim();
    final licenseNumber = _licenseNumber.text.trim();
    final phoneNumber = _phoneNumber.text.trim();
    final email = _email.text.trim();

    showLoadingDialog("Processing...");

    try {
      final offender = await _offenderService.getOffender(idNumber);

      if (offender != null && offender.data != null) {
        _fetchedOffender = offender.data;
        Navigator.of(Get.context!).pop();
        Get.toNamed(
          Routes.addCrime,
          arguments: {'offenderId': _fetchedOffender ?? {}
          },
        );
      } else {
        final newOffender =
        await _offenderService.addOffender(name, idNumber, licenseNumber,phoneNumber,email);

        Navigator.of(Get.context!).pop();

        if (newOffender != null && newOffender.data != null) {
          Get.snackbar('Success', 'Offender created successfully');
          Get.toNamed(
            Routes.addCrime,
            arguments: {'offenderId': newOffender.data?? {}},
          );
        } else {
          showMessageDialog('Failed to create offender');
          print('Failed to create a new offender.');
        }
      }
    } catch (e) {
      Get.back();
      showMessageDialog('Error processing offender: ${e.toString()}');
      print('Error fetching or adding offender: $e');
    }
  }
}
