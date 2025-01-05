import 'package:flutter/material.dart';
import 'package:gym_app/providers/auth_provider.dart';
import 'package:gym_app/widgets/background_ui.dart';
import 'package:gym_app/widgets/custom_button.dart';
import 'package:gym_app/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return BackgroundUi(
      imagePath: "assets/images/image_1.png",
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo.png"),
              Consumer<AuthProvider>(
                builder: (context, value, child) => GestureDetector(
                  onTap: () {
                    value.getImage();
                  },
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: height * 0.01, bottom: height * 0.01),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(50),
                          image: value.image != null
                              ? DecorationImage(
                                  image: FileImage(value.image!),
                                  fit: BoxFit.cover)
                              : null,
                        ),
                        child: value.image == null
                            ? const Icon(
                                Icons.person,
                                size: 50,
                                color: Colors.grey,
                              )
                            : null,
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: const ShapeDecoration(
                            color: Colors.orange,
                            shape: CircleBorder(
                              side: BorderSide(
                                  width: 2, color: Color(0xFFEC7E1B)),
                            ),
                          ),
                          child: const Icon(
                            size: 20,
                            Icons.add_a_photo,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: height * 0.01),
              CustomTextfield(
                hintText: "Enter Full Name",
                controller: nameController,
                inputType: TextInputType.text,
              ),
              SizedBox(height: height * 0.015),
              CustomTextfield(
                hintText: "Enter Email",
                controller: emailController,
                inputType: TextInputType.emailAddress,
              ),
              SizedBox(height: height * 0.015),
              CustomTextfield(
                hintText: "Enter Phone No",
                controller: phoneController,
                inputType: TextInputType.phone,
              ),
              SizedBox(height: height * 0.015),
              CustomTextfield(
                hintText: "Enter Password",
                controller: passwordController,
                inputType: TextInputType.text,
                obscureText: true,
              ),
              SizedBox(height: height * 0.03),
              Consumer<AuthProvider>(
                builder: (context, value, child) => value.loading
                    ? const CircularProgressIndicator()
                    : CustomButton(
                        btnText: "Signup",
                        backgroundColor: const Color(0xFFEC7E1B),
                        textColor: Colors.white,
                        onTap: () {
                          value.signup(
                              context,
                              {
                                "name": nameController.text,
                                "email": emailController.text,
                                "phone": phoneController.text,
                              },
                              passwordController.text);
                        },
                      ),
              ),
              SizedBox(height: height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Go back to signin"),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
