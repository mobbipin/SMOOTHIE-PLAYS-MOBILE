import 'package:flutter/material.dart';

import 'view/dashboard.dart'; // Import the dashboard screen
import 'view/login_screen.dart'; // Import the login screen
import 'view/signup_screen.dart'; // Import the signup screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
        '/dashboard': (context) => Dashboard(),
      },
    );
  }
}
