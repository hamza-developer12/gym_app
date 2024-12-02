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
    drawerTheme: const DrawerThemeData(
      backgroundColor: Color(0xFFEC7E1B),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFFEC7E1B),
        shape: CircleBorder(),
        foregroundColor: Colors.white,
        sizeConstraints: BoxConstraints.tightFor(
          width: 80,
          height: 80,
        )),
    iconTheme: const IconThemeData(color: Color(0xFFEC7E1B)),
  );
}
