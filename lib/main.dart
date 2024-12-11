import 'package:flutter/material.dart';
import 'package:smoothie_plays_mobile/pages/home_page.dart';
import 'package:smoothie_plays_mobile/pages/login_page.dart';
import 'package:smoothie_plays_mobile/pages/signup_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smoothie Plays',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
