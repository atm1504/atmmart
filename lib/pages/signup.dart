import 'package:atmmart/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _confirmPasswordTextController =
      TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  String gender;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.8),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(
                "https://i.pinimg.com/736x/50/df/34/50df34b9e93f30269853b96b09c37e3b.jpg"),
          ),
        ),
        child: Stack(
          children: <Widget>[
            Container(
              color: Colors.black.withOpacity(0.4),
              width: double.infinity,
              height: double.infinity,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    child: Center(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Image.asset("images/atmmart_logo.png"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Material(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white.withOpacity(0.3),
                                elevation: 0.2,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 12, top: 5, bottom: 5),
                                  child: TextFormField(
                                    controller: _nameTextController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: "Name",
                                      hintText: "Name",
                                      icon: Icon(Icons.people),
                                    ),
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        if (value.isEmpty) {
                                          return "Name field cannot be empty";
                                        } else if (value.length < 6) {
                                          return "Name must be atleast 2 characters long";
                                        }
                                        return null;
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Material(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white.withOpacity(0.3),
                                elevation: 0.2,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 12, top: 5, bottom: 5),
                                  child: TextFormField(
                                    controller: _emailTextController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: "Email",
                                      hintText: "Email",
                                      icon: Icon(Icons.email),
                                    ),
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        Pattern pattern =
                                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                        RegExp regex = new RegExp(pattern);
                                        if (!regex.hasMatch(value)) {
                                          return 'Please make sure your email address is valid';
                                        }
                                        return null;
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Material(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white.withOpacity(0.3),
                                elevation: 0.2,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12, top: 5, bottom: 5),
                                  child: TextFormField(
                                    controller: _passwordTextController,
                                    cursorColor: Colors.red,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: "Password",
                                      hintText: "Password",
                                      fillColor: Colors.white,
                                      icon: Icon(Icons.lock_outline),
                                    ),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                    obscureText: true,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "Password field cannot be empty";
                                      } else if (value.length < 6) {
                                        return "Password must be atleast 6 characters long";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Material(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white.withOpacity(0.3),
                                elevation: 0.2,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12, top: 5, bottom: 5),
                                  child: TextFormField(
                                    controller: _confirmPasswordTextController,
                                    cursorColor: Colors.red,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: "Confirm Password",
                                      hintText: "Confirm Password",
                                      fillColor: Colors.white,
                                      icon: Icon(Icons.lock_outline),
                                    ),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                    obscureText: true,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "Password field cannot be empty";
                                      } else if (value.length < 6) {
                                        return "Password must be atleast 6 characters long";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            // Login Button
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Material(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue.withOpacity(0.5),
                                elevation: 0.2,
                                child: MaterialButton(
                                  onPressed: () {},
                                  minWidth: MediaQuery.of(context).size.width,
                                  child: Text(
                                    "Register",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Already have an Account? Click here to",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Login()));
                                      },
                                      child: Text(
                                        "Login!",
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Visibility(
              visible: loading ?? true,
              child: Center(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.white.withOpacity(0.7),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
