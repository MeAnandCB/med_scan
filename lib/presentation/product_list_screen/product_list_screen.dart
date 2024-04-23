import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:med_scan/core/constants/color_consatnt.dart';
import 'package:med_scan/presentation/payment_screen/payment_screen.dart';
import 'package:med_scan/presentation/product_list_screen/widgets/product_list_card.dart';

class ProductListScreen extends StatelessWidget {
  final String scannedData;

  ProductListScreen({required this.scannedData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          title: Text('Product List'),
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: ColorConstant.primarygreen,
              fontSize: 25),
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => ProductListCard(),
        separatorBuilder: (context, index) => Divider(),
        itemCount: 10,
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
                        style: TextStyle(
                            fontSize: 15, color: ColorConstant.primaryWhite),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "1500 /- ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: ColorConstant.primaryWhite),
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
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
