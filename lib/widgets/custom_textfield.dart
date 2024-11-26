import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType inputType;
  final bool obscureText;
  const CustomTextfield({
    super.key,
    required this.hintText,
    required this.controller,
    required this.inputType,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 2, color: Color(0xFFEC7E1B)),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: inputType,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.transparent,
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.white,
            letterSpacing: 2,
          ), // Hint text color
        ),
      ),
    );
  }
}
