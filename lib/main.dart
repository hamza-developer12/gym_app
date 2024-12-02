import 'package:flutter/material.dart';
import 'package:gym_app/screens/shared/splash_screen.dart';
import 'package:gym_app/screens/user/our_products_screen.dart';
import 'package:gym_app/screens/user/user_home_screen.dart';
import 'package:gym_app/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkTheme,
      home: SplashScreen(),
    );
  }
}
