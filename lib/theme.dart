import 'package:flutter/material.dart';

class AppTheme {
  static const primaryColor = Color(0x00000000);
  static ThemeData darkTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: primaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: primaryColor,
      onSurface: Colors.white,
    ),
  );
}
