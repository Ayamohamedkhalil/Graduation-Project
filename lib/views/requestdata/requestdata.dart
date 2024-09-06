import 'package:flutter/material.dart';
import 'package:splash_onboarding_test/components/ButtonBar.dart';
import 'package:splash_onboarding_test/constant/Colors.dart';
import 'package:splash_onboarding_test/views/UserProfile.dart';

class RequestdataPage extends StatelessWidget {
  const RequestdataPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                          "Privacy settings",
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
            //content
            //
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const Padding(
                      padding:  EdgeInsets.only(top: 40, bottom: 40),
                      child:  Text(
                        "You will receive email from our mail to complete your reuest",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      width: 305,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(100, 44),
                          backgroundColor: const Color(0xff537F5C),
                          shadowColor: const Color(0xff537F5C),
                          alignment: Alignment.center,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: const BorderSide(color: Colors.white)),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Start Request',
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                            fontFamily: 'InriaSans-Bold',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //
            // ButtonBar
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
