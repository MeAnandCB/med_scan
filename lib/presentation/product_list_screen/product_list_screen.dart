import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:med_scan/core/constants/color_consatnt.dart';
import 'package:med_scan/presentation/payment_screen/payment_screen.dart';
import 'package:med_scan/presentation/product_list_screen/widgets/product_list_card.dart';
import 'package:med_scan/presentation/scanner_screen/view/scanner_screen.dart';
import 'package:med_scan/repository/scanner_screen/model/scanner_model.dart';

class ProductListScreen extends StatefulWidget {
  // final String scannedData;
  final List<SearchResultResModel> scannedData;
  ProductListScreen({required this.scannedData});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  double totalPrice = 0;

  calculateTotal() {
    totalPrice = 0;
    for (var element in widget.scannedData) {
      totalPrice = (totalPrice + ((element.quantity ?? 1) * (element.price ?? 0)));
    }
    setState(() {});
  }

  @override
  void initState() {
    calculateTotal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          title: Text('Product List'),
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold, color: ColorConstant.primarygreen, fontSize: 25),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScannerScreen(),
                    ),
                  );
                },
                icon: Icon(Icons.qr_code_scanner_sharp))
          ],
        ),
      ),
      body: widget.scannedData.isEmpty
          ? Center(
              child: Text("No data Found"),
            )
          : ListView.separated(
              itemBuilder: (context, index) => ProductListCard(
                name: widget.scannedData[index].name.toString(),
                price: widget.scannedData[index].price.toString(),
                qty: widget.scannedData[index].quantity.toString(),
                url: widget.scannedData[index].img.toString(),
              ),
              separatorBuilder: (context, index) => Divider(),
              itemCount: widget.scannedData.length,
            ),
      bottomNavigationBar: Container(
        height: 55,
        color: ColorConstant.primarygreen,
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Center(
                  child: Row(
                    children: [
                      Text(
                        "Total Amount  :",
                        style: TextStyle(fontSize: 15, color: ColorConstant.primaryWhite),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "$totalPrice /- ",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: ColorConstant.primaryWhite),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                flex: 2,
                child: InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentScreen(),
                        ),
                        (route) => false);
                  },
                  child: Container(
                    height: double.infinity,
                    color: ColorConstant.primaryYellow,
                    child: Center(
                      child: Text(
                        "Buy Now",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
