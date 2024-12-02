import 'package:flutter/material.dart';
import 'package:gym_app/layouts/user_page_layout.dart';

class QrScanScreen extends StatefulWidget {
  const QrScanScreen({super.key});

  @override
  State<QrScanScreen> createState() => _QrScanScreenState();
}

class _QrScanScreenState extends State<QrScanScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return UserPageLayout(
      screenTitle: "Scan QR",
      child: Column(
        children: [
          SizedBox(height: height * 0.04),
          const SizedBox(
            width: double.infinity,
            child: Text(
              'Please scan the Qr code on the main\ndoor to enter or leave.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFFDFDFD),
                fontSize: 18,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            child: Icon(
              Icons.qr_code,
              size: width * 0.25,
              color: Colors.white,
            ),
          ),
          SizedBox(height: height * 0.02),
          Stack(
            children: [
              Image.asset("assets/images/qr_box.png"),
              Positioned(
                top: height * 0.04,
                left: width * 0.1,
                child: Container(
                  alignment: Alignment.center,
                  width: 200,
                  height: 200,
                  decoration: ShapeDecoration(
                    // color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: height * 0.04),
          Container(
            alignment: Alignment.center,
            child: const Text(
              "Align the QR code within the frame to open the door.",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: height * 0.01),
          Container(
            alignment: Alignment.center,
            child: const Text(
              "For a seamless experience, ensure your camera is   \n focused on the QR code.",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
