import 'package:stateapp/models/user.dart';

class Product {
  String? id;
  String name;
  String description;
  String price;
  User user;

  Product({
    required this.user,
    required this.name,
    required this.description,
    required this.price,
    this.id,
  });

  Product.fromMap(Map<String, dynamic> snapshot, String id)
      : id = id,
        name = snapshot['name'] ?? ' ',
        description = snapshot['description'] ?? '',
        user = User(email: snapshot["email"] ?? ''),
        price = snapshot['price'] ?? '';

  toJson() {
    return {
      "name": name,
      "description": description,
      "price": price,
      "user": {"email": user.email}
    };
  }
}

class User {
  String? email;
  User({required this.email});

  User.fromMap(Map<String, dynamic> snapshot) {
    User(email: snapshot['UserName'] ?? '');
  }

  toJson() {
    return {"UserName": email};
  }
}
