import 'package:flutter/material.dart';

class CustomProduct extends StatelessWidget {
  final String imageUrl;
  final int price;
  final String title;
  final String description;
  const CustomProduct({
    super.key,
    required this.imageUrl,
    required this.price,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: 168,
      height: 182,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 2, color: Color(0xFFEE7E1A)),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              imageUrl,
              width: width * 1,
            ),
          ),
          SizedBox(height: height * 0.001),
          Container(
            width: 165,
            decoration: const ShapeDecoration(
              color: Color(0xFFEE7E1A),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: height * 0.01),
                Text("RS: $price",
                    style: const TextStyle(
                      fontSize: 17,
                    )),
                Text(title,
                    style: const TextStyle(
                      fontSize: 16,
                    )),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
