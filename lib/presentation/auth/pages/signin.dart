import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:smoothie_plays_mobile/core/configs%20/assets/app_vectors.dart';
import 'package:smoothie_plays_mobile/data/datasources/remote/auth_remote_datasource.dart';
import 'package:smoothie_plays_mobile/data/repository/auth_remote_repository_impl.dart';
import 'package:smoothie_plays_mobile/domain/entities/auth/auth_entity.dart';
import 'package:smoothie_plays_mobile/domain/usecases/auth/goog_auth_usecase.dart';
import 'package:smoothie_plays_mobile/domain/usecases/auth/login_usecase.dart';
import 'package:smoothie_plays_mobile/presentation/auth/pages/signup.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);
  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();

  // Data Layer setup
  final AuthRemoteDataSourceImpl remoteDataSource =
      AuthRemoteDataSourceImpl(client: http.Client());
  late final AuthRemoteRepositoryImpl authRepository =
      AuthRemoteRepositoryImpl(remoteDataSource: remoteDataSource);

  // Domain use cases
  late final EmailLoginUseCase emailLoginUseCase =
      EmailLoginUseCase(repository: authRepository);
  late final GoogleAuthUseCase googleAuthUseCase =
      GoogleAuthUseCase(repository: authRepository);

  // GoogleSignIn instance
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  void _handleEmailLogin() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _isLoading = true;
    });
    try {
      final AuthEntity authEntity = await emailLoginUseCase.execute(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Login successful, Welcome ${authEntity.fullName}')),
      );
      // TODO: Navigate to your Home page.
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _handleGoogleLogin() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return;
      final id = googleUser.id;
      final fullName = googleUser.displayName ?? '';
      final email = googleUser.email;
      final imageUrl = googleUser.photoUrl ?? '';
      final AuthEntity authEntity = await googleAuthUseCase.execute(
        id: id,
        fullName: fullName,
        email: email,
        imageUrl: imageUrl,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Google Login successful, Welcome ${authEntity.fullName}')),
      );
      // TODO: Navigate to your Home page.
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Google sign in failed: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Email is required';
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(AppVectors.logo, height: 40, width: 40),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Text(
                  'Sign In',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                  ),
                  validator: _validateEmail,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                  ),
                  obscureText: true,
                  validator: _validatePassword,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _isLoading ? null : _handleEmailLogin,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text('Login with Email'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _handleGoogleLogin,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text('Login with Google'),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const SignupPage()));
                  },
                  child: const Text("Don't have an account? Sign up here"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
