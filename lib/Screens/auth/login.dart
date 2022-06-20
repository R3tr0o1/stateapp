import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:stateapp/Screens/auth/register.dart';
import 'package:stateapp/Screens/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stateapp/common/authtextformfiel.dart';
import '../../services/auth_services.dart';

const String EMAIL_STRING = 'EMAIL_STRING';
// const String PASS = 'PASS_STRING';

class LoginScreen extends StatefulWidget {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool onCheck = false;
 

  void tick(bool? value) {
    setState(() {
      onCheck = value!;
    });
    loadEmail();
  }

  void loadEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (onCheck == true) {
      prefs.setString(EMAIL_STRING, widget.emailcontroller.text);
      // prefs.setString(PASS, widget.passwordcontroller.text);
    }
  }

  void readEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    widget.emailcontroller.text = prefs.getString(EMAIL_STRING) ?? '';
    // widget.passwordcontroller.text = prefs.getString(PASS) ?? '';
  }

  @override
  void initState() {
    super.initState();
    readEmail();
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CommonAuthTextField(
                hinttext: 'email', controller: widget.emailcontroller),
            CommonAuthTextField(
                hinttext: 'pasword', controller: widget.passwordcontroller),
            Row(
              children: [
                Checkbox(value: onCheck, onChanged: tick),
                const Text('Remember me ')
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  authService.signInWithEmailAndPassword(
                      widget.emailcontroller.text,
                      widget.passwordcontroller.text);
                  Get.to(MyHomePage(title: 'try'));
                },
                child: const Text('login')),
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
