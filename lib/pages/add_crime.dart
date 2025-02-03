import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocket_law/routes/routes.dart';
import 'package:pocket_law/services/crime_service.dart';
import 'package:pocket_law/widgets/custom_buttom.dart';
import 'package:pocket_law/widgets/custom_textformfield.dart';
import 'package:pocket_law/widgets/helper.dart';
import 'package:scoped_model/scoped_model.dart';

import '../auth/authModel.dart';
import '../model/Vehicle.dart';
import '../services/vehicle_service.dart';
import 'confirmed_payment.dart';

class AddCrime extends StatefulWidget {
  const AddCrime({super.key});

  @override
  State<AddCrime> createState() => _AddCrimeState();
}

class _AddCrimeState extends State<AddCrime> {
  String? selectedCrime;

  int? selectedCrimeId;

  final TextEditingController _regNumberController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final VehicleService _vehicleService = VehicleService();
  final CrimeServices _crimeServices = CrimeServices();
  final offenderId = Get.arguments['offenderId'];

  late AuthModel _auth;

  @override
  Widget build(BuildContext context) {

    _auth = ScopedModel.of<AuthModel>(context, rebuildOnChange: true);
    final crimeOptions = _auth.crimesList;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue.shade900,
        foregroundColor: CupertinoColors.white,
        title: Text("Add Offence"),
      ),
      body: Center(
        child: SizedBox.expand(
          child: Container(
            decoration: containerDecoration(),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  spacing: 24,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      elevation: 0,
                      color: Colors.white.withValues(alpha: 0.2),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Offender Details",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[50],
                              ),
                            ),

                            const SizedBox(height: 10),
                            buildDetailRow('Name', "${offenderId.name}"),
                            const Divider(),
                            buildDetailRow('ID Number', '${offenderId.idNumber}'),
                            const Divider(),
                            buildDetailRow('License Number', "${offenderId.licenseNumber}"),
                          ],
                        ),
                      ),
                    ),
                    DropdownButtonFormField2<Map<String, dynamic>>(
                      style: TextStyle(
                        color: Colors.white
                      ),
                      decoration: InputDecoration(
                        labelText: 'Select Crime',
                        labelStyle: TextStyle(
                            color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                        contentPadding: const EdgeInsets.all(17.0),
                        border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(5.0),
                            borderSide:
                            const BorderSide(color: Colors.black)),
                      ),
                      value: selectedCrime != null
                          ? crimeOptions.firstWhere(
                            (crime) => crime['name'] == selectedCrime,
                        orElse: () => {'id': null, 'name': null},
                      )
                          : null,
                      items: crimeOptions.map((crime) {
                        return DropdownMenuItem(
                          value: crime,
                          child: Text(
                            crime['name'],
                            style: const TextStyle(fontSize: 16),),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedCrime = value?['name'];
                          selectedCrimeId = value?['id'];
                        });
                      },
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: 200,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFF0A0E21),
                              Color(0xFF1D1E33),
                            ],
                          ),
                        ),
                      ),
                      iconStyleData: IconStyleData(
                        icon: Icon(Icons.arrow_drop_down, color: Colors.blue[900]),
                        iconSize: 24,
                      ),

                    ),
                    CustomTextFormField(controller: _regNumberController, labelText: 'Vehicle Reg. Number'),
                    CustomTextFormField(controller: _locationController, labelText: 'Location'),



                    Center(
                      child: SizedBox(
                        width: 350,
                        child: CustomButton(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          label: "Process",
                          onPressed: () => {
                            print("Selected Crime ID: ${selectedCrimeId ?? 'None'}"),
                            _fetchVehicle(),

                          },
                        ),
                      ),
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

  void _fetchVehicle() async {
    final regNumber = _regNumberController.text.trim();
    if (regNumber.isEmpty) {
      setState(() {
      });
      return;
    }

    final vehicle = await _vehicleService.fetchVehicle(regNumber);
    setState(() {
      if (vehicle != null && vehicle.data != null) {
        _showVehicleConfirmationDialog(vehicle.data!);
      } else {
      }
    });
  }

  void _showVehicleConfirmationDialog(Data vehicleData) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            height: MediaQuery.sizeOf(context).height*0.5,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF0A0E21),
                  Color(0xFF1D1E33),
                ],
              ),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(16),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Confirm Vehicle Information',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 16),
                buildDetailRow('Make:', '${vehicleData.make}'),
                const SizedBox(height: 8),
                buildDetailRow('Model:', "${vehicleData.model}"),
                const SizedBox(height: 8),
                buildDetailRow('Color:', '${vehicleData.color}'),
                const SizedBox(height: 8),
                buildDetailRow('Registration Number:', '${vehicleData.registrationNumber}'),
                const SizedBox(height: 24),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 350,
                    child: CustomButton(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      onPressed: () async {
                        Navigator.of(context).pop();
                        var result = await _crimeServices.addCrime(
                          vehicleData.id!,
                          offenderId.id,
                          selectedCrimeId!,
                          _locationController.text,
                        );
                        _locationController.clear();
                        _regNumberController.clear();

                        if (result) {
                          Get.toNamed(
                            Routes.payment,
                            arguments: {'crimeId': selectedCrimeId},
                          );
                          setState(() {
                            selectedCrime = null;
                          });
                        }
                      },
                      label:'Confirm',
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }



}




