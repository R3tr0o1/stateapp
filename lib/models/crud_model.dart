// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:stateapp/models/product_list%20_model.dart';
import 'package:stateapp/models/user.dart';
import 'package:stateapp/services/product_api.dart';
import 'package:stateapp/services/locator.dart';
import 'package:stateapp/services/user_api.dart';

class CRUDModel extends ChangeNotifier {
  final ProductApi _api = locator<ProductApi>();
  final UserApi _userApi = locator<UserApi>();
  late List<Userinfo> user;
  late List<Product> product;

  // Future<List<Product>> fetchProducts() async {
  //   var result = await _api.getDataCollection();
  //   product = result.docs
  //       .map((doc) => Product.fromMap(doc.data as Map<String, dynamic>, doc.id))
  //       .toList();
  //   return product;
  // }

  Stream<QuerySnapshot> fetchProductsAsStream() {
    return _api.streamDataCollection();
  }

  Future<Product> getProductById(String id) async {
    var doc = await _api.getDocumentById(id);
    return Product.fromMap(doc.data() as Map<String, dynamic>, doc.id);
  }

  Future removeProduct(String id) async {
    await _api.removeDocument(id);
    return;
  }

  Future updateProduct(Product data, String id) async {
    await _api.updateDocument(data.toJson(), id);
    return;
  }

  Future addProduct(Product data) async {
    var result = await _api.addDocument(data.toJson());

    return;
  }

  Future addUser(Userinfo data) async {
    var result = await _userApi.addDocument(data.toJson());

    return;
  }

  Stream<QuerySnapshot> fetchUserEmail() {
    return _userApi.streamDataCollection();
  }

  // Stream<Userinfo> getUserbyId(String id)  {
  //   var doc =  _userApi.getDocumentById(id);
  //   return Userinfo.fromMap(doc.data() as Map<String, dynamic>, doc.id);
  // }

  // Future addUser(UserInfo data) async {
  //   var result = await _userApi.addDocument(data.toJson());

  //   return;
  // }

  // Future<User> getUserById(String uid) async {
  //   var doc = await _userApi.getDocumentById(uid);
  //   return User.fromMap(doc.data() as Map<String, dynamic>, doc.id);
  // }
}
