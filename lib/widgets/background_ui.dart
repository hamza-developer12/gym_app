import 'package:flutter/material.dart';

class BackgroundUi extends StatelessWidget {
  final Widget child;
  const BackgroundUi({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/images/image_1.png",
            alignment: Alignment.center,
            fit: BoxFit.cover,
          ),
          child,
        ],
      ),
    );
  }
}
