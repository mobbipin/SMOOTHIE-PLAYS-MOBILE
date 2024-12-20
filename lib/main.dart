import 'package:flutter/material.dart';
import 'package:smoothie_plays_mobile/core/common/theme.dart';
import 'package:smoothie_plays_mobile/view/dashboard.dart';
import 'package:smoothie_plays_mobile/view/entrance_screen.dart';
import 'package:smoothie_plays_mobile/view/login_screen.dart';
import 'package:smoothie_plays_mobile/view/signup_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smoothie Plays',
      theme: AppTheme.lightTheme(),
      initialRoute: '/entrance',
      routes: {
        '/entrance': (context) => EntranceScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
        '/dashboard': (context) => DashboardScreen(),
      },
    );
  }
}
