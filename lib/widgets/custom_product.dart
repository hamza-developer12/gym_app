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
      width: width * 0.4,
      // height: height * 0.2,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 2, color: Color(0xFFEE7E1A)),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Image.asset("assets/images/product_1.png"),
          Container(
            width: double.infinity,
            // height: 40,
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
                Text("RS: 6090",style: TextStyle(
                  // fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),),
                Text("Nitro Tech", style: TextStyle(
                  // fontSize: 14,
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
