import 'package:flutter/material.dart';
import 'package:gym_app/layouts/user_page_layout.dart';
import 'package:gym_app/widgets/gym_packages_card.dart';

class GymPackagesScreen extends StatefulWidget {
  const GymPackagesScreen({super.key});

  @override
  State<GymPackagesScreen> createState() => _GymPackagesScreenState();
}

class _GymPackagesScreenState extends State<GymPackagesScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return UserPageLayout(
      screenTitle: "Gym Packages",
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height * 0.02),
            const GymPackagesCard(
              packageName: "Basic",
              packagePrice: 1200,
              includes: ["Basic Gym Equipments"],
              packageImage: "assets/images/package_1.png",
            ),
            SizedBox(height: height * 0.02),
            const GymPackagesCard(
              packageName: "Premium",
              packagePrice: 2200,
              includes: [
                "Ally Gym Equipments",
                "Treadmill for 15 minutes",
                "Diet Plan"
              ],
              packageImage: "assets/images/package_2.png",
            ),
            SizedBox(height: height * 0.02),
            const GymPackagesCard(
              packageName: "Golden",
              packagePrice: 3000,
              includes: [
                "All Gym Equipments",
                "Treadmill for 15 minutes",
                "Fitness Trainer",
                "Diet Plan",
                "Snooker for 20 minutes"
              ],
              packageImage: "assets/images/package_3.png",
            ),
          ],
        ),
      ),
    );
  }
}
