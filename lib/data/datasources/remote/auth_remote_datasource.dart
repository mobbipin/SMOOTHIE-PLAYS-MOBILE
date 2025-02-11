import 'dart:convert';

import 'package:http/http.dart';
import 'package:smoothie_plays_mobile/core/configs%20/constants/api_endpoints.dart';
import 'package:smoothie_plays_mobile/data/models/auth/auth_api_model.dart';

class AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSource({required this.client});

  Future<AuthApiModel> signup({
    required String email,
    required String fullName,
    required String password,
    required String photo,
  }) async {
    final uri = Uri.parse(ApiEndpoints.signup);
    var request = http.MultipartRequest('POST', uri);

    request.fields['email'] = email;
    request.fields['fullName'] = fullName;
    request.fields['password'] = password;

    var file = await http.MultipartFile.fromPath('profileImage', photo);
    request.files.add(file);

    var response = await client.send(request);
    var responseBody = await response.stream.bytesToString();

    if (response.statusCode == 201) {
      return AuthApiModel.fromJson(jsonDecode(responseBody)['user']);
    } else {
      throw Exception('Signup failed: ${responseBody}');
    }
  }

  Future<AuthApiModel> login(String email, String password) async {
    final response = await client.post(
      Uri.parse(ApiEndpoints.login),
      body: jsonEncode({'email': email, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return AuthApiModel.fromJson(jsonDecode(response.body)['user']);
    } else {
      throw Exception('Login failed: ${response.body}');
    }
  }
}
