import 'package:atmmart/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserServices {
  Firestore _firestore = Firestore.instance;

  createUser(String uid, var value) {
    _firestore
        .collection(USERS)
        .document(uid)
        .setData(value)
        .catchError((e) => {print(e.toString())});
  }
}
