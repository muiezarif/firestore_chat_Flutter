import 'package:flutter/material.dart';
import 'package:flutterfirestorechat/constants.dart';
import 'package:flutterfirestorechat/custom_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.black),
                onChanged: (value) {
                  //Do something with the user input.
                  email = value;
                },
                decoration: kHintTextDecoration.copyWith(
                  hintText: 'Enter Email',
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                style: TextStyle(color: Colors.black),
                onChanged: (value) {
                  //Do something with the user input.
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
                title: 'Register',
                onPressed: () async {
                  setState(() {
                    showSpinner=true;
                  });
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (newUser != null) {
                      Navigator.pushNamed(context, '/chatscreen');
                    }
                    setState(() {
                      showSpinner=false;
                    });
                  } catch (e) {
                    setState(() {
                      showSpinner=false;
                    });
                    print(e);
                  }
                },
                color: Colors.blueAccent,
              ),
            ],
          ),
        ),
        inAsyncCall: showSpinner,
      ),
    );
  }
}
