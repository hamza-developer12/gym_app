import 'package:flutter/material.dart';
import 'package:gym_app/data/products_data.dart';
import 'package:gym_app/layouts/user_page_layout.dart';

class OurProductsScreen extends StatefulWidget {
  const OurProductsScreen({super.key});

  @override
  State<OurProductsScreen> createState() => _OurProductsScreenState();
}

class _OurProductsScreenState extends State<OurProductsScreen> {
  ProductsData products = ProductsData();

  @override
  Widget build(BuildContext context) {
    return UserPageLayout(
      screenTitle: 'Our Products',
      child: Stack(
        children: [
          // Background image
          // Positioned.fill(
          //   child: Opacity(
          //     opacity: 0.3, // Adjust opacity for dimming effect
          //     child: Image.asset(
          //       "assets/images/bg_image.png", // Path to your background image
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
          // // Content on top of the background
          // Padding(
          //   padding:
          //       const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          //   child: Column(
          //     children: [
          //       const SizedBox(height: 16), // Top spacing
          //       const Text(
          //         "Visit our indoor store to purchase the products.",
          //         textAlign: TextAlign.center,
          //         style: TextStyle(
          //           fontSize: 18,
          //           color: Colors.black, // Text color over the background
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //       const SizedBox(height: 16), // Spacing between text and grid
          //       Expanded(
          //         child: GridView.builder(
          //           gridDelegate:
          //               const SliverGridDelegateWithFixedCrossAxisCount(
          //             crossAxisCount: 2, // Number of columns
          //             crossAxisSpacing: 10, // Spacing between columns
          //             mainAxisSpacing: 10, // Spacing between rows
          //           ),
          //           itemCount: products.data.length,
          //           itemBuilder: (context, index) {
          //             final product = products.data[index];
          //             return Card(
          //               elevation: 5,
          //               shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(10),
          //               ),
          //               child: Column(
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 children: [
          //                   // Product image
          //                   Expanded(
          //                     child: ClipRRect(
          //                       borderRadius: const BorderRadius.vertical(
          //                         top: Radius.circular(10),
          //                       ),
          //                       child: Image.network(
          //                         product[
          //                             'imageUrl'], // Replace with your image URL
          //                         fit: BoxFit.cover,
          //                         errorBuilder: (context, error, stackTrace) =>
          //                             const Icon(
          //                                 Icons.error), // Error placeholder
          //                       ),
          //                     ),
          //                   ),
          //                   // Product details
          //                   Padding(
          //                     padding: const EdgeInsets.all(8.0),
          //                     child: Column(
          //                       children: [
          //                         Text(
          //                           product['title'],
          //                           style: const TextStyle(
          //                             fontWeight: FontWeight.bold,
          //                             fontSize: 14,
          //                           ),
          //                         ),
          //                         const SizedBox(height: 4),
          //                         Text(
          //                           "\$${product['price']}",
          //                           style: const TextStyle(
          //                             color: Colors.green,
          //                             fontWeight: FontWeight.bold,
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             );
          //           },
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
