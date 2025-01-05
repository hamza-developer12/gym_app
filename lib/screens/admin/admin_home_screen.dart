import 'package:flutter/material.dart';
import 'package:gym_app/layouts/admin_dashboard_layout.dart';
import 'package:gym_app/screens/admin/coins_request_screen.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return AdminDashboardLayout(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.03, vertical: height * 0.01),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  height: 53,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Builder(builder: (context) {
                        return IconButton(
                          icon: const Icon(Icons.menu, size: 30),
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                        );
                      }),
                      const Spacer(),
                      const Text(
                        "Admin Dashboard",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.02),
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomColumn(
                              "Total Received Amount",
                              "4250",
                              height,
                            ),
                            CustomColumn(
                              "Total Members",
                              "398",
                              height,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: width * 0.85,
                        height: height * 0.02,
                        child: const Divider(
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomColumn(
                              "Total Gym Members",
                              "165",
                              height,
                            ),
                            CustomColumn(
                              "Total Snooker Members",
                              "233",
                              height,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customImageCard(height, "assets/images/admin_1.png",
                        "Trainers", Container()),
                    SizedBox(width: width * 0.05),
                    customImageCard(height, "assets/images/admin_2.png",
                        "Snooker Packages", Container()),
                  ],
                ),
                SizedBox(height: height * 0.02),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CoinsRequestScreen()));
                  },
                  child: _coinRequestCard(
                      width, height, 20, 2000, "Ali", "example@gmail.com"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget CustomColumn(String text1, String text2, double height) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text1,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
        SizedBox(height: height * 0.003),
        Text(
          text2,
          style: const TextStyle(
            color: Color(0xFFEE7E1A),
          ),
        )
      ],
    );
  }

  Widget customImageCard(
      double height, String image, String title, Widget screen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => screen));
      },
      child: Container(
        width: 165,
        // height: 162,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 2, color: Color(0xFFEE7E1A)),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(image),
            Container(
              padding: EdgeInsets.symmetric(vertical: height * 0.01),
              decoration: const BoxDecoration(color: Colors.orange),
              child: Text(
                title,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _coinRequestCard(double width, double height, int coinsRequest,
      int amount, String name, String email) {
    return Container(
      width: double.infinity,
      // height: 147,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.50, color: Colors.white),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: width * 0.31,
            // padding: EdgeInsets.symmetric(horizontal: width * 0.001),
            height: 147,
            decoration: const ShapeDecoration(
              color: Color(0xFFEE7E1A),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Total Coin Request",
                ),
                Text(coinsRequest.toString()),
                const Text(
                  "Total Amount",
                ),
                Text(amount.toString()),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              // height: height * 0.045,

              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: height * 0.004),
                    margin: EdgeInsets.only(left: width * 0.01),
                    decoration: const ShapeDecoration(
                      color: Color(0x63B2B2B2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: width * 0.01),
                        CircleAvatar(
                          radius: 18,
                          backgroundImage: const AssetImage(
                            "assets/images/admin_3.png",
                          ),
                        ),
                        SizedBox(width: width * 0.02),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "$name Requested $amount coins",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              email,
                              style: const TextStyle(color: Colors.black),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: width * 0.01),
                      CircleAvatar(
                        radius: 18,
                        backgroundImage: const AssetImage(
                          "assets/images/admin_3.png",
                        ),
                      ),
                      SizedBox(width: width * 0.02),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "$name Requested $amount coins",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            email,
                            style: const TextStyle(color: Colors.black),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
