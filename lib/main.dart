import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/providers/auth_provider.dart';
import 'package:gym_app/providers/coins_provider.dart';
import 'package:gym_app/providers/product_provider.dart';
import 'package:gym_app/providers/user_provider.dart';
import 'package:gym_app/screens/admin/admin_home_screen.dart';
import 'package:gym_app/screens/shared/signup_screen.dart';
import 'package:gym_app/screens/shared/splash_screen.dart';
import 'package:gym_app/screens/user/our_products_screen.dart';
import 'package:gym_app/screens/user/user_home_screen.dart';
import 'package:gym_app/services/storage_services.dart';
import 'package:gym_app/theme.dart';
import 'package:gym_app/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await StorageServices().init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => CoinsProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: SplashScreen(),
    );
  }
}
