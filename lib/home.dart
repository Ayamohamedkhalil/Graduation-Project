//import 'dart:math';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splash_onboarding_test/components/ButtonBar.dart';
import 'package:splash_onboarding_test/components/card.dart';

//import 'package:splash_onboarding_test/views/resultPage2.dart';

class homescreen extends StatelessWidget {
  const homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: 5.w),
          child: Text(
            'MALAZ',
            style: TextStyle(
              decoration: TextDecoration.underline,
              decorationColor: Color(0xff849A8A),
              color: const Color(0xff849A8A),
              fontSize: 30.sp,
              fontFamily: 'Ledger',
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        //to remove icon from appbar
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: EdgeInsets.only(bottom: 3.h),
            child: Container(
                margin: EdgeInsets.only(right: 23.w),
                height: 40.h,
                width: 40.w,
                child: Image.asset('assets/contact.png')),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 7.w),
              height: 130.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                  color: const Color(0xff537F5C),
                  borderRadius: BorderRadius.circular(20.r)),
              child: Row(
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5.w),
                          child: Text(
                            '  "Getting help is a ',
                            style: TextStyle(
                                fontSize: 2.sp,
                                color: Colors.white.withOpacity(.80),
                                fontWeight: FontWeight.w500,
                                shadows: [
                                  Shadow(
                                    offset: const Offset(3.0, 3.0),
                                    blurRadius: 5.0,
                                    color: Colors.black.withOpacity(.50),
                                  ),
                                ]),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.w),
                          child: Text(
                            ' sign of wisdom,',
                            style: TextStyle(
                                fontSize: 23.sp,
                                color: Colors.white.withOpacity(.80),
                                fontWeight: FontWeight.w500,
                                shadows: [
                                  Shadow(
                                    offset: const Offset(3.0, 3.0),
                                    blurRadius: 5.0,
                                    color: Colors.black.withOpacity(.50),
                                  ),
                                ]),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.w),
                          child: Text(
                            ' not weakness."',
                            style: TextStyle(
                                fontSize: 23.sp,
                                color: Colors.white.withOpacity(.80),
                                fontWeight: FontWeight.w500,
                                shadows: [
                                  Shadow(
                                    offset: const Offset(3.0, 3.0),
                                    blurRadius: 5.0,
                                    color: Colors.black.withOpacity(.50),
                                  ),
                                ]),
                          ),
                        )
                      ]),
                  Image.asset(
                    'assets/logo.png',
                    height: 170.h,
                    width: 165.w,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 14.h,
            ),
            //
            //Searchbar
            //
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 15.h),
              child: SizedBox(
                height: 40.h,
                width: MediaQuery.of(context).size.width.w * 0.8,
                child: TextFormField(
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    //hoverColor: Colors.white,
                    filled: true,
                    fillColor: const Color(
                        0xffC4D3C7), // Background color similar to the image
                    prefixIcon: const Icon(Icons.search,
                        color: Color(0xFF537F5C)), // Left icon
                    suffixIcon: const Icon(Icons.mic_none,
                        color: Color(0xFF537F5C)), // Right icon
                    hintText: 'Search for test',
                    hintStyle: TextStyle(
                        color: Color(0xFF537F5C),
                        fontFamily: 'Ledger',
                        fontSize: 18.sp), // Text color similar to the image
                    contentPadding: EdgeInsets.symmetric(vertical: 2.0.w),
                    // Padding to align text centrally
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(25.0.r), // Rounded corners
                      borderSide: const BorderSide(
                        color: Color(
                            0xFF52734D), // Border color similar to the image
                        width: 1.2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0.r),
                      borderSide: const BorderSide(
                        color:
                            Color(0xFF537F5C), // Border color for enabled state
                        width: 1.2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0.r),
                      borderSide: const BorderSide(
                        color:
                            Color(0xFF537F5C), // Border color for focused state
                        width: 1.2,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 370.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return const card();
                },
              ),
            ),
            const BarButton(),
          ],
        ),
      ),
    );
  }
}
