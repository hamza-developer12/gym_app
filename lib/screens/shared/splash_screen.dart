import 'package:flutter/material.dart';
import 'package:gym_app/screens/shared/login_screen.dart';
import 'package:gym_app/services/storage_services.dart';
import 'package:gym_app/widgets/background_ui.dart';
import 'package:gym_app/screens/admin/admin_home_screen.dart';
import 'package:gym_app/screens/user/user_home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
        const Duration(seconds: 3),
        () => {
              StorageServices().getData("role").then((value) {
                if (value == "admin") {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AdminHomeScreen()));
                } else if (value == "user") {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserHomeScreen()));
                } else {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                }
              })
            });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return BackgroundUi(
      imagePath: "assets/images/image_1.png",
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/logo.png"),
          SizedBox(height: height * 0.15),
          const CircularProgressIndicator(
            color: Color(0xFFEC7E1B),
            strokeWidth: 4,
          )
        ],
      ),
    );
  }
}
