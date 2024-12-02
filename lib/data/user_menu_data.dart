import 'package:gym_app/screens/user/gym_packages_screen.dart';
import 'package:gym_app/screens/user/our_products_screen.dart';
import 'package:gym_app/screens/user/user_profile_screen.dart';

class UserMenuData {
  List data = [
    {
      "title": "My Profile",
      "icon": "assets/icons/profile.png",
      "route": const UserProfileScreen(),
    },
    {
      "title": "Gym Packages",
      "icon": "assets/icons/dumbell.png",
      "route": const GymPackagesScreen(),
    },
    {
      "title": "Our Products",
      "icon": "assets/icons/arm.png",
      "route": const OurProductsScreen(),
    }
  ];
}
