import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SPService {
  static const _key = "token";
  get _secureStorage =>
      const FlutterSecureStorage(); // initialize secure storage

  // Save the token as encrypted in secure storage
  Future<void> saveToken(String token) async {
    await _secureStorage.write(key: _key, value: token);
  }

  // Get the encrypted token from secure storage
  Future<String?> getToken() async {
    return await _secureStorage.read(key: _key);
  }

  // Delete the token from secure storage
  Future<void> deleteToken() async {
    await _secureStorage.delete(key: _key);
  }
}
