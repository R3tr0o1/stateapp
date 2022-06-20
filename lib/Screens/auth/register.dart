import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:stateapp/Screens/auth/login.dart';
import 'package:stateapp/services/auth_services.dart';

import '../../common/authtextformfiel.dart';
import '../../models/crud_model.dart';
import '../../models/user.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    final authService = Provider.of<AuthService>(context);
    final userProvider = Provider.of<CRUDModel>(context);

    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              CommonAuthTextField(
                  hinttext: 'email', controller: emailcontroller),
              CommonAuthTextField(
                  hinttext: 'pasword', controller: passwordcontroller),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    debugger();
                    _formKey.currentState!.save();
                    authService.createUserWithEmailAndPassword(
                        emailcontroller.text, passwordcontroller.text);
                    await userProvider
                        .addUser(Userinfo(email: emailcontroller.text, id: ''));

                    Get.offAll(LoginScreen());
                  } else {
                    print('wrongggggggggggggggggggggg');
                  }
                  // authService.createUserWithEmailAndPassword(
                  //       emailcontroller.text, passwordcontroller.text);
                  //   Get.offAll(LoginScreen());
                },
                child: Text('register'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
