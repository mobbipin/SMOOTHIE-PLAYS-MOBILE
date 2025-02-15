import 'package:smoothie_plays_mobile/data/models/auth/auth_api_model.dart';

class AuthEntity {
  final String userId;
  final String fullName;
  final String email;
  final String imageUrl;
  final String token;

  AuthEntity({
    required this.userId,
    required this.fullName,
    required this.email,
    required this.imageUrl,
    required this.token,
  });

  Map<String, dynamic> toJson() {
    return {
      'user': {
        'userId': userId,
        'fullName': fullName,
        'email': email,
        'imageUrl': imageUrl,
      },
      'token': token,
    };
  }

  //optionsl
  AuthApiModel toApiModel() {
    return AuthApiModel(
      userId: this.userId,
      fullName: this.fullName,
      email: this.email,
      imageUrl: this.imageUrl,
      token: this.token,
    );
  }
}
