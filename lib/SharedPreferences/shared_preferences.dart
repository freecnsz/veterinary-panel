import 'package:shared_preferences/shared_preferences.dart';

class SPService {
  // Function to save the token to local memory
  Future<bool> saveTokenToMemory(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('token', token);
  }

  // Function to retrieve the token from local memory
  Future<String?> getTokenFromMemory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}
