import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:splash_onboarding_test/components/ButtonBar.dart';
import 'package:splash_onboarding_test/constant/Colors.dart';
import 'package:splash_onboarding_test/views/UserProfile.dart';

class PrivacySettingPage extends StatelessWidget {
  const PrivacySettingPage({super.key});

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
            //Content
            //
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        "Your privacy is our top priority. This section allows you to manage how your data is collected, stored, and used within the app",
                        style: TextStyle(
                            fontFamily: "InriaSans-Light",
                            fontSize: 21,
                            letterSpacing: 0,
                            color: Colors.white,
                            height: 1.1),
                      ),
                    ),
                    const Divider(
                      color: Color.fromARGB(83, 255, 255, 255),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //
                    //three Button
                    //
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 12),
                              decoration: BoxDecoration(
                                  color: ThirdColor,
                                  borderRadius: BorderRadius.circular(17),
                                  border: Border.all(color: BackgroundColor)),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Login Activity",
                                    style: TextStyle(
                                        fontFamily: "InriaSans-Bold",
                                        fontSize: 20,
                                        color: Colors.white),
                                  ),
                                  Icon(
                                    FontAwesomeIcons.play,
                                    size: 18,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 18),
                              decoration: BoxDecoration(
                                  color: ThirdColor,
                                  borderRadius: BorderRadius.circular(17),
                                  border: Border.all(color: BackgroundColor)),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "delete your data",
                                        softWrap: true,
                                        style: TextStyle(
                                            fontFamily: "InriaSans-Bold",
                                            fontSize: 20,
                                            color: Colors.white),
                                      ),
                                      Icon(
                                        FontAwesomeIcons.play,
                                        size: 18,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                  Text(
                                    "This action will remove all your data.",
                                    softWrap: true,
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 18),
                              decoration: BoxDecoration(
                                  color: ThirdColor,
                                  borderRadius: BorderRadius.circular(17),
                                  border: Border.all(color: BackgroundColor)),
                              child: const Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Request your data",
                                        style: TextStyle(
                                            fontFamily: "InriaSans-Bold",
                                            fontSize: 20,
                                            color: Colors.white),
                                      ),
                                      Icon(
                                        FontAwesomeIcons.play,
                                        size: 18,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                  Text(
                                    "Request a copy of your data Malaz collects about you",
                                    softWrap: true,
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
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
