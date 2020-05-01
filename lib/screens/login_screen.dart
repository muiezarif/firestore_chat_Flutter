import 'package:flutter/material.dart';
import 'package:flutterfirestorechat/constants.dart';
import 'package:flutterfirestorechat/custom_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool showSpinner=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: "logo",
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                style: TextStyle(
                  color: Colors.black
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                decoration: kHintTextDecoration.copyWith(hintText: 'Enter Email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                style: TextStyle(
                    color: Colors.black
                ),
                onChanged: (value) {
                  password = value;
                },
                decoration: kHintTextDecoration.copyWith(
                  hintText: 'Enter Password',
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              NewRoundedButton(
                title: 'Log In',
                onPressed: () async {
                  setState(() {
                    showSpinner=true;
                  });
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (user != null) {
                      Navigator.pushNamed(context, '/chatscreen');
                    }
                    setState(() {
                      showSpinner=false;
                    });
                  } catch (e) {
                    print(e);
                    setState(() {
                      showSpinner=false;
                    });
                  }
                },
                color: Colors.lightBlueAccent,
              ),
            ],
          ),
        ), inAsyncCall: showSpinner,
      ),
    );
  }
}
