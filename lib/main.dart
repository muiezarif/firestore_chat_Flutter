import 'package:flutter/material.dart';
import 'package:flutterfirestorechat/screens/welcome_screen.dart';
import 'package:flutterfirestorechat/screens/login_screen.dart';
import 'package:flutterfirestorechat/screens/registration_screen.dart';
import 'package:flutterfirestorechat/screens/chat_screen.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute:'/',
      routes: {
        '/':(context) => WelcomeScreen(),
        '/chatscreen':(context) => ChatScreen(),
        '/login':(context) => LoginScreen(),
        '/registration':(context) => RegistrationScreen(),
      },
    );
  }
}
