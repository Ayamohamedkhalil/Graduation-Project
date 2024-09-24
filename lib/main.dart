
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:splash_onboarding_test/home.dart';
//import 'package:device_preview/device_preview.dart';
import 'package:splash_onboarding_test/views/splashfile/splashview.dart';

void main() {
  runApp(
    /* DevicePreview(
    //enabled: true,
    builder: (context) => test_app(), // Wrap your app
  )*/
    test_app(),
  );
}

class test_app extends StatelessWidget {
  const test_app({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
           /* locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,*/
            // title: 'Aya',
            debugShowCheckedModeBanner: false,
            home: SplashView(),
          );
        });
  }
}
