import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:splash_onboarding_test/components/ButtonBar.dart';
import 'package:splash_onboarding_test/constant/Colors.dart';
import 'package:splash_onboarding_test/home.dart';
import 'package:splash_onboarding_test/views/PreviosTestPage/component/ResultCard.dart';
import 'package:splash_onboarding_test/views/UserProfile.dart';

class Previoustestpage extends StatelessWidget {
  const Previoustestpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: PriamryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //
            //Appbar
            //
            Row(
              children: [
                const SizedBox(
                  height: 80,
                ),
                Stack(children: [
                  Positioned(
                    left: 20,
                    child: Container(
                      width: 35.0, // Adjust the width of the circle
                      height: 35.0, // Adjust the height of the circle
                      decoration: BoxDecoration(
                        color: Colors.white
                            .withOpacity(.80), // Background color (light green)
                        shape: BoxShape.circle, // Circular shape
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.black.withOpacity(0.15), // Shadow color
                            spreadRadius:
                                2, // How much the shadow should spread
                            blurRadius: 5, // The blur radius of the shadow
                            offset: const Offset(
                                0, 2), // Offset the shadow vertically
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        color: const Color(
                            0xFF537F5C), // Set the color of the arrow icon
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const UserProfile(),
                          ));
                        },
                        iconSize: 25.0, // Adjust the size of the icon
                        padding: const EdgeInsets.symmetric(
                            vertical: 3,
                            horizontal: 9), // Adjust padding around the icon
                        splashRadius: 25.0, // Adjust the splash radius on click
                        tooltip: "Next",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Tests History",
                          style: TextStyle(
                              fontFamily: "InriaSans-Bold",
                              fontSize: 28,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  )
                ]),
              ],
            ),
            //
            //result content
            //
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 2,
                    color: const Color.fromARGB(109, 255, 255, 255),
                  ),
                ),
                child: Scrollbar(
                  thumbVisibility: true,
                  interactive: true,
                  thickness: 6,
                  radius: const Radius.circular(40),
                  child: ListView.builder(
                    primary: true,
                    padding: EdgeInsets.zero,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const ResultCard(
                        testName: "Depression Assessment",
                        testResult: "Depressed",
                        testDate: "01/01/2023",
                      );
                    },
                  ),
                ),
              ),
            ),
            //
            //ButtonBar
            //
            const BarButton(),
            const SizedBox(
              height: 5,
            )
          ],
        ),
      ),
    );
  }
}
