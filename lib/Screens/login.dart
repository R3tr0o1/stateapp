import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:stateapp/Screens/home_screen.dart';
import 'package:stateapp/Screens/register.dart';
import 'package:stateapp/common/authtextformfiel.dart';

import '../services/auth_services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    final authService = Provider.of<AuthService>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CommonAuthTextField(hinttext: 'email', controller: emailcontroller),
            CommonAuthTextField(
                hinttext: 'pasword', controller: passwordcontroller),
            ElevatedButton(
                onPressed: () {
                  authService.signInWithEmailAndPassword(
                      emailcontroller.text, passwordcontroller.text);
                  Get.to(MyHomePage(title: 'try'));
                },
                child: Text('login')),
            ElevatedButton(
                onPressed: () {
                  Get.to(RegisterScreen());
                },
                child: const Text('Register'))
          ],
        ),
      ),
    );
  }
}
