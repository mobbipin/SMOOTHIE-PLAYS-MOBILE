import 'dart:io';

import 'package:smoothie_plays_mobile/domain/entities/auth/auth_entity.dart';

abstract class AuthRepository {
  Future<AuthEntity> emailSignup({
    required String fullName,
    required String email,
    required String password,
    File? photo,
  });
  Future<AuthEntity> emailLogin({
    required String email,
    required String password,
  });
  Future<AuthEntity> googleAuth({
    required String id,
    required String fullName,
    required String email,
    required String imageUrl,
  });
}
