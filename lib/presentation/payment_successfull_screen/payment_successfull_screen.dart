import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:med_scan/core/constants/color_consatnt.dart';
import 'package:med_scan/presentation/scanner_screen/view/scanner_screen.dart';

class PaymentSuccessfull extends StatefulWidget {
  const PaymentSuccessfull({super.key});

  @override
  State<PaymentSuccessfull> createState() => _PaymentSuccessfullState();
}

class _PaymentSuccessfullState extends State<PaymentSuccessfull> {
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
        child: Lottie.asset("assets/payment_successful.json"),
      ),
    );
  }
}
