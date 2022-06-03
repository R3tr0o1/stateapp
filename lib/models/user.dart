class User {
  String? email;
  String uid;

  User(this.email, this.uid);
}

class Userinfo {
  String? id;

  String email;

  Userinfo({this.id, required this.email});

  Userinfo.fromMap(Map<String, dynamic> snapshot, String id)
      : id = id,
        email = snapshot['email'] ?? ' ';

  toJson() {
    return {
      "email": email,
    };
  }
}
