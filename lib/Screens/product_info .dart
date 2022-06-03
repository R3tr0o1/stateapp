import 'package:flutter/material.dart';
import 'package:stateapp/models/product_list%20_model.dart';

import '../common/common ratting.dart';

class ProductPage extends StatelessWidget {
  final Product productDetails;
  ProductPage({
    Key? key,
    required this.productDetails,
  }) : super(key: key);
  late List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Center(
          child: Text(
            productDetails.name,
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset("assets/appimage/pendrive.png"),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(productDetails.price.toString(),
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(productDetails.description),
                            Text("Price: " + productDetails.price.toString()),
                            RatingBox(),
                          ],
                        )))
              ]),
        ),
      ),
    );
  }
}
