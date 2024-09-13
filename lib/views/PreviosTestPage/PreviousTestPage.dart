import 'package:flutter/material.dart';
import 'package:splash_onboarding_test/components/ButtonBar.dart';
import 'package:splash_onboarding_test/constant/Colors.dart';

import 'package:splash_onboarding_test/views/PreviosTestPage/component/ResultCard.dart';
import 'package:splash_onboarding_test/views/UserProfile.dart';

class Previoustestpage extends StatelessWidget {
  const Previoustestpage({super.key});

  @override
  Widget build(BuildContext context) {
    // Define a list of test data (diseases, results, and dates)
    final List<Map<String, String>> testData = [
      {
        "testName": "Depression Assessment",
        "testResult": "Depressed",
        "testDate": "01/01/2023",
      },
      {
        "testName": "Anxiety Test",
        "testResult": "Moderate Anxiety",
        "testDate": "05/02/2023",
      },
      {
        "testName": "Bipolar Disorder Test",
        "testResult": "Bipolar Disorder",
        "testDate": "12/03/2023",
      },
      {
        "testName": "Stress Level Test",
        "testResult": "High Stress",
        "testDate": "20/03/2023",
      },
      {
        "testName": "PTSD Assessment",
        "testResult": "PTSD Detected",
        "testDate": "18/04/2023",
      },
      {
        "testName": "ADHD Test",
        "testResult": "Possible ADHD",
        "testDate": "22/05/2023",
      },
    ];

    return Scaffold(
      body: Container(
        color: PriamryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //
            // Appbar
            //
            Row(
              children: [
                const SizedBox(
                  height: 90,
                ),
                Stack(children: [
                  Positioned(
                    top: 2,
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
                          "Tests history",
                          style: TextStyle(
                              fontFamily: "InriaSans",
                              fontSize: 26,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  )
                ]),
              ],
            ),
            //
            // Result content
            //
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  // boxShadow: ,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 1,
                    color: Colors.white,
                  ),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.10),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Scrollbar(
                  thumbVisibility: true,
                  interactive: true,
                  thickness: 6,
                  radius: const Radius.circular(40),
                  child:
                    
                      ListView.builder(
                        primary: true,
                        padding: EdgeInsets.zero,
                        itemCount:
                            testData.length, // Use the length of the test data list
                        itemBuilder: (context, index) {
                          // Get data for the current test
                          final test = testData[index];
                          return ResultCard(
                            testName: test["testName"]!,
                            testResult: test["testResult"]!,
                            testDate: test["testDate"]!,
                          );
                         
                        },
                        
                      ),
                      
                    
                  ),
                ),
              ),
           
            //
            // ButtonBar
            //
            const BarButton(),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
