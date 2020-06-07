import 'package:atmmart/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:atmmart/pages/home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  SharedPreferences preferences;
  bool loading = false;
  bool isLoggedin = false;

  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async {
    setState(() {
      loading = true;
    });
    preferences = await SharedPreferences.getInstance();
    isLoggedin = await googleSignIn.isSignedIn();
    if (isLoggedin) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
    setState(() {
      loading = false;
    });
  }

  Future handleSignIn() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {
      loading = true;
    });

    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    final AuthResult authResult =
        await firebaseAuth.signInWithCredential(credential);

    FirebaseUser firebaseUser = authResult.user;
    if (firebaseUser != null) {
      final QuerySnapshot result = await Firestore.instance
          .collection("users")
          .where("id", isEqualTo: firebaseUser.uid)
          .getDocuments();
      final List<DocumentSnapshot> documnents = result.documents;
      if (documnents.length == 0) {
        print("Inside doc  length");
        Firestore.instance
            .collection("users")
            .document(firebaseUser.uid)
            .setData({
          "id": firebaseUser.uid,
          "username": firebaseUser.displayName,
          "profilePicture": firebaseUser.photoUrl,
          "email": firebaseUser.email
        });
        await preferences.setString("id", firebaseUser.uid);
        await preferences.setString("username", firebaseUser.displayName);
        await preferences.setString("profilePicture", firebaseUser.photoUrl);
        await preferences.setString("email", firebaseUser.email);
      } else {
        await preferences.setString("id", documnents[0]["id"]);
        await preferences.setString("username", documnents[0]["username"]);
        await preferences.setString(
            "profilePicture", documnents[0]["profilePicture"]);
        await preferences.setString("email", documnents[0]["email"]);
      }
      Fluttertoast.showToast(msg: "Successfully Logged In");
      setState(() {
        loading = false;
      });
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {}
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
                                    "Login",
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
                                    "Don't have an Account? Click here to",
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
                                                builder: (context) =>
                                                    SignUp()));
                                      },
                                      child: Text(
                                        "Register!",
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
                            Padding(
                              padding: const EdgeInsets.only(top: 80),
                              child: Divider(
                                color: Colors.white,
                                height: 10,
                              ),
                            ),
                            Text(
                              "Other Login Options",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: 10, left: 8, right: 8),
                              child: Material(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.red.withOpacity(0.5),
                                elevation: 0.2,
                                child: MaterialButton(
                                  onPressed: () {
                                    handleSignIn();
                                  },
                                  minWidth: MediaQuery.of(context).size.width,
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 30,
                                        child: Image.network(
                                          "https://img.icons8.com/bubbles/2x/google-logo.png",
                                          height: 50,
                                          width: 50,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          height: 30,
                                          color: Colors.white,
                                          width: 1,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 140,
                                        child: Text(
                                          "Signin With Google",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
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
