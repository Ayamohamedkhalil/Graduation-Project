import 'package:flutter/material.dart';
import 'package:splash_onboarding_test/Registeration/registeration.dart';
import 'package:splash_onboarding_test/components/ButtonBar.dart';
import 'package:splash_onboarding_test/constant/Colors.dart';
import 'package:splash_onboarding_test/views/PrivacySettingPage/PrivacySettingPage.dart';

class DeleteDataPage extends StatelessWidget {
  const DeleteDataPage({super.key});

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
                  height: 100,
                ),
                Stack(children: [
                  Positioned(
                    left: 20,
                    top: 5,
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
                            builder: (context) => const PrivacySettingPage(),
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
                          "delete your data",
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
                      padding: EdgeInsets.only(top: 40, bottom: 40),
                      child: Text(
                        "Are you sure you want to delete your data? This action will remove all your previous test results,you’ve stored in the app. Once deleted, this data cannot be recovered. If you’re certain, please confirm your decision by clicking 'Delete Data.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      width: 270,
                      height: 44,
                      decoration: BoxDecoration(
                        // border: Border.all(width: 1, color: Colors.white),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.25),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(100, 44),
                          backgroundColor:
                              const Color.fromARGB(220, 167, 28, 28),
                          alignment: Alignment.center,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => Registeration(),
                            ),
                          );
                        },
                        child: const Text(
                          'Delete Data',
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
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
