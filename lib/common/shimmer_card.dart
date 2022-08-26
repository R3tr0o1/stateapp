import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Shimmerloading extends StatefulWidget {
  const Shimmerloading({Key? key}) : super(key: key);

  @override
  State<Shimmerloading> createState() => _ShimmerloadingState();
}

class _ShimmerloadingState extends State<Shimmerloading> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Shimmer.fromColors(
        direction: ShimmerDirection.ltr,
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 7.5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 140,
                width: 120,
                color: Colors.grey,
              ),
              SizedBox(
                width: 50,
              ),
              Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(8)),
                    height: 15,
                    width: 80,
                  ),
                  SizedBox(height: 15),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(8)),
                    height: 15,
                    width: 50,
                  ),
                  SizedBox(height: 15),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(8)),
                    height: 15,
                    width: 100,
                  ),
                  SizedBox(height: 15),
                  Container(
                    color: Colors.grey,
                    height: 25,
                    width: 120,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
