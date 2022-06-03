import 'package:flutter/material.dart';
import 'package:stateapp/models/product_list%20_model.dart';

import 'common ratting.dart';

class ProductBox extends StatelessWidget {
  final Product productDetails;

  ProductBox({
    Key? key,
    required this.productDetails,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        height: 140,
        child: Card(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.asset("assets/appimage/pendrive.png"),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(productDetails.name,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(productDetails.description),
                            Text("Price: " + productDetails.price.toString()),
                            RatingBox(),
                          ],
                        )))
              ]),
        ));
  }
}
