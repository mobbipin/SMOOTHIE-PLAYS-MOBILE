import 'package:smoothie_plays_mobile/domain/entities/auth/auth_entity.dart';
import 'package:smoothie_plays_mobile/domain/repository/auth/auth_repository.dart';

class SignupUseCase {
  final AuthRepository repository;

  SignupUseCase({required this.repository});

  Future<AuthEntity> execute({
    required String username,
    required String fullName,
    required String password,
    required String photo,
  }) async {
    return await repository.signup(username, fullName, password, photo);
  }
}
