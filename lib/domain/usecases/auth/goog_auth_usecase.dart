import 'package:smoothie_plays_mobile/domain/entities/auth/auth_entity.dart';
import 'package:smoothie_plays_mobile/domain/repository/auth/auth_repository.dart';

class GoogleAuthUseCase {
  final AuthRepository repository;

  GoogleAuthUseCase({required this.repository});

  Future<AuthEntity> execute({
    required String id,
    required String fullName,
    required String email,
    required String imageUrl,
  }) {
    return repository.googleAuth(
      id: id,
      fullName: fullName,
      email: email,
      imageUrl: imageUrl,
    );
  }
}
