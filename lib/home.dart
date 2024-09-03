//import 'dart:math';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:splash_onboarding_test/components/card.dart';
import 'package:splash_onboarding_test/views/UserProfile.dart';
//import 'package:splash_onboarding_test/views/resultPage2.dart';

class homescreen extends StatelessWidget {
  const homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            'MALAZ',
            style: TextStyle(
              decoration: TextDecoration.underline,
              decorationColor: Color(0xff849A8A),
              color: Color(0xff849A8A),
              fontSize: 30,
              fontFamily: 'Ledger',
            ),
          ),
        ),

        automaticallyImplyLeading: false,
        //to remove icon from appbar
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: Container(
                margin: EdgeInsets.only(right: 23),
                height: 40,
                width: 40,
                child: Image.asset('assets/contact.png')),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 7),
              height: 130,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                  color: Color(0xff537F5C),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            '  "Getting help is a ',
                            style: TextStyle(
                                fontSize: 23,
                                color: Colors.white.withOpacity(.80),
                                fontWeight: FontWeight.w500,
                                shadows: [
                                  Shadow(
                                    offset: Offset(3.0, 3.0),
                                    blurRadius: 5.0,
                                    color: Colors.black.withOpacity(.50),
                                  ),
                                ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            ' sign of wisdom,',
                            style: TextStyle(
                                fontSize: 23,
                                color: Colors.white.withOpacity(.80),
                                fontWeight: FontWeight.w500,
                                shadows: [
                                  Shadow(
                                    offset: Offset(3.0, 3.0),
                                    blurRadius: 5.0,
                                    color: Colors.black.withOpacity(.50),
                                  ),
                                ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            ' not weakness."',
                            style: TextStyle(
                                fontSize: 23,
                                color: Colors.white.withOpacity(.80),
                                fontWeight: FontWeight.w500,
                                shadows: [
                                  Shadow(
                                    offset: Offset(3.0, 3.0),
                                    blurRadius: 5.0,
                                    color: Colors.black.withOpacity(.50),
                                  ),
                                ]),
                          ),
                        )
                      ]),
                  Image.asset(
                    'assets/logo.png',
                    height: 170,
                    width: 165,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 15),
              child: Container(
                //margin: EdgeInsets.only(top: 10),
                height: 40,
                width: 400,
                child: TextFormField(
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    //hoverColor: Colors.white,
                    filled: true,
                    fillColor: Color(
                        0xffC4D3C7), // Background color similar to the image
                    prefixIcon: Icon(Icons.search,
                        color: Color(0xFF537F5C)), // Left icon
                    suffixIcon: Icon(Icons.mic_none,
                        color: Color(0xFF537F5C)), // Right icon
                    hintText: 'Search for test',
                    hintStyle: TextStyle(
                        color: Color(0xFF537F5C),
                        fontFamily: 'Ledger',
                        fontSize: 18), // Text color similar to the image
                    contentPadding: EdgeInsets.symmetric(vertical: 2.0),
                    // Padding to align text centrally
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(25.0), // Rounded corners
                      borderSide: BorderSide(
                        color: Color(
                            0xFF52734D), // Border color similar to the image
                        width: 1.2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color:
                            Color(0xFF537F5C), // Border color for enabled state
                        width: 1.2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
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
              height: 370,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return card();
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              // margin: EdgeInsets.symmetric(horizontal: 50),
              height: 58,
              width: 280,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Color(0xff537F5C)),
                color: Color(0xff537F5C).withOpacity(.34),
                borderRadius: BorderRadius.circular(20),
                /*boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.),
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  )
                ]*/
              ),
              child: SizedBox(
                height: 58,
                width: 350,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      color: const Color(0xff3B5D44),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit,
                        size: 37,
                      ),
                    ),
                    const SizedBox(
                      width: 20, // Closer spacing to the home icon
                    ),
                    // FaIcon(FontAwesomeIcons.pen),
                    IconButton(
                      color: const Color(0xff3B5D44),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.home,
                        size: 37,
                      ),
                    ),
                    const SizedBox(
                      width: 20, // Closer spacing to the person icon
                    ),
                    IconButton(
                      color: const Color(0xff3B5D44),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserProfile()),
                        );
                      },
                      icon: const Icon(
                        Icons.person,
                        size: 37,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
