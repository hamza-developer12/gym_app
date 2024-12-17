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
          Text("Visit our indoor store to purchase \n the product.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            )
          ),
          SizedBox(height: height * 0.01),
          // Expanded(
          //   child: GridView(
          //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //           crossAxisCount: 2,
          //         crossAxisSpacing: 10,
          //         mainAxisSpacing: 40,
          //
          //       ),
          //     children: productsData.map(
          //             (item)=>CustomProduct(
          //                 imageUrl: item['imageUrl'],
          //                 price: item['price'],
          //                 title: item['title'],
          //                 description: item['description']
          //             )).toList(),
          //   ),
          // ),

        ],
      )
    );
  }
}
