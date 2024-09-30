import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:splash_onboarding_test/firebase_options.dart';
import 'package:splash_onboarding_test/views/splashfile/splashview.dart';

// Handler for background messages
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message");
  print("Title: ${message.notification?.title}");
  print("Body: ${message.notification?.body}");
}

void main() async {
  // Ensures that widgets are initialized before other asynchronous tasks
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase services
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Set up the background message handler
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Run the app
  runApp(MyApp());
}

// Main application widget
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the static instance of FirebaseAnalytics
   /* FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    FirebaseAnalyticsObserver observer =
        FirebaseAnalyticsObserver(analytics: analytics);
*/
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     // navigatorObservers: [observer], // Add the observer to track analytics events
      home: SplashView(),
    );
  }
}
