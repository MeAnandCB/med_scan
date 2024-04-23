import 'package:flutter/material.dart';
import 'package:med_scan/presentation/product_list_screen/product_list_screen.dart';
import 'package:med_scan/presentation/splash_screen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
