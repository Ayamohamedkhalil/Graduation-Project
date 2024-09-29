import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseNotifications {
  //create instance of FirebaseMessaging
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  // Initialize notifications for the app or device
  Future<void> initNotifications() async {
    // Request permission for notifications
    await _firebaseMessaging.requestPermission();
    
    // Get the Firebase token
    String? fcm_token = await _firebaseMessaging.getToken();

    // Print token to terminal
    //print("Token: $fcm_token");

    // Save the token locally using SharedPreferences
    if (fcm_token != null) {
      await _saveToken(fcm_token);
    }
  }

  // Function to save token in SharedPreferences
  Future<void> _saveToken(String  fcm_token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('fcm_token',fcm_token );
  }

  // Function to get token from SharedPreferences
  Future<String?> getTokenFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('fcm_token');
  }

  // Function to log out and remove the token
  Future<void> logout() async {
    
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('fcm_token');
    print('Token removed from SharedPreferences');
  }
}
