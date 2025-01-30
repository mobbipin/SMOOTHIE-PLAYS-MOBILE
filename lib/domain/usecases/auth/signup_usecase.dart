import 'package:smoothie_plays_mobile/domain/entities/auth/auth_entity.dart';
import 'package:smoothie_plays_mobile/domain/repository/auth/auth_repository.dart';

class SignupUseCase {
  final AuthRepository repository;

  SignupUseCase({required this.repository});

  Future<AuthEntity> execute({
    required String email,
    required String fullName,
    required String password,
    required String photo,
  }) async {
    return await repository.signup(email, fullName, password, photo);
  }
}
