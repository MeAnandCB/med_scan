import 'package:flutter/material.dart';
import 'package:med_scan/core/constants/color_consatnt.dart';
import 'package:med_scan/presentation/scanner_screen/view/scanner_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => ScannerScreen(),
        ),
        (route) => false,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.primaryWhite,
      body: Center(
        child: SizedBox(
            height: 250, width: 250, child: Image.asset("assets/logo.jpg")),
      ),
    );
  }
}
