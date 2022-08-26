import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stateapp/models/crud_model.dart';

import 'package:stateapp/models/product_list%20_model.dart';

import 'common ratting.dart';

class ProductBox extends StatefulWidget {
  final Product productDetails;

  ProductBox({
    Key? key,
    required this.productDetails,
  }) : super(key: key);

  @override
  State<ProductBox> createState() => _ProductBoxState();
}

class _ProductBoxState extends State<ProductBox> {
  late List<Product> products;

  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDModel>(context);

    return GestureDetector(
      onTap: () {
        productProvider.removeProduct(products.map((e) => e.id).toString());
      },
      child: Container(
          padding: EdgeInsets.all(2),
          height: 140,
          child: Card(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.asset("assets/appimage/pendrive.png"),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Container(
                          padding: EdgeInsets.all(5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(widget.productDetails.name,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text(widget.productDetails.description),
                              Text("Price: " +
                                  widget.productDetails.price.toString()),
                              RatingBox(),
                            ],
                          )))
                ]),
          )),
    );
  }
}
