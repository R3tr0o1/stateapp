import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stateapp/Screens/home_screen.dart';
import 'package:stateapp/services/auth_services.dart';

import 'Screens/login.dart';
import 'models/user.dart';

class Wraper extends StatefulWidget {
  const Wraper({Key? key}) : super(key: key);

  @override
  State<Wraper> createState() => _WraperState();
}

class _WraperState extends State<Wraper> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder(
        stream: authService.user,
        builder: (_, AsyncSnapshot<User?>? snapshot) {
          if (snapshot!.connectionState == ConnectionState.active) {
            final User? user = snapshot.data;
            return user == null ? LoginScreen() : MyHomePage(title: 'sign in');
          } else {
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
        });
  }
}
