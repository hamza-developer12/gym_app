import 'package:flutter/material.dart';
import 'package:gym_app/layouts/user_page_layout.dart';
import 'package:gym_app/providers/product_provider.dart';
import 'package:gym_app/screens/admin/edit_product_screen.dart';
import 'package:gym_app/screens/admin/product_details_screen.dart';
import 'package:gym_app/widgets/custom_button.dart'; // Add this line

class OurProductsAdminScreen extends StatefulWidget {
  const OurProductsAdminScreen({super.key});

  @override
  State<OurProductsAdminScreen> createState() => _OurProductsAdminScreenState();
}

class _OurProductsAdminScreenState extends State<OurProductsAdminScreen> {
  @override
  Widget build(BuildContext context) {
    return UserPageLayout(
      screenTitle: "Our Products",
      child: FutureBuilder(
        future: ProductProvider().getProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No products available'));
          } else {
            final products = snapshot.data;
            return ListView.builder(
              itemCount: products!.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    // Handle product details
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailsScreen(product: product),
                      ),
                    );
                  },
                  child: ListTile(
                      title: Text(product['productName']),
                      subtitle: Text(
                        "Price: ${product['price']}",
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.white),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditProductScreen(
                                    product: product,
                                  ),
                                ),
                              ).then((value) {
                                setState(() {});
                              });
                            },
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              // Handle delete action
                              showPopup(product['id'], product['publicId']);
                            },
                          ),
                        ],
                      )),
                );
              },
            );
          }
        },
      ),
    );
  }

  void showPopup(String id, String publicId) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Product'),
          content: const Text('Are you sure you want to delete this product?'),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                ProductProvider()
                    .deleteProduct(context, id, publicId)
                    .then((_) {
                  setState(() {});
                });
              },
              child: const Text("Confirm"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
          ],
        );
      },
    );
  }
}
