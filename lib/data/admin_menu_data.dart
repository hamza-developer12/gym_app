import 'package:gym_app/screens/admin/add_product_screen.dart';
import 'package:gym_app/screens/admin/enrolled_members_screen.dart';
import 'package:gym_app/screens/admin/our_products_admin_screen.dart';

import '../screens/user/user_profile_screen.dart';

class AdminMenuData {
  List data = [
    {
      "title": "My Profile",
      "icon": "assets/icons/profile.png",
      "route": const UserProfileScreen(),
    },
    {
      "title": "Enrolled Members",
      "icon": "assets/icons/dumbell.png",
      "route": const EnrolledMembersScreen(),
    },
    {
      "title": "Our Products",
      "icon": "assets/icons/arm.png",
      "route": const OurProductsAdminScreen(),
    },
    {
      "title": "Add Product",
      "icon": "assets/icons/arm.png",
      "route": const AddProductScreen(),
    }
  ];
}