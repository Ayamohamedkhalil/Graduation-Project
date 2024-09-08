import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splash_onboarding_test/home.dart';
import 'package:splash_onboarding_test/Registeration/login.dart';
import 'package:splash_onboarding_test/Registeration/sign-up.dart';

class Registeration extends StatelessWidget {
  const Registeration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/Rectangle 32.png',
                width: MediaQuery.of(context).size.width.w,
                height: MediaQuery.of(context).size.height * 0.6,
                fit: BoxFit.fill,
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/New Project-2-svg 1.png',
                    height: 250.h,
                    width: 300.w,
                  ),
                  Center(
                    child: Text(
                      'MALAZ',
                      style: TextStyle(
                        fontFamily: 'Ledger',
                        fontSize: 30.sp, // Adjust the font size as needed
                        fontWeight:
                            FontWeight.w500, // Make the text bold if needed
                        color: Colors.white.withOpacity(
                            .80), // Use a contrasting color to the image
                        letterSpacing:
                            4, // Adjust letter spacing to match the design
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.18,
                  ),
                  Container(
                    width: 270.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.25),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: const Offset(0, 4),
                          )
                        ]),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          alignment: Alignment.center,
                          backgroundColor: const Color(0xff537F5C),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        child: Text(
                          'Log in',
                          style: TextStyle(
                              fontSize: 24.sp,
                              color: Colors.white,
                              fontFamily: 'InriaSans-Bold'),
                        )),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    width: 270.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2, color: const Color(0xff537F5C)),
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.25),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: const Offset(0, 4),
                          )
                        ]),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          alignment: Alignment.center,
                          shadowColor: const Color(0xff537F5C),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Signup()),
                          );
                        },
                        child: Text(
                          'Sign-up',
                          style: TextStyle(
                              fontSize: 24.sp,
                              color: const Color(0xff537F5C),
                              fontFamily: 'InriaSans-Bold'),
                        )),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          color: Colors.black,
                          thickness: 1,
                          indent: 30,
                          endIndent: 10,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Text(
                          'OR',
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          color: Colors.black,
                          thickness: 1,
                          indent: 10,
                          endIndent: 30,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    width: 270.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2, color: const Color(0xff537F5C)),
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.25),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: const Offset(0, 4),
                          )
                        ]),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          alignment: Alignment.center,
                          backgroundColor: Colors.white,
                          shadowColor: const Color(0xff537F5C),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const homescreen()),
                          );
                        },
                        child: Text(
                          'Continue as a guest',
                          style: TextStyle(
                              fontSize: 24.sp,
                              color: const Color(0xff537F5C),
                              fontFamily: 'InriaSans-Bold'),
                        )),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
