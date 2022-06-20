import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:stateapp/Screens/auth/login.dart';
import 'package:stateapp/Screens/product/product_create.dart';
import 'package:stateapp/common/product_card.dart';
import 'package:stateapp/models/crud_model.dart';
import 'package:stateapp/models/product_list%20_model.dart';
import 'package:stateapp/models/user.dart';
import '../../services/auth_services.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late List<Product> products;
  late List<Userinfo> user;
  late TabController _tabController = TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDModel>(context);
    final userProvider = Provider.of<CRUDModel>(context);
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          authService.signOut();
          Get.to(LoginScreen());
        }),
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(ProductCreationScreen());
                },
                icon: Image.asset('assets/appimage/pendrive.png'))
          ],
          elevation: 0,
          title: const Center(
              child: Text(
            "Product Navigation",
            style: TextStyle(color: Colors.black),
          )),
          backgroundColor: Colors.transparent,
        ),
        body: DefaultTabController(
          length: 2,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.only(left: 24, right: 24, top: 25),
              child: Container(
                color: Colors.white,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5)),
                  height: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: double.maxFinite,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5)),
                        child: TabBar(
                          controller: _tabController,
                          indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Theme.of(context).primaryColor),
                          indicatorColor: Colors.transparent,
                          labelColor: Theme.of(context).cardColor,
                          unselectedLabelColor: Colors.white,
                          tabs: const [
                            Tab(
                              child: Text('profile'),
                            ),
                            Tab(
                              child: Text('Product'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 24, right: 24, top: 30),
              child: Container(
                  height: 500, //height of TabBarView
                  child: TabBarView(
                      controller: _tabController,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        Container(
                          child: StreamBuilder(
                              stream: productProvider.fetchProductsAsStream(),
                              builder: (context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (snapshot.hasData) {
                                  products = snapshot.data!.docs
                                      .map((doc) => Product.fromMap(
                                          doc.data() as Map<String, dynamic>,
                                          doc.id))
                                      .toList();
                                  return ListView.builder(
                                    itemCount: products.length,
                                    itemBuilder: (buildContext, index) =>
                                        ProductBox(
                                      productDetails: products[index],
                                    ),
                                  );
                                } else {
                                  return Text('fetcing ');
                                }
                              }),
                        ),
                        Container(
                            child: StreamBuilder(
                          stream: userProvider.fetchUserEmail(),
                          builder:
                              (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasData) {
                              user = snapshot.data!.docs
                                  .map((doc) => Userinfo.fromMap(
                                      doc.data() as Map<String, dynamic>,
                                      doc.id))
                                  .toList();
                            }
                            return Text(user.map((e) => e.email).toString());
                          },
                        ))
                      ])),
            )
          ]),
        ));
  }
}
