import 'package:flutter/material.dart';
import 'package:gym_app/layouts/user_page_layout.dart';
import 'package:gym_app/providers/product_provider.dart';
import 'package:gym_app/widgets/custom_button.dart';
import 'package:gym_app/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return UserPageLayout(
      screenTitle: "Add Product",
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.06,
            ),
            Consumer<ProductProvider>(
              builder: (context, value, child) => GestureDetector(
                onTap: () {
                  value.getImage();
                },
                child: Container(
                  width: 176,
                  height: 176,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFD9D9D9),
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 2, color: Color(0xFFEE7E1A)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: value.image == null
                      ? const Icon(
                          Icons.add_a_photo,
                          size: 40,
                          color: Colors.black,
                        )
                      : Image.file(value.image!),
                ),
              ),
            ),
            SizedBox(height: height * 0.05),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Enter Product Name',
                  style: TextStyle(
                    color: Color(0xFFFDFDFD),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
            CustomTextfield(
              hintText: "Enter Product Name",
              controller: productNameController,
              inputType: TextInputType.text,
            ),
            SizedBox(height: height * 0.01),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Enter Product Description',
                  style: TextStyle(
                    color: Color(0xFFFDFDFD),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
            CustomTextfield(
              hintText: "Enter Product Description",
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
                  'Enter Product Price',
                  style: TextStyle(
                    color: Color(0xFFFDFDFD),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
            CustomTextfield(
              hintText: "Enter Product Price",
              controller: productPriceController,
              inputType: TextInputType.text,
            ),
            SizedBox(height: height * 0.03),
            Consumer<ProductProvider>(
              builder: (context, value, child) => value.loading
                  ? const CircularProgressIndicator()
                  : CustomButton(
                      backgroundColor: Colors.deepOrange,
                      btnText: "Add Product",
                      textColor: Colors.white,
                      onTap: () {
                        value.addProduct(
                          context,
                          {
                            "productName": productNameController.text,
                            "description": productDescriptionController.text,
                            "price": productPriceController.text,
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

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    ProductProvider().resetImage();
  }
}
