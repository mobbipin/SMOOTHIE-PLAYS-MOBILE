import 'package:flutter/material.dart';
import 'package:smoothie_plays_mobile/core/common/theme.dart';
import 'package:smoothie_plays_mobile/view/dashboard.dart';
import 'package:smoothie_plays_mobile/view/login_screen.dart';
import 'package:smoothie_plays_mobile/view/signup_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: AppTheme.lightTheme(),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
        '/dashboard': (context) => DashboardScreen(),
      },
    );
  }
}
