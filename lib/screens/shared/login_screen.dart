import 'package:flutter/material.dart';
import 'package:gym_app/providers/auth_provider.dart';
import 'package:gym_app/screens/shared/signup_screen.dart';
import 'package:gym_app/screens/user/user_home_screen.dart';
import 'package:gym_app/widgets/background_ui.dart';
import 'package:gym_app/widgets/custom_button.dart';
import 'package:gym_app/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
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
              SizedBox(height: height * 0.1),
              CustomTextfield(
                hintText: "Enter Email ",
                controller: emailController,
                inputType: TextInputType.phone,
              ),
              SizedBox(height: height * 0.02),
              CustomTextfield(
                hintText: "Enter Password",
                controller: passwordController,
                inputType: TextInputType.text,
                obscureText: true,
              ),
              SizedBox(height: height * 0.02),
              Container(
                margin: const EdgeInsets.only(right: 8),
                alignment: Alignment.centerRight,
                child: const Text("Forgot Password?"),
              ),
              SizedBox(height: height * 0.025),
              Consumer<AuthProvider>(
                builder: (context, value, child) => SizedBox(
                  width: value.loading ? null : double.infinity,
                  child: value.loading
                      ? const CircularProgressIndicator()
                      : CustomButton(
                          backgroundColor: const Color(0xFFEC7E1B),
                          btnText: "Sign In",
                          textColor: Colors.white,
                          onTap: () {
                            value.login(context, {
                              "email": emailController.text,
                              "password": passwordController.text,
                            });
                          },
                        ),
                ),
              ),
              SizedBox(height: height * 0.01),
              const Text(
                "Or",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: height * 0.01),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  backgroundColor: Colors.white,
                  btnText: "Create Account",
                  textColor: Colors.black,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignupScreen(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
