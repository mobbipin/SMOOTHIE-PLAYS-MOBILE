import 'package:smoothie_plays_mobile/data/datasources/local/auth_local_data_source.dart';
import 'package:smoothie_plays_mobile/data/models/auth/auth_hive_model.dart';
import 'package:smoothie_plays_mobile/domain/entities/auth/auth_entity.dart';
import 'package:smoothie_plays_mobile/domain/repository/auth/auth_repository.dart';

class AuthLocalRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource localDataSource;

  AuthLocalRepositoryImpl({required this.localDataSource});

  @override
  Future<AuthEntity> login(String email, String password) async {
    final user = await localDataSource.getUserByemail(email);
    if (user == null) throw Exception('User not found');
    if (user.password != password) throw Exception('Invalid password');
    return AuthEntity(
      userId: user.userId,
      email: user.email,
      fullName: user.fullName,
      photo: user.photo,
      token: '',
    );
  }

  @override
  Future<AuthEntity> signup(
    String email,
    String fullName,
    String password,
    String photo,
  ) async {
    if (await localDataSource.emailExists(email)) {
      throw Exception('email already exists');
    }

    final newUser = AuthHiveModel(
      userId: DateTime.now().microsecondsSinceEpoch.toString(),
      email: email,
      fullName: fullName,
      password: password,
      photo: photo,
    );

    await localDataSource.saveUser(newUser);
    return AuthEntity(
      userId: newUser.userId,
      email: newUser.email,
      fullName: newUser.fullName,
      photo: newUser.photo,
      token: '',
    );
  }
}
