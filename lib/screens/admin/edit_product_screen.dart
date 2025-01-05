import 'package:flutter/material.dart';
import 'package:gym_app/layouts/user_page_layout.dart';
import 'package:gym_app/providers/product_provider.dart';
import 'package:gym_app/widgets/custom_button.dart';
import 'package:gym_app/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class EditProductScreen extends StatefulWidget {
  final Map<String, dynamic> product;
  const EditProductScreen({super.key, required this.product});

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  late TextEditingController productNameController;
  late TextEditingController productDescriptionController;
  late TextEditingController productPriceController;

  @override
  void initState() {
    super.initState();
    productNameController =
        TextEditingController(text: widget.product['productName'] ?? '');
    productDescriptionController =
        TextEditingController(text: widget.product['description'] ?? '');
    productPriceController =
        TextEditingController(text: widget.product['price'] ?? '');
  }

  @override
  void dispose() {
    productNameController.dispose();
    productDescriptionController.dispose();
    productPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return UserPageLayout(
      screenTitle: "Edit Product",
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.06,
            ),
            SizedBox(height: height * 0.05),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Product Name',
                  style: TextStyle(
                    color: Color(0xFFFDFDFD),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
            CustomTextfield(
              hintText: "Product Name",
              controller: productNameController,
              inputType: TextInputType.text,
            ),
            SizedBox(height: height * 0.01),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Product Description',
                  style: TextStyle(
                    color: Color(0xFFFDFDFD),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
            CustomTextfield(
              hintText: "Product Description",
              maxLines: 5,
              controller: productDescriptionController,
              inputType: TextInputType.text,
            ),
            SizedBox(height: height * 0.01),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Product Price',
                  style: TextStyle(
                    color: Color(0xFFFDFDFD),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
            CustomTextfield(
              hintText: "Product Price",
              controller: productPriceController,
              inputType: TextInputType.number,
            ),
            SizedBox(height: height * 0.03),
            Consumer<ProductProvider>(
              builder: (context, value, child) => value.loading
                  ? const CircularProgressIndicator()
                  : CustomButton(
                      backgroundColor: Colors.deepOrange,
                      btnText: "Update Product",
                      textColor: Colors.white,
                      onTap: () {
                        print(productPriceController.text);
                        value.updateProduct(
                          context,
                          {
                            "productName":
                                productNameController.text.toString(),
                            "description":
                                productDescriptionController.text.toString(),
                            "price": productPriceController.text.toString(),
                            "id": widget.product['id'],
                          },
                        );
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}
