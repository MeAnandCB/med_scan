import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:med_scan/repository/scanner_screen/model/scanner_model.dart';

class QRViewExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
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
  void dispose() {
    controller.dispose();
    super.dispose();
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

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      // Do something with the scanned data, e.g., display it
      print('Scanned data: ${scanData.code}');
      // You can also use setState() to update UI based on scanned data
    });
  }
}