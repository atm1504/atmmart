import 'package:cloud_firestore/cloud_firestore.dart';

class UserServices {
  Firestore _firestore = Firestore.instance;
  String collection = "users";

  createUser(String uid, var value) {
    _firestore
        .collection(collection)
        .document(uid)
        .setData(value)
        .catchError((e) => {print(e.toString())});
  }
}
