import 'package:flutter/material.dart';
import 'package:gym_app/layouts/user_dashboard_layout.dart';
import 'package:gym_app/screens/user/gym_packages_screen.dart';
import 'package:gym_app/screens/user/snooker_packages_screen.dart';
import 'package:gym_app/widgets/custom_package_card.dart';
import 'package:gym_app/widgets/custom_timer_card.dart';
import 'package:gym_app/widgets/dashboard_details_card.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return UserDashboardLayout(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: width * 0.01, vertical: height * 0.01),
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
                        "Dashboard",
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
                const DashboardDetailsCard(),
                SizedBox(height: height * 0.015),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFEE7E1A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Select Your Package",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.015),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomPackageCard(
                      image: "assets/images/image_3.png",
                      title: "Gym Fitness Package",
                      widget: GymPackagesScreen(),
                    ),
                    SizedBox(width: width * 0.02),
                    const CustomPackageCard(
                      image: "assets/images/image_2.png",
                      title: "Snooker Packages",
                      widget: SnookerPackagesScreen(),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.02),
                const CustomTimerCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
