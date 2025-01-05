import 'package:flutter/material.dart';
import 'package:gym_app/layouts/user_page_layout.dart';
import 'package:gym_app/providers/coins_provider.dart';
import 'package:gym_app/widgets/custom_button.dart';
import 'package:gym_app/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class RequestCoins extends StatelessWidget {
  RequestCoins({super.key});

  final TextEditingController _coinsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return UserPageLayout(
      screenTitle: "Request Coins",
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextfield(
            hintText: "Enter Coins",
            controller: _coinsController,
            inputType: TextInputType.number,
          ),
          SizedBox(height: height * 0.035),
          Consumer<CoinsProvider>(
            builder: (context, value, child) => value.loading
                ? CircularProgressIndicator()
                : CustomButton(
                    backgroundColor: const Color(0xFFEC7E1B),
                    btnText: "Request Coins",
                    textColor: Colors.white,
                    onTap: () {
                      value.requestCoins(context, _coinsController.text);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
