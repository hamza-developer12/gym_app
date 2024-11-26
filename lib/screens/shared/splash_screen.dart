import 'package:flutter/material.dart';
import 'package:gym_app/screens/shared/login_screen.dart';
import 'package:gym_app/widgets/background_ui.dart';

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
    // Future.delayed(
    //     Duration(seconds: 3),
    //     () => {
    //           Navigator.pushReplacement(
    //             context,
    //             MaterialPageRoute(
    //               builder: (context) => const LoginScreen(),
    //             ),
    //           )
    //         });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return BackgroundUi(
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