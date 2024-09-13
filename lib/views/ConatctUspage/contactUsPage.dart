import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:splash_onboarding_test/constant/Colors.dart';
import 'package:splash_onboarding_test/views/UserProfile.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: PriamryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //
            // Appbar
            //
            Row(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Stack(children: [
                  Positioned(
                    left: 20,
                    top: 3,
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
                          "Contact us",
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "We’re here to help!",
                    style: TextStyle(
                        fontFamily: "InriaSans",
                        color: Colors.white,
                        fontSize: 27,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "If you have any questions, feedback, or need support, feel free to reach out to us. Our team is always ready to assist you",
                    style: TextStyle(
                        fontFamily: "InriaSans-Light",
                        fontSize: 18,
                        color: Colors.white,
                        height: 1.1),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text("contact us through these channels:",
                      style: TextStyle(color: Colors.white, fontSize: 20,fontFamily: 'InriaSans')),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 194, 193, 193),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.solidEnvelope,
                                color: Color(0xff374151),
                                size: 18,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "aya823623@gmail.com",
                                style: TextStyle(
                                    fontFamily: "Inter",
                                    fontSize: 14,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3.0),
                          child: Divider(
                            height: 1,
                            color: PriamryColor,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: const Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.phone,
                                color: Color(0xff374151),
                                size: 18,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "+20 1026537894",
                                style: TextStyle(
                                    fontFamily: "Inter",
                                    fontSize: 14,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
