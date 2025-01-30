import 'package:smoothie_plays_mobile/data/datasources/local/auth_local_data_source.dart';
import 'package:smoothie_plays_mobile/data/models/auth/auth_hive_model.dart';
import 'package:smoothie_plays_mobile/domain/entities/auth/auth_entity.dart';
import 'package:smoothie_plays_mobile/domain/repository/auth/auth_repository.dart';

class AuthLocalRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource localDataSource;

  AuthLocalRepositoryImpl({required this.localDataSource});

  @override
  Future<AuthEntity> login(String username, String password) async {
    final user = await localDataSource.getUserByUsername(username);
    if (user == null) throw Exception('User not found');
    if (user.password != password) throw Exception('Invalid password');
    return AuthEntity(
      userId: user.userId,
      username: user.username,
      fullName: user.fullName,
      photo: user.photo,
    );
  }

  @override
  Future<AuthEntity> signup(
    String username,
    String fullName,
    String password,
    String photo,
  ) async {
    if (await localDataSource.usernameExists(username)) {
      throw Exception('Username already exists');
    }

    final newUser = AuthHiveModel(
      userId: DateTime.now().microsecondsSinceEpoch.toString(),
      username: username,
      fullName: fullName,
      password: password,
      photo: photo,
    );

    await localDataSource.saveUser(newUser);
    return AuthEntity(
      userId: newUser.userId,
      username: newUser.username,
      fullName: newUser.fullName,
      photo: newUser.photo,
    );
  }
}
