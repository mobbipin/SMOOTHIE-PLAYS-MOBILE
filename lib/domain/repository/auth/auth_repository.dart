import 'package:smoothie_plays_mobile/domain/entities/auth/auth_entity.dart';

abstract class AuthRepository {
  Future<AuthEntity> login(String username, String password);
  Future<AuthEntity> signup(
    String username,
    String fullName,
    String password,
    String photo,
  );
}
