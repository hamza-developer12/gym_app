import 'package:flutter/material.dart';

class CustomTimerCard extends StatefulWidget {
  const CustomTimerCard({super.key});

  @override
  State<CustomTimerCard> createState() => _CustomTimerCardState();
}

class _CustomTimerCardState extends State<CustomTimerCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 117,
      decoration: ShapeDecoration(
        gradient: const LinearGradient(
          begin: Alignment(1.00, 0.00),
          end: Alignment(-1, 0),
          colors: [Color(0xFFEE7E1A), Colors.black],
        ),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFEE7E1A)),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Row(
        children: [
          Container(
            child: const Column(),
          ),
          Container()
        ],
      ),
    );
  }
}
