class AuthEntity {
  final String userId;
  final String email;
  final String fullName;
  final String photo;
  final String token;

  AuthEntity({
    required this.userId,
    required this.email,
    required this.fullName,
    required this.photo,
    required this.token,
  });
}
