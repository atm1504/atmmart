import 'package:atmmart/db/users.dart';
import 'package:atmmart/pages/home.dart';
import 'package:atmmart/pages/login.dart';
import 'package:atmmart/utils/constants.dart';
import 'package:atmmart/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  UserServices _userServices = UserServices();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _confirmPasswordTextController =
      TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  String gender = "male";
  String groupValue = "male";
  bool loading = false;
  bool isInvisible = true;
  SharedPreferences preferences;
  bool isConfirmInvisible = true;

  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async {
    preferences = await SharedPreferences.getInstance();
    if (preferences.getBool(IS_LOGGED_IN)) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: ExactAssetImage("images/atm.jpg"),
          ),
        ),
        child: Stack(
          children: <Widget>[
            Container(
              color: Colors.black.withOpacity(0.6),
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
                                      border: InputBorder.none,
                                      labelText: "Name",
                                      hintText: "Name",
                                      icon: Icon(Icons.people),
                                    ),
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "Name field cannot be empty";
                                      } else if (value.length < 2) {
                                        return "Name must be atleast 2 characters long";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                color: Colors.white.withOpacity(0.3),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      child: ListTile(
                                        title: Text(
                                          "Male",
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                        trailing: Radio(
                                            value: "male",
                                            activeColor: Colors.blue,
                                            hoverColor: Colors.yellow,
                                            groupValue: groupValue,
                                            onChanged: (e) {
                                              setState(() {
                                                groupValue = e;
                                                gender = e;
                                              });
                                            }),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListTile(
                                        title: Text(
                                          "Female",
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                        trailing: Radio(
                                            value: "female",
                                            activeColor: Colors.blue,
                                            hoverColor: Colors.yellow,
                                            groupValue: groupValue,
                                            onChanged: (e) {
                                              print(e);
                                              setState(() {
                                                groupValue = e;
                                                gender = e;
                                              });
                                            }),
                                      ),
                                    ),
                                  ],
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
                                      border: InputBorder.none,
                                      labelText: "Email",
                                      hintText: "Email",
                                      icon: Icon(Icons.email),
                                    ),
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (!value.isEmpty) {
                                        Pattern pattern =
                                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                        RegExp regex = new RegExp(pattern);
                                        if (!regex.hasMatch(value)) {
                                          return 'Please make sure your email address is valid';
                                        }
                                        return null;
                                      } else {
                                        return "Email Field cannot be empty";
                                      }
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
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 10,
                                        child: TextFormField(
                                          controller: _passwordTextController,
                                          cursorColor: Colors.red,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            labelText: "Password",
                                            hintText: "Password",
                                            fillColor: Colors.white,
                                            icon: Icon(Icons.lock_outline),
                                          ),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                          obscureText: isInvisible,
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
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 5),
                                          child: IconButton(
                                            icon: Icon(Icons.remove_red_eye),
                                            iconSize: 20,
                                            onPressed: () {
                                              setState(() {
                                                isInvisible = !isInvisible;
                                              });
                                            },
                                          ),
                                        ),
                                      )
                                    ],
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
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 10,
                                        child: TextFormField(
                                          controller:
                                              _confirmPasswordTextController,
                                          cursorColor: Colors.red,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            labelText: "Confirm Password",
                                            hintText: "Confirm Password",
                                            fillColor: Colors.white,
                                            icon: Icon(Icons.lock_outline),
                                          ),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                          obscureText: isConfirmInvisible,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return "Password field cannot be empty";
                                            } else if (value.length < 6) {
                                              return "Password must be atleast 6 characters long";
                                            } else if (_passwordTextController
                                                    .text !=
                                                value) {
                                              print(value);
                                              print(
                                                  _passwordTextController.text);
                                              return "Password fields didn't match";
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 5),
                                          child: IconButton(
                                            icon: Icon(Icons.remove_red_eye),
                                            iconSize: 20,
                                            onPressed: () {
                                              setState(() {
                                                isConfirmInvisible =
                                                    !isConfirmInvisible;
                                              });
                                            },
                                          ),
                                        ),
                                      )
                                    ],
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
                                  onPressed: () {
                                    validateRegistrationForm();
                                  },
                                  minWidth: MediaQuery.of(context).size.width,
                                  child: Text(
                                    "Sign Up",
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

  Future validateRegistrationForm() async {
    print(gender);
    FormState formState = _formKey.currentState;
    if (formState.validate()) {
//      FirebaseUser user = await firebaseAuth.currentUser();
      // errors here
      firebaseAuth
          .createUserWithEmailAndPassword(
              email: _emailTextController.text,
              password: _passwordTextController.text)
          .then((users) => {
                _userServices.createUser(users.user.uid, {
                  "username": _nameTextController.text,
                  "email": users.user.email,
                  "userId": users.user.uid,
                  "gender": gender
                })
              })
          .then((user) {
        preferences.setBool(IS_LOGGED_IN, true);
        setUserData(
            _nameTextController.text, _emailTextController.text, gender);
        showToast("Successfully registered the user!");
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }).catchError((err) {
        showToast(
            "Some Errors occured while registering the user! Please try again");
        preferences.setBool(IS_LOGGED_IN, false);
        print(err.toString());
      });
//      if (preferences.getBool(IS_LOGGED_IN)) {
//        Navigator.pushReplacement(
//            context, MaterialPageRoute(builder: (context) => HomePage()));
//      }
    } else {
      showToast("Form not validated");
    }
  }
}
