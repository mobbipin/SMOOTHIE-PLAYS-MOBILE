import 'package:hive/hive.dart';
import 'package:smoothie_plays_mobile/data/models/auth/auth_hive_model.dart';

class AuthLocalDataSource {
  static const String _authBox = 'authBox';

  Future<Box<AuthHiveModel>> get _authBoxInstance async {
    return await Hive.openBox<AuthHiveModel>(_authBox);
  }

  // Save user data locally
  Future<void> saveUser(AuthHiveModel user) async {
    final box = await _authBoxInstance;
    await box.put(user.userId, user);
  }

  // Get user by username (for login)
  Future<AuthHiveModel?> getUserByUsername(String username) async {
    final box = await _authBoxInstance;
    try {
      return box.values.firstWhere(
        (user) => user.username == username,
      );
    } on StateError {
      return null;
    }
  }

  // Check if username exists (for signup)
  Future<bool> usernameExists(String username) async {
    final box = await _authBoxInstance;
    return box.values.any((user) => user.username == username);
  }
}
