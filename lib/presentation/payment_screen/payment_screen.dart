import 'dart:async';

import 'package:flutter/material.dart';

import 'package:med_scan/core/constants/color_consatnt.dart';
import 'package:med_scan/presentation/payment_successfull_screen/payment_successfull_screen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key, this.amount = 0});
  final double amount;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int counter = 30;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (counter > 0) {
          counter--;
        } else {
          timer.cancel();
          // Navigate to home page after countdown
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => PaymentSuccessfull()),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.primaryWhite,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Total Amount"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.currency_rupee),
                  Text(
                    "${widget.amount}/- ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50, color: ColorConstant.primaryBlack),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Image.asset("assets/qr-code.png"),
              Text("Scan the QR and Pay"),
              SizedBox(
                height: 45,
              ),
              Column(
                children: [
                  Text(
                    "Please pay before the time is running out",
                    style: TextStyle(color: Colors.red),
                  ),
                  Text(
                    '$counter',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
