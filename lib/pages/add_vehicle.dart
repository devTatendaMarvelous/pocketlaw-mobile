import 'package:flutter/material.dart';
import 'package:pocket_law/widgets/custom_buttom.dart';

import '../widgets/custom_textformfield.dart';


class AddVehiclePage extends StatelessWidget {
  final TextEditingController makeController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  final TextEditingController registrationController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AddVehiclePage({super.key});

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
                            title: const Text('Vehicle Added'),
                            content: const Text('The vehicle details have been saved successfully!'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text('OK'),
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