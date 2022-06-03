import 'package:cloud_firestore/cloud_firestore.dart';

class UserApi {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String pathUser;
  late CollectionReference ref;
  UserApi(this.pathUser) {
    ref = _db.collection(pathUser);
  }
  Future<QuerySnapshot> getDataCollection() {
    return ref.get();
  }

  Stream<QuerySnapshot> streamDataCollection() {
    return ref.snapshots();
  }

  Future<DocumentSnapshot> getDocumentById(String id) {
    return ref.doc(id).get();
  }

  Future<void> removeDocument(String id) {
    return ref.doc(id).delete();
  }

  Future<DocumentReference> addDocument(Map data) {
    return ref.add(data);
  }

  Future<void> updateDocument(Map<String, Object?> data, String id) {
    return ref.doc(id).update(data);
  }
}
