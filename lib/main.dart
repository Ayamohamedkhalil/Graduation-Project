import 'package:flutter/material.dart';
//import 'package:splash_onboarding_test/home.dart';
import 'package:splash_onboarding_test/Logo/splashScreen.dart';

void main() {
  runApp( test_app());
}

class test_app extends StatelessWidget {
   test_app({super.key});


  @override
  Widget build(BuildContext context) {
        return MaterialApp(
         // title: 'Aya',
      debugShowCheckedModeBanner: false,
      home:Splashscreen() ,
    );
  }
}