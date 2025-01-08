import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.label, this.controller});

  final TextEditingController? controller;

  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold
          ),
          contentPadding: const EdgeInsets.all(17.0),
          border: OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(5.0),
              borderSide:
              const BorderSide(color: Colors.black)),
          focusedBorder: OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(5.0),
              borderSide:
              const BorderSide(color: Colors.black)),
          enabled: true),
      cursorColor: Colors.black,
      style: const TextStyle(color: Colors.black),
      validator: (val) {
        if (val!.isEmpty) {
          return "Password cannot be empty";
        } else if (val.length < 4) {
          return "Password PIN length";
        } else {
          return null;
        }
      },
    );
  }
}
