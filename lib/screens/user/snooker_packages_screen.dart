import 'package:flutter/material.dart';
import 'package:gym_app/data/snooker_game_data.dart';
import 'package:gym_app/layouts/user_page_layout.dart';

class SnookerPackagesScreen extends StatefulWidget {
  const SnookerPackagesScreen({super.key});

  @override
  State<SnookerPackagesScreen> createState() => _SnookerPackagesScreenState();
}

class _SnookerPackagesScreenState extends State<SnookerPackagesScreen> {
  SnookerGameData data = SnookerGameData();
  @override
  Widget build(BuildContext context) {
    final smallTable = data.smallTableData;
    final largeTable = data.largeTableData;
    final height = MediaQuery.of(context).size.height;
    return UserPageLayout(
        screenTitle: "Select Game",
        child: Column(
          children: [
            SizedBox(height: height * 0.02),
            Text(
                'سکین کریں ۔گیم کا انتخاب کریں۔ اور ٹیبل پر دیا گیا ',
              style: TextStyle(
                color: Color(0xFFEE7E1A),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),


            const Text('چھوٹا ٹیبل', style: TextStyle(
              fontSize: 20,
            )),
            SizedBox(height: height * 0.02),

            customRow(),
          ],
        ),
    );
  }

  Widget customRow() {
    return Container(
      width: 361,
      height: 37,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 2, color: Color(0xFFEE7E1A)),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Row(
        children: [

        ],
      ),
    );
  }
}
