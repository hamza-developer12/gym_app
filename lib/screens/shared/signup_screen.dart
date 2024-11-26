import 'package:flutter/material.dart';
import 'package:gym_app/widgets/background_ui.dart';
import 'package:gym_app/widgets/custom_button.dart';
import 'package:gym_app/widgets/custom_textfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return BackgroundUi(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png"),
            Stack(
              children: [
                Container(
                  width: 100,
                  height: 150,
                  decoration: const ShapeDecoration(
                    color: Colors.white,
                    shape: CircleBorder(
                      side: BorderSide(width: 2, color: Color(0xFFEC7E1B)),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 28,
                  right: 2,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const ShapeDecoration(
                      color: Colors.orange,
                      shape: CircleBorder(
                        side: BorderSide(width: 2, color: Color(0xFFEC7E1B)),
                      ),
                    ),
                    child: const Icon(
                      size: 16,
                      Icons.add_a_photo,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: height * 0.01),
            CustomTextfield(
              hintText: "Enter Full Name",
              controller: nameController,
              inputType: TextInputType.text,
            ),
            SizedBox(height: height * 0.015),
            CustomTextfield(
              hintText: "Enter Mobile Number",
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
            SizedBox(
              child: CustomButton(
                  backgroundColor: const Color(0xFFEC7E1B),
                  btnText: "Sign Up",
                  textColor: Colors.white,
                  onTap: () {}),
            ),
            SizedBox(height: height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? "),
                Text("Go back to signin")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
