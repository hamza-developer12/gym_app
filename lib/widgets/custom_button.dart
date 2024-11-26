import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color backgroundColor;
  final String btnText;
  final Color textColor;
  final VoidCallback onTap;
  const CustomButton(
      {super.key,
      required this.backgroundColor,
      required this.btnText,
      required this.textColor,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          color: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          btnText,
          style: TextStyle(
            color: textColor,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
