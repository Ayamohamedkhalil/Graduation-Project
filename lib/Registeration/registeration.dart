import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splash_onboarding_test/home.dart';
import 'package:splash_onboarding_test/Registeration/login.dart';
import 'package:splash_onboarding_test/Registeration/sign-up.dart';
import 'auth_service.dart'; // Import the AuthService

class Registeration extends StatelessWidget {
  const Registeration({super.key});

  void _continueAsGuest(BuildContext context) async {
    await AuthService.saveLoginInfo("", "", "", isGuest: true);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const homescreen()),
    );
  }

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
<<<<<<< HEAD
=======
          const SizedBox(
            height: 2,
          ),
          Container(
            width: 270,
            height: 44,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
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
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                },
                child: const Text(
                  'Log in',
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontFamily: 'InriaSans-Bold'),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 270,
            height: 44,
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: const Color(0xff537F5C)),
                borderRadius: BorderRadius.circular(20),
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
                    MaterialPageRoute(builder: (context) => const Signup()),
                  );
                },
                child: const Text(
                  'Sign-up',
                  style: TextStyle(
                      fontSize: 24,
                      color: Color(0xff537F5C),
                      fontFamily: 'InriaSans-Bold'),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          const Row(
            children: [
              Expanded(
                child: Divider(
                  color: Colors.black,
                  thickness: 1,
                  indent: 30,
                  endIndent: 10,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'OR',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Divider(
                  color: Colors.black,
                  thickness: 1,
                  indent: 10,
                  endIndent: 30,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          Container(
            width: 270,
            height: 44,
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: const Color(0xff537F5C)),
                borderRadius: BorderRadius.circular(20),
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
                  _continueAsGuest(context);
                },
                child: const Text(
                  'Continue as a guest',
                  style: TextStyle(
                      fontSize: 24,
                      color: Color(0xff537F5C),
                      fontFamily: 'InriaSans-Bold'),
                )),
          ),
>>>>>>> e75564316d68a4e8b8b34c5e32fda5ab47661df0
        ],
      ),
    );
  }
}