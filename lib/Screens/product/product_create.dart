import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';
import 'package:stateapp/Screens/home/home_screen.dart';
import 'package:stateapp/common/authtextformfiel.dart';
import 'package:stateapp/models/crud_model.dart';

import '../../models/product_list _model.dart';

class ProductCreationScreen extends StatefulWidget {
  const ProductCreationScreen({Key? key}) : super(key: key);

  @override
  State<ProductCreationScreen> createState() => _ProductCreationScreenState();
}

class _ProductCreationScreenState extends State<ProductCreationScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController emailConorller = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDModel>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal,
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              CommonAuthTextField(hinttext: 'Name', controller: nameController),
              CommonAuthTextField(
                  hinttext: 'price', controller: priceController),
              CommonAuthTextField(
                  hinttext: 'Description', controller: descriptionController),
              CommonAuthTextField(
                  hinttext: 'Username', controller: emailConorller),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    await productProvider.addProduct(Product(
                      user: User(userName: emailConorller.text),
                      // user: User.fromMap(),
                      name: nameController.text,
                      description: descriptionController.text,
                      price: priceController.text,
                    ));
                    Get.to(MyHomePage(title: 'aaaaa'));
                  }
                },
                child:
                    Text('add Product', style: TextStyle(color: Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
