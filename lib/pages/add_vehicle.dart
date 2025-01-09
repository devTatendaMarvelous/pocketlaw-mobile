import 'package:flutter/material.dart';
import 'package:pocket_law/services/vehicle_service.dart';
import 'package:pocket_law/widgets/custom_buttom.dart';

import '../widgets/custom_textformfield.dart';
import 'confirmed_payment.dart';


class AddVehiclePage extends StatelessWidget {
  final TextEditingController makeController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  final TextEditingController registrationController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AddVehiclePage({super.key});

  final VehicleService _vehicleService = VehicleService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Add Vehicle', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextFormField(
                controller: makeController,
                labelText: 'Make',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the vehicle make';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                controller: modelController,
                labelText: 'Model',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the vehicle model';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                controller: colorController,
                labelText: 'Color',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the vehicle color';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                controller: registrationController,
                labelText: 'Registration Number',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the registration number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              Center(
                child: SizedBox(
                  width: 300,
                  child: CustomButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        // Handle form submission
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20), // Rounded corners
                            ),
                            title: const Text(
                              'Confirm Vehicle Details',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            content: SizedBox(
                              width: MediaQuery.sizeOf(context).width*0.9,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  buildDetailRow('Make:', makeController.text),
                                  const SizedBox(height: 8),
                                  buildDetailRow('Model:', modelController.text),
                                  const SizedBox(height: 8),
                                  buildDetailRow('Color:', colorController.text),
                                  const SizedBox(height: 8),
                                  buildDetailRow('Registration:', registrationController.text),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(); // Close dialog
                                },
                                child: const Text(
                                  'Cancel',
                                ),
                              ),
                              CustomButton(
                                onPressed: () {
                                  _vehicleService.addVehicle(
                                    makeController.text,
                                    modelController.text,
                                    colorController.text,
                                    registrationController.text,
                                  );
                                  Navigator.of(context).pop(); // Close dialog

                                },
                                label: 'Confirm',
                                fontWeight: FontWeight.w800,
                              ),
                            ],
                          ),
                        );
                      }
                    },

                    label: 'Add Vehicle',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}