import 'package:smoothie_plays_mobile/domain/entities/auth/auth_entity.dart';
import 'package:smoothie_plays_mobile/domain/repository/auth/auth_repository.dart';

class EmailLoginUseCase {
  final AuthRepository repository;

  EmailLoginUseCase({required this.repository});

  Future<AuthEntity> execute({
    required String email,
    required String password,
  }) {
    return repository.emailLogin(email: email, password: password);
  }
}
