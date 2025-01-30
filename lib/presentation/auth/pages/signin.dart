import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smoothie_plays_mobile/core/configs%20/assets/app_vectors.dart';
import 'package:smoothie_plays_mobile/data/datasources/local/auth_local_data_source.dart';
import 'package:smoothie_plays_mobile/data/datasources/local/auth_local_datasource.dart'; // Import the data source
import 'package:smoothie_plays_mobile/data/repositories/auth_local_repository_impl.dart'; // Import the repository
import 'package:smoothie_plays_mobile/data/repository/auth_repository_impl.dart.dart';
import 'package:smoothie_plays_mobile/domain/usecases/auth/login_usecase.dart';
import 'package:smoothie_plays_mobile/domain/usecases/login_usecase.dart'; // Import the use case
import 'package:smoothie_plays_mobile/previousContent/view/dashboard.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  // Initialize Hive data source and repository
  final AuthLocalDataSource localDataSource = AuthLocalDataSource();
  late final AuthLocalRepositoryImpl authRepository =
      AuthLocalRepositoryImpl(localDataSource: localDataSource);
  late final LoginUseCase loginUseCase =
      LoginUseCase(repository: authRepository);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signupText(context),
      appBar: AppBar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _registerText(),
            const SizedBox(height: 50),
            _emailField(context),
            const SizedBox(height: 20),
            _passwordField(context),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final email = _email.text.trim();
                final password = _password.text.trim();

                try {
                  // Use the login use case to authenticate
                  final user = await loginUseCase.execute(email, password);

                  // If login is successful, navigate to the dashboard
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const DashboardScreen(),
                    ),
                    (route) => false,
                  );
                } catch (e) {
                  // Show error message if login fails
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(e.toString()),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                }
              },
              child: const Text('Sign In'),
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                backgroundColor: Theme.of(context).primaryColor,
                textStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Rest of the code remains unchanged...
}
