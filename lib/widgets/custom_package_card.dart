import 'package:flutter/material.dart';

class CustomPackageCard extends StatelessWidget {
  final String image;
  final Widget widget;
  final String title;
  const CustomPackageCard({
    super.key,
    required this.image,
    required this.title,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => widget,
            ));
      },
      child: Column(
        children: [
          Container(
            width: 166,
            height: 182,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 2, color: Color(0xFFEE7E1A)),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: height * 0.01),
          Container(
            alignment: Alignment.center,
            width: 166,
            height: 36,
            decoration: ShapeDecoration(
              color: const Color(0xFFEE7E1A),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(title),
          )
        ],
      ),
    );
  }
}
