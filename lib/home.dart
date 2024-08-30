import 'dart:math';

import 'package:flutter/material.dart';
import 'package:splash_onboarding_test/components/card.dart';
import 'package:splash_onboarding_test/views/UserProfile.dart';

class homescreen extends StatelessWidget {
  const homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        //to remove icon from appbar
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
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
                Padding(
                  padding: const EdgeInsets.only(left: 170),
                  child: Image.asset('assets/contact.png'),
                )
              ],
            ),
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
                        Text(
                          '  "Getting help is a ',
                          style: TextStyle(fontSize: 27, color: Colors.white),
                        ),
                        Text(
                          ' sign of wisdom,',
                          style: TextStyle(fontSize: 27, color: Colors.white),
                        ),
                        Text(
                          ' not weakness."',
                          style: TextStyle(fontSize: 27, color: Colors.white),
                        )
                      ]),
                  Image.asset(
                    'assets/logo.png',
                    height: 160,
                    width: 130,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: Container(
                //margin: EdgeInsets.only(top: 10),
                height: 40,
                width: 450,
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
                        fontFamily: 'Ledger-Regular',
                        fontSize: 18), // Text color similar to the image
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                    // Padding to align text centrally
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(20.0), // Rounded corners
                      borderSide: BorderSide(
                        color: Color(
                            0xFF52734D), // Border color similar to the image
                        width: 1.4,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(
                        color:
                            Color(0xFF537F5C), // Border color for enabled state
                        width: 1.4,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(
                        color:
                            Color(0xFF537F5C), // Border color for focused state
                        width: 1.4,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 350,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return card();
                },
              ),
            ),
            SizedBox(
              height: 13,
            ),
            Container(
              height: 58,
              width: 350,
              decoration: BoxDecoration(
                  color: Color(0xff537F5C).withOpacity(.34),
                  borderRadius: BorderRadius.circular(16)),
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
                        size: 35,
                      ),
                    ),
                    const SizedBox(
                      width: 35,
                    ),
                    IconButton(
                      color: const Color(0xff3B5D44),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.home,
                        size: 35,
                      ),
                    ),
                    const SizedBox(
                      width: 35,
                    ),
                    IconButton(
                      color: const Color(0xff3B5D44),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserProfile()));
                      },
                      icon: const Icon(
                        Icons.person,
                        size: 35,
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
