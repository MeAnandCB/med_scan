import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:med_scan/presentation/product_list_screen/product_list_screen.dart';
import 'package:med_scan/repository/scanner_screen/model/scanner_model.dart';

class ScannerScreen extends StatefulWidget {
  @override
  _ScannerScreenState createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  String _barcode = 'Unknown';
  List<SearchResultResModel> _barcodeModel = [];
  @override
  void initState() {
    super.initState();
    _scanBarcode(); // Automatically trigger barcode scanning when the app starts
  }

  Future<void> _scanBarcode() async {
    try {
      String barcode = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666",
        "Cancel",
        true,
        ScanMode.DEFAULT,
      );

      setState(() {
        _barcode = barcode;
      });
      if (barcode == '-1') {
        // User cancelled scanning, navigate to another screen or perform any action
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ProductListScreen(scannedData: _barcodeModel),
          ),
        );
        return; // Exit the method if user cancels
      }
      // Navigate to the next screen after scanning
      if (_barcode.isNotEmpty) {
        _barcodeModel = searchResultResModelFromJson(_barcode);
      }
      if (_barcodeModel.isNotEmpty) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ProductListScreen(scannedData: _barcodeModel),
          ),
        );
      }
    } on PlatformException catch (e) {
      print("Error scanning barcode: ${e.message}");
      setState(() {
        _barcode = 'Failed to scan barcode';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    ));
  }
}