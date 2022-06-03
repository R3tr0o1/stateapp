import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stateapp/models/user.dart';

class EmailBox extends StatelessWidget {
  final Userinfo userDetails;
  const EmailBox({Key? key, required this.userDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        height: 140,
        child: Card(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CircleAvatar(),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(userDetails.email,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        )))
              ]),
        ));
  }
}
