import 'package:flutter/material.dart';
import 'package:atmmart/pages/login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: Colors.red.shade900),
    home: Login(),
  ));
}
