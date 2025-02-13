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
      userId: json['user']['userId'],
      fullName: json['user']['fullName'],
      email: json['user']['email'],
      imageUrl: json['user']['imageUrl'],
      token: json['token'],
    );
  }
}
