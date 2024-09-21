import 'package:flutter/material.dart';
//import 'package:splash_onboarding_test/home.dart';

import 'package:splash_onboarding_test/views/splashfile/splashview.dart';

void main() {
  runApp( test_app());
}

class test_app extends StatelessWidget {
   const test_app({super.key});


  @override
  Widget build(BuildContext context) {
        return const MaterialApp(
         // title: 'Aya',
      debugShowCheckedModeBanner: false,
      home:SplashView() ,
    );
  }
}