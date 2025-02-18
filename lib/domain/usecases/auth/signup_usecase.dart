import 'dart:io';

import 'package:smoothie_plays_mobile/domain/entities/auth/auth_entity.dart';
import 'package:smoothie_plays_mobile/domain/repository/auth/auth_repository.dart';

class EmailSignupUseCase {
  final AuthRepository repository;

  EmailSignupUseCase({required this.repository});

  Future<AuthEntity> execute({
    required String fullName,
    required String email,
    required String password,
    File? photo,
  }) {
    return repository.emailSignup(
      fullName: fullName,
      email: email,
      password: password,
      photo: photo,
    );
  }
}
