import 'package:flutter/material.dart';
//import 'package:splash_onboarding_test/home.dart';
import 'package:splash_onboarding_test/Logo/splashScreen.dart';

void main() {
  runApp(const test_app());
}

class test_app extends StatelessWidget {
  const test_app({super.key});

  @override
  Widget build(BuildContext context) {
        return MaterialApp(
          title: 'Aya',
      debugShowCheckedModeBanner: true,
      home:Splashscreen() ,
    );
  }
}