import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final int? maxLines;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    this.validator, this.prefixIcon, this.suffixIcon, this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      controller: controller,
      decoration: InputDecoration(

        labelText: labelText,
        labelStyle: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold),
        contentPadding: const EdgeInsets.all(17.0),
        filled: true,
        fillColor: Colors.blueGrey[50],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(color: Colors.blue.shade900),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(color: Colors.blue.shade600), // Normal state
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(color: Colors.blue.shade900),
        ),
      ),
      cursorColor: Colors.black,
      style: const TextStyle(color: Colors.black),
      validator: validator,
    );
  }
}
