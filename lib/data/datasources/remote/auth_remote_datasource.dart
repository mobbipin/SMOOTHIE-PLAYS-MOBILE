import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smoothie_plays_mobile/core/configs%20/constants/api_endpoints.dart';
import 'package:smoothie_plays_mobile/data/models/auth/auth_api_model.dart';

class AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSource({required this.client});

  Future<AuthApiModel> login(String email, String password) async {
    final response = await client.post(
      Uri.parse(ApiEndpoints.login),
      body: jsonEncode({'email': email, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return AuthApiModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Login failed: ${response.body}');
    }
  }

  Future<AuthApiModel> signup({
    required String username,
    required String fullName,
    required String password,
    required String photo,
  }) async {
    final response = await client.post(
      Uri.parse(ApiEndpoints.signup),
      body: jsonEncode({
        'username': username,
        'fullName': fullName,
        'password': password,
        'photo': photo,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 201) {
      return AuthApiModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Signup failed: ${response.body}');
    }
  }
}
