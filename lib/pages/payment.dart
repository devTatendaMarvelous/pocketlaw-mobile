import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocket_law/auth/authModel.dart';
import 'package:pocket_law/services/payment_service.dart';
import 'package:pocket_law/widgets/custom_textfield.dart';
import 'package:scoped_model/scoped_model.dart';

import '../generated/assets.dart';
import '../widgets/custom_buttom.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String? selectedCurrency;
  int? selectedCurrencyId;
  String? selectedPaymentMethod;
  int? selectedPaymentMethodId;

  final crimeId = Get.arguments['crimeId'];
  bool showPhoneNumberField = false;
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final PaymentService _paymentService = PaymentService();


  late AuthModel _auth;


  @override
  Widget build(BuildContext context) {

    _auth = ScopedModel.of<AuthModel>(context, rebuildOnChange: true);
    final paymentMethods = _auth.paymentMethods;
    final currencyOptions = _auth.currencies;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue.shade900,
        foregroundColor: CupertinoColors.white,
        title: Text("Add Payment"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            SizedBox(
                height: 150,
                child: Image.asset(Assets.assetsCreditCard)
            ),
            const SizedBox(height: 40),
            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Select Payment Method',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: paymentMethods.map((method) {
                  return ChoiceChip(
                    label: Text(
                      method['name'],
                      style: TextStyle(
                        color: selectedPaymentMethod == method['name']
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                    selected: selectedPaymentMethod == method['name'],
                    onSelected: (selected) {
                      setState(() {
                        selectedPaymentMethod = selected ? method['name'] : null;
                        selectedPaymentMethodId = selected ? method['id'] : null;
                        // Toggle visibility for the phone number field
                        showPhoneNumberField =
                            selectedPaymentMethod == "Ecocash USD";
                      });
                    },
                    selectedColor: Colors.blue,
                    backgroundColor: Colors.grey[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),

            if (showPhoneNumberField)
              Column(
                children: [
                  CustomTextField(
                    controller: _phoneNumberController,
                      label: "Phone Number"),
                  const SizedBox(height: 20),
                ],
              ),
            DropdownButtonFormField2<Map<String,dynamic>>(
              decoration: InputDecoration(
                labelText: 'Select Currency',
                labelStyle: TextStyle(
                  color: Colors.black
                ),
                contentPadding: const EdgeInsets.all(17.0),
                border: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(5.0),
                    borderSide:
                    const BorderSide(color: Colors.black)),
              ),
              value: selectedCurrency != null
                      ? currencyOptions.firstWhere((currency) => currency['name'] == selectedCurrency,
                    orElse: ()=> {'id': null, 'name': null},)
                      : null,
              items: currencyOptions.map((currency) {
                return DropdownMenuItem(
                  value: currency,
                  child: Text(
                        currency['name'],
                        style: const TextStyle(fontSize: 16),),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCurrency = value?['name'];
                  selectedCurrencyId = value?['id'];
                });
              },
              dropdownStyleData: DropdownStyleData(
                maxHeight: 200,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              iconStyleData: IconStyleData(
                icon: Icon(Icons.arrow_drop_down, color: Colors.blue[900]),
                iconSize: 24,
              ),
            ),

            const SizedBox(height: 20),
            CustomTextField(label: "Amount", controller: _amountController,),
            const SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: 200,
                child: CustomButton(
                  label: "Process",
                  onPressed: () {
                    print("payment id :......$selectedPaymentMethodId");
                    print("currency id :......$selectedCurrencyId");
                    print("crime id :......$crimeId");
                    double? amount = double.tryParse(_amountController.text);
                    _paymentService.addPayment(crimeId, selectedPaymentMethodId!, amount!, selectedCurrencyId!,_phoneNumberController.text);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
