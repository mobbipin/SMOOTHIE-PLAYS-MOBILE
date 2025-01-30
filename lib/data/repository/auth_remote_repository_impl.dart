import 'package:smoothie_plays_mobile/data/datasources/remote/auth_remote_datasource.dart';
import 'package:smoothie_plays_mobile/domain/entities/auth/auth_entity.dart';
import 'package:smoothie_plays_mobile/domain/repository/auth/auth_repository.dart';

class AuthRemoteRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRemoteRepositoryImpl({required this.remoteDataSource});

  @override
  Future<AuthEntity> login(String email, String password) async {
    final authModel = await remoteDataSource.login(email, password);
    return AuthEntity(
      userId: authModel.userId ?? '',
      email: authModel.email,
      fullName: authModel.fullName,
      photo: authModel.photo,
      token: authModel.accessToken ?? '',
    );
  }

  @override
  Future<AuthEntity> signup(
    String email,
    String fullName,
    String password,
    String photo,
  ) async {
    final authModel = await remoteDataSource.signup(
      email: email,
      fullName: fullName,
      password: password,
      photo: photo,
    );
    return AuthEntity(
      userId: authModel.userId ?? '',
      email: authModel.email,
      fullName: authModel.fullName,
      photo: authModel.photo,
      token: authModel.accessToken ?? '',
    );
  }
}
