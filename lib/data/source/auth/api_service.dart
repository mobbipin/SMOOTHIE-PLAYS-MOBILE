import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:smoothie_plays_mobile/core/configs%20/constants/app_urls.dart';
import 'package:smoothie_plays_mobile/data/models/auth/create_user.dart';
import 'package:smoothie_plays_mobile/data/models/auth/signin_user_req.dart';
import 'package:smoothie_plays_mobile/data/models/auth/user.dart';
import 'package:smoothie_plays_mobile/domain/entities/auth/user.dart';

abstract class AuthService {
  Future<Either<String, String>> signup(CreateUserReq createUserReq);
  Future<Either<String, String>> signin(SigninUserReq signinUserReq);
  Future<Either<String, UserEntity>> getUser();
}

class AuthServiceImpl extends AuthService {
  final String apiUrl = 'https://your-api-url.com'; // Your MERN API base URL

  @override
  Future<Either<String, String>> signup(CreateUserReq createUserReq) async {
    try {
      final response = await http.post(
        Uri.parse('$apiUrl/auth/signup'),
        body: json.encode({
          'email': createUserReq.email,
          'password': createUserReq.password,
          'fullName': createUserReq.fullName,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return const Right('Signup was Successful');
      } else {
        return Left('Error: ${response.body}');
      }
    } catch (e) {
      return Left('An error occurred during signup');
    }
  }

  @override
  Future<Either<String, String>> signin(SigninUserReq signinUserReq) async {
    try {
      final response = await http.post(
        Uri.parse('$apiUrl/auth/signin'),
        body: json.encode({
          'email': signinUserReq.email,
          'password': signinUserReq.password,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return const Right('Signin was Successful');
      } else {
        return Left('Error: ${response.body}');
      }
    } catch (e) {
      return Left('An error occurred during signin');
    }
  }

  @override
  Future<Either<String, UserEntity>> getUser() async {
    try {
      final response = await http.get(
        Uri.parse('$apiUrl/auth/user'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer YOUR_AUTH_TOKEN',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        UserModel userModel = UserModel.fromJson(data);
        userModel.imageURL = data['photoURL'] ?? AppURLs.defaultImage;
        UserEntity userEntity = userModel.toEntity();
        return Right(userEntity);
      } else {
        return Left('Error: ${response.body}');
      }
    } catch (e) {
      return Left('An error occurred fetching user data');
    }
  }
}
