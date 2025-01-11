import 'package:flutter/material.dart';
import 'package:smoothie_plays_mobile/presentation/splash/pages/splash.dart';

import 'core/configs /theme/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smoothie Plays ',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }
}
