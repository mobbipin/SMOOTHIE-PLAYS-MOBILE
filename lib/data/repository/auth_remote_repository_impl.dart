import 'dart:io';

import 'package:smoothie_plays_mobile/data/datasources/remote/auth_remote_datasource.dart';
import 'package:smoothie_plays_mobile/domain/entities/auth/auth_entity.dart';
import 'package:smoothie_plays_mobile/domain/repository/auth/auth_repository.dart';

class AuthRemoteRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRemoteRepositoryImpl({required this.remoteDataSource});

  @override
  Future<AuthEntity> emailSignup({
    required String fullName,
    required String email,
    required String password,
    File? photo,
  }) async {
    final apiModel = await remoteDataSource.emailSignup(
      fullName: fullName,
      email: email,
      password: password,
      photo: photo,
    );
    return AuthEntity(
      userId: apiModel.userId,
      fullName: apiModel.fullName,
      email: apiModel.email,
      imageUrl: apiModel.imageUrl,
      token: apiModel.token,
    );
  }

  @override
  Future<AuthEntity> emailLogin({
    required String email,
    required String password,
  }) async {
    final apiModel = await remoteDataSource.emailLogin(
      email: email,
      password: password,
    );
    return AuthEntity(
      userId: apiModel.userId,
      fullName: apiModel.fullName,
      email: apiModel.email,
      imageUrl: apiModel.imageUrl,
      token: apiModel.token,
    );
  }

  @override
  Future<AuthEntity> googleAuth({
    required String id,
    required String fullName,
    required String email,
    required String imageUrl,
  }) async {
    final apiModel = await remoteDataSource.googleAuth(
      id: id,
      fullName: fullName,
      email: email,
      imageUrl: imageUrl,
    );
    return AuthEntity(
      userId: apiModel.userId,
      fullName: apiModel.fullName,
      email: apiModel.email,
      imageUrl: apiModel.imageUrl,
      token: apiModel.token,
    );
  }
}
