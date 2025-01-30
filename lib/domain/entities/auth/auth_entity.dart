class AuthEntity {
  final String userId;
  final String username;
  final String fullName;
  final String photo;
  final String token;

  AuthEntity({
    required this.userId,
    required this.username,
    required this.fullName,
    required this.photo,
    required this.token,
  });
}
