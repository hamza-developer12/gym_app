import 'package:flutter/material.dart';
import 'package:gym_app/layouts/user_page_layout.dart';
import 'package:gym_app/providers/coins_provider.dart';
import 'package:gym_app/widgets/custom_textfield.dart';
import 'package:gym_app/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class ProvideCoinsScreen extends StatelessWidget {
  ProvideCoinsScreen({super.key});

  final _emailController = TextEditingController();
  final _coinsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return UserPageLayout(
      screenTitle: "Provide Coins",
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextfield(
            hintText: "Enter Email",
            controller: _emailController,
            inputType: TextInputType.emailAddress,
          ),
          SizedBox(height: height * 0.02),
          CustomTextfield(
            hintText: "Enter Coins",
            controller: _coinsController,
            inputType: TextInputType.number,
          ),
          SizedBox(height: height * 0.04),
          Consumer<CoinsProvider>(
            builder: (context, value, child) => value.loading
                ? const CircularProgressIndicator()
                : CustomButton(
                    backgroundColor: const Color(0xFFEE7E1A),
                    textColor: Colors.white,
                    btnText: "Provide Coins",
                    onTap: () {
                      value.provideCoins(context, {
                        "email": _emailController.text,
                        "coins": _coinsController.text,
                      });
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
