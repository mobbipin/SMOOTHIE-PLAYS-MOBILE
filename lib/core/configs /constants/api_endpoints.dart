class ApiEndpoints {
  static const String baseUrl = 'http://localhost:5001/api';

  // Auth Endpoints
  static String login = '$baseUrl/auth/signin';
  static String signup = '$baseUrl/auth/signup';
}
