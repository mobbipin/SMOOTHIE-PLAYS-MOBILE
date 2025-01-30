class ApiEndpoints {
  static const String baseUrl = 'http://localhost:5002/api/v1';

  // Auth Endpoints
  static String login = '$baseUrl/auth/login';
  static String signup = '$baseUrl/auth/signup';
}
