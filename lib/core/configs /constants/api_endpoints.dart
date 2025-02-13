class ApiEndpoints {
  static const String baseUrl = 'http://localhost:5001/api';
  static const String login = '$baseUrl/auth/login';
  static const String signup = '$baseUrl/auth/signup';
  static const String googleCallback = '$baseUrl/auth/google/callback';
}
