import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smoothie_plays_mobile/core/configs%20/theme/app_theme.dart';
import 'package:smoothie_plays_mobile/core/di/di.dart';
import 'package:smoothie_plays_mobile/data/models/auth/auth_hive_model.dart';
import 'package:smoothie_plays_mobile/presentation/song/bloc/song_bloc.dart';
import 'package:smoothie_plays_mobile/presentation/splash/pages/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();
  Hive.registerAdapter(AuthHiveModelAdapter());

  // Open auth box
  await Hive.openBox<AuthHiveModel>('authBox');

  setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<SongBloc>()),
      ],
      child: MaterialApp(
        title: 'Smoothie Plays',
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        home: const SplashPage(),
      ),
    );
  }
}
