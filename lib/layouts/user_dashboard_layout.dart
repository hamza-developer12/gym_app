import 'package:flutter/material.dart';
import 'package:gym_app/screens/user/gym_packages_screen.dart';
import 'package:gym_app/screens/user/qr_scan_screen.dart';
import '../data/user_menu_data.dart';

class UserDashboardLayout extends StatelessWidget {
  final Widget child;
  UserDashboardLayout({super.key, required this.child});

  UserMenuData userData = UserMenuData();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: height * 0.08),
              const Text(
                "Menu",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: height * 0.04),
              for (var item in userData.data)
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => item['route'],
                        ));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: Row(
                      children: [
                        Image.asset(item['icon'], width: 48),
                        const SizedBox(width: 10),
                        Text(
                          item['title'],
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    Image.asset("assets/icons/logout.png", width: 48),
                    const SizedBox(width: 14),
                    const Text(
                      'Sign Out',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: child,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 4),
        width: double.infinity,
        height: 61,
        color: Colors.white,
        // decoration: const ShapeDecoration(
        //   color: Colors.white,
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.only(
        //       topLeft: Radius.circular(100),
        //       topRight: Radius.circular(100),
        //     ),
        //   ),
        // ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Image.asset("assets/icons/coin.png"),
                const Text(
                  "Add Coin",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GymPackagesScreen()));
              },
              child: Column(
                children: [
                  Image.asset("assets/icons/background_dumbell.png", width: 30),
                  const Text(
                    "Packages",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const QrScanScreen()));
          },
          child: const Icon(
            Icons.qr_code_sharp,
            size: 40,
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
