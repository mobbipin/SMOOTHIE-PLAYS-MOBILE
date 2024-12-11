import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smoothie_plays_mobile/models/login_request_model.dart';
import 'package:smoothie_plays_mobile/models/signup_request_model.dart';

class ApiService {
  final String baseUrl =
      'http://localhost:5000/api/auth'; // Replace with your actual API URL

  // Login API call
  Future<String> loginUser(LoginRequest loginRequest) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(loginRequest.toJson()),
    );

    if (response.statusCode == 200) {
      // If the server returns a success response, parse the JSON
      var data = json.decode(response.body);
      return data['token']; // Assuming the token is returned
    } else {
      throw Exception('Failed to login');
    }
  }

  // Signup API call
  Future<String> registerUser(SignupRequest signupRequest) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(signupRequest.toJson()),
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data['message']; // Assuming success message is returned
    } else {
      throw Exception('Failed to register');
    }
  }
}
