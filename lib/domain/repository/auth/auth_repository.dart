import 'package:smoothie_plays_mobile/domain/entities/auth/auth_entity.dart';

abstract class AuthRepository {
  Future<AuthEntity> login(String email, String password);
  Future<AuthEntity> signup(
    String email,
    String fullName,
    String password,
    String photo,
  );
}
