import 'package:atmmart/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences preferences;

showToast(String mssg) {
  Fluttertoast.showToast(
      msg: mssg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

setUserData(String username, String email, String gender) async {
  preferences = await SharedPreferences.getInstance();
  preferences.setString(USERNAME, username);
  preferences.setString(EMAIL, email);
  preferences.setString(GENDER, gender);
}
