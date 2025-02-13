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
}
