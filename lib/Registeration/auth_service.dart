// auth_service.dart
import 'package:shared_preferences/shared_preferences.dart';


class AuthService {
  // Save token, email, and username
  static Future<void> saveLoginInfo(String token, String email, String username, {bool isGuest = false}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('authToken', token);
    await prefs.setString('email', email);
    await prefs.setString('username', username);
    await prefs.setBool('isGuest', isGuest);
    print('Token, email, username saved successfully, IsGuest: $isGuest');
  }

  // Get token
  static Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('authToken');
  }

  // Get email
  static Future<String?> getEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('email');
  }

  // Get username
  static Future<String?> getUsername() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('username');
  }

  // Check if user is a guest
  static Future<bool?> isGuest() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isGuest');
  }
}