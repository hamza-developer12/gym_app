import 'package:flutter/material.dart';

class GymPackagesCard extends StatelessWidget {
  final String packageName;
  final String packageImage;
  final int packagePrice;
  final List<String> includes;
  const GymPackagesCard({
    super.key,
    required this.packageName,
    required this.packageImage,
    required this.packagePrice,
    required this.includes,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          width: double.infinity,
          // height: 226,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 2, color: Color(0xFFEE7E1A)),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.015,
              ),
              Text(
                '$packageName Monthly Package',
                style: const TextStyle(
                  color: Color(0xFFEE7E1A),
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              Container(
                // padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 200,
                      child: Image.asset(packageImage),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding:  EdgeInsets.only(bottom: height*0.02, right: width *0.02),
                      child: Column(
                          children: includes
                              .map((item) => Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      item,
                                      textAlign: TextAlign.justify,
                                    ),
                                  ))
                              .toList()),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(2),
            width: 150,
            height: 48,
            decoration: const ShapeDecoration(
              color: Color(0xFFEE7E1A),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
            child: Column(
              children: [
                Text(
                  "${packagePrice}pkr per month",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text("Purchase Now",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
          ),
        )
      ],
    );
  }
}
