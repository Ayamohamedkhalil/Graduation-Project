import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splash_onboarding_test/components/ButtonBar.dart';
import 'package:splash_onboarding_test/views/DepOrBi_Test.dart';
import 'package:splash_onboarding_test/views/General_Test.dart';

class card extends StatelessWidget {
  const card({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
            child: Container(
              height: 340.h,
              width: 240.w,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image.png'),
                  // fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 25.h,
                    left: 30.w,
                    right: 30.w,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 2, color: Colors.black.withOpacity(.35)),
                        color: Colors.black.withOpacity(.35),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Center(
                        child: Text(
                          'Depression\nOr\nBipolar',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white.withOpacity(.80),
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'InriaSans',
                              shadows: const [
                                Shadow(
                                  offset: Offset(3.0, 3.0),
                                  blurRadius: 5.0,
                                  color: Colors.black,
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const DeporbiTest()));
            }),
        GestureDetector(
            child: Container(
              height: 340.h,
              width: 240.w,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Generaltest.png'),
                  // fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 25.h,
                    left: 30.w,
                    right: 30.w,
                    child: Container(
                      height: 100.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 2, color: Colors.black.withOpacity(.35)),
                        color: Colors.black.withOpacity(.35),
                        //color: Colors.white.withOpacity(.20),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Center(
                        child: Text(
                          'General\nTest',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white.withOpacity(.80),
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'InriaSans',
                              shadows: const [
                                Shadow(
                                  offset: Offset(3.0, 3.0),
                                  blurRadius: 5.0,
                                  color: Colors.black,
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const General_test()));
            }),
      ],
    );
  }
}
