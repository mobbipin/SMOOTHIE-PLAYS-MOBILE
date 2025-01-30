import 'package:hive/hive.dart';

part 'auth_hive_model.g.dart'; // Relative path to the generated file

@HiveType(typeId: 0) // Unique typeId
class AuthHiveModel {
  @HiveField(0)
  final String userId;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final String fullName;

  @HiveField(3)
  final String password;

  @HiveField(4)
  final String photo;

  AuthHiveModel({
    required this.userId,
    required this.email,
    required this.fullName,
    required this.password,
    required this.photo,
  });
}
