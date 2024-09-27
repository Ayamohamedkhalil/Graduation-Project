import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:splash_onboarding_test/firebase_options.dart';
import 'package:splash_onboarding_test/views/firebase_notifications/firebase_notifications.dart';

//import 'package:splash_onboarding_test/home.dart';
//import 'package:device_preview/device_preview.dart';
import 'package:splash_onboarding_test/views/splashfile/splashview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await firebasenotifications().initnotifications();
  runApp(test_app());
}

class test_app extends StatelessWidget {
  const test_app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /* locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,*/
      // title: 'Aya',
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
