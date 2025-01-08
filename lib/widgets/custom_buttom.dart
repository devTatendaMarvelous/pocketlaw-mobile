import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.label, required this.onPressed, this.fontWeight, this.fontSize});

  final String label;
  final Function() onPressed;
  final FontWeight? fontWeight;
  final double? fontSize;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue[900],
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
        child: Text(
            label,style: TextStyle(
          color: Colors.white,
          fontWeight: fontWeight,
          fontSize: fontSize
        ),
        ),
    );
  }
}
