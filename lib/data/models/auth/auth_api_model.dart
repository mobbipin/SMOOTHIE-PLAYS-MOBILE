class AuthApiModel {
  final String userId;
  final String fullName;
  final String email;
  final String imageUrl;
  final String token;

  AuthApiModel({
    required this.userId,
    required this.fullName,
    required this.email,
    required this.imageUrl,
    required this.token,
  });

  factory AuthApiModel.fromJson(Map<String, dynamic> json) {
    return AuthApiModel(
      userId: json['user']['userId'] as String,
      fullName: json['user']['fullName'] as String,
      email: json['user']['email'] as String,
      imageUrl: json['user']['imageUrl'] as String,
      token: json['token'] as String,
    );
  }
}
