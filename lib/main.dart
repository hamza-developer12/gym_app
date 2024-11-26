import 'package:flutter/material.dart';
import 'package:gym_app/screens/shared/login_screen.dart';
import 'package:gym_app/screens/shared/splash_screen.dart';
import 'package:gym_app/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  late int id = 2;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkTheme,
      home: LoginScreen(),
    );
  }
}
