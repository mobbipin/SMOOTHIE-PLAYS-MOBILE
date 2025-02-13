import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:smoothie_plays_mobile/core/configs%20/constants/api_endpoints.dart';
import 'package:smoothie_plays_mobile/data/models/auth/auth_api_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthApiModel> emailSignup({
    required String fullName,
    required String email,
    required String password,
    required File? photo,
  });
  Future<AuthApiModel> emailLogin({
    required String email,
    required String password,
  });
  Future<AuthApiModel> googleAuth({
    required String id,
    required String fullName,
    required String email,
    required String imageUrl,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<AuthApiModel> emailSignup({
    required String fullName,
    required String email,
    required String password,
    required File? photo,
  }) async {
    final uri = Uri.parse(ApiEndpoints.signup);
    final request = http.MultipartRequest("POST", uri);
    request.fields['fullName'] = fullName;
    request.fields['email'] = email;
    request.fields['password'] = password;

    if (photo != null) {
      request.files.add(await http.MultipartFile.fromPath('photo', photo.path));
    } else {
      request.fields['photo'] = 'assets/images/defaultphoto.jpg';
    }
    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);
    if (response.statusCode == 201) {
      final jsonResponse = json.decode(response.body);
      return AuthApiModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to sign up: ${response.body}');
    }
  }

  @override
  Future<AuthApiModel> emailLogin({
    required String email,
    required String password,
  }) async {
    final response = await client.post(
      Uri.parse(ApiEndpoints.login),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password}),
    );
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return AuthApiModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to login: ${response.body}');
    }
  }

  @override
  Future<AuthApiModel> googleAuth({
    required String id,
    required String fullName,
    required String email,
    required String imageUrl,
  }) async {
    final response = await client.post(
      Uri.parse(ApiEndpoints.googleCallback),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'id': id,
        'fullName': fullName,
        'email': email,
        'imageUrl': imageUrl,
      }),
    );
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return AuthApiModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to authenticate with Google: ${response.body}');
    }
  }
}
