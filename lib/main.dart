import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smoothie_plays_mobile/data/models/auth/auth_hive_model.dart';
import 'package:smoothie_plays_mobile/presentation/splash/pages/splash.dart';

import 'core/configs /theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();
  Hive.registerAdapter(AuthHiveModelAdapter());

  // Open auth box
  await Hive.openBox<AuthHiveModel>('authBox');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smoothie Plays : ',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }
}
