import 'package:flutter/material.dart';
import 'package:gym_app/layouts/user_page_layout.dart';
class EnrolledMembersScreen extends StatefulWidget {
  const EnrolledMembersScreen({super.key});

  @override
  State<EnrolledMembersScreen> createState() => _EnrolledMembersScreenState();
}

class _EnrolledMembersScreenState extends State<EnrolledMembersScreen> {
  @override
  Widget build(BuildContext context) {
    return UserPageLayout(
      screenTitle: "Enrolled Members",
      child: Column(),
    );
  }
}
