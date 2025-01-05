import 'package:flutter/material.dart';
import 'package:gym_app/layouts/user_page_layout.dart';
import 'package:gym_app/providers/coins_provider.dart';
import 'package:gym_app/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class ApproveRequestScreen extends StatelessWidget {
  final Map<String, dynamic> request;

  const ApproveRequestScreen({
    super.key,
    required this.request,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return UserPageLayout(
      screenTitle: "Approve Request",
      child: Column(
        children: [
          SizedBox(height: height * 0.02),
          Card(
            color: Colors.white,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.03,
                vertical: height * 0.02,
              ),
              width: double.infinity,
              child: Column(
                children: [
                  _custoRow(context, "Name", request['name']),
                  _custoRow(context, "Email", request['email']),
                  _custoRow(context, "Coins", request['coins'].toString()),
                  SizedBox(height: height * 0.01),
                  Consumer<CoinsProvider>(
                    builder: (context, value, child) => value.loading
                        ? const CircularProgressIndicator()
                        : Column(
                            children: [
                              CustomButton(
                                backgroundColor: const Color(0xFFEC7E1B),
                                btnText: "Approve",
                                textColor: Colors.white,
                                onTap: () {
                                  value.approveRequest(
                                    context,
                                    {
                                      "email": request['email'],
                                      "coins": request['coins'],
                                      "userId": request['userId'],
                                      "id": request['id'],
                                    },
                                  );
                                },
                              ),
                              SizedBox(height: height * 0.015),
                              CustomButton(
                                backgroundColor: Colors.red,
                                btnText: "Reject",
                                textColor: Colors.white,
                                onTap: () {
                                  value.rejectRequest(context, request['id']);
                                },
                              ),
                            ],
                          ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _custoRow(BuildContext context, String title, String value) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.008),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$title: ",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
