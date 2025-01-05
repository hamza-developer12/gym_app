import 'package:flutter/material.dart';
import 'package:gym_app/data/products_data.dart';
import 'package:gym_app/layouts/user_page_layout.dart';
import 'package:gym_app/widgets/custom_product.dart';

class OurProductsScreen extends StatefulWidget {
  const OurProductsScreen({super.key});

  @override
  State<OurProductsScreen> createState() => _OurProductsScreenState();
}

class _OurProductsScreenState extends State<OurProductsScreen> {
  ProductsData products = ProductsData();

  
  @override
  Widget build(BuildContext context) {
    List productsData = products.data;
    final height = MediaQuery.of(context).size.height;

    return UserPageLayout(
      screenTitle: 'Our Products',
      child: Column(
        children: [
          SizedBox(height: height * 0.01),
          const Text("Visit our indoor store to purchase \n the product.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            )
          ),
          SizedBox(height: height * 0.01),
          Row(
            children: [
              ProductShow(productsData[0]),
              ProductShow(productsData[1])
            ],
          )
        ],
      )
    );
  }
Widget ProductShow(Map<String,dynamic> product) {
    return Container(
      width: 165,
      height: 200,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 2, color: Color(0xFFEE7E1A)),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(product['imageUrl']),
          SizedBox(
            child: Container(
              decoration: ShapeDecoration(
                color: Color(0xFFEE7E1A),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 2,
                      color: Color(0xFFEE7E1A)),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Text(product['title'],
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(product['price'].toString()),
                  Padding(padding: EdgeInsets.symmetric(vertical: 2),),
                ],
              ),
            ),
          )
        ],
      ),
    );
}
}
