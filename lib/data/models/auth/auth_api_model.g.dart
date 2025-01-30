// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthApiModel _$AuthApiModelFromJson(Map<String, dynamic> json) => AuthApiModel(
      userId: json['_id'] as String?,
      email: json['email'] as String,
      fullName: json['fullName'] as String,
      password: json['password'] as String?,
      photo: json['photo'] as String,
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
    );

Map<String, dynamic> _$AuthApiModelToJson(AuthApiModel instance) =>
    <String, dynamic>{
      '_id': instance.userId,
      'email': instance.email,
      'fullName': instance.fullName,
      'password': instance.password,
      'photo': instance.photo,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
