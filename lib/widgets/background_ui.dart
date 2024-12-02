import 'package:flutter/material.dart';

class BackgroundUi extends StatelessWidget {
  final String imagePath;
  final Widget child;
  const BackgroundUi({
    super.key,
    required this.child,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            imagePath,
            alignment: Alignment.center,
            fit: BoxFit.cover,
          ),
          child,
        ],
      ),
    );
  }
}
