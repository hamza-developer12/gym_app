import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/layouts/user_page_layout.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return UserPageLayout(
      screenTitle: "Product Details",
      child: Column(
        children: [
          SizedBox(height: height * 0.03),
          CachedNetworkImage(
            imageUrl: product['image'],
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          SizedBox(height: height * 0.03),
          Text(
            product['productName'],
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: height * 0.008),
          Text(
            "Price: ${product['price']}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          SizedBox(height: height * 0.03),
          Text(
            product['description'],
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
