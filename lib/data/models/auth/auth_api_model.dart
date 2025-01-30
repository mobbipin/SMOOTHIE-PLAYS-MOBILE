import 'package:json_annotation/json_annotation.dart';

part 'auth_api_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AuthApiModel {
  @JsonKey(name: '_id')
  final String? userId;
  final String username;
  final String fullName;
  final String? password;
  final String photo;

  // Add these fields if your API returns them
  final String? accessToken;
  final String? refreshToken;

  AuthApiModel({
    this.userId,
    required this.username,
    required this.fullName,
    this.password,
    required this.photo,
    this.accessToken,
    this.refreshToken,
  });

  // Add these two methods
  factory AuthApiModel.fromJson(Map<String, dynamic> json) =>
      _$AuthApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthApiModelToJson(this);
}
