import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splash_onboarding_test/home.dart';
import 'package:splash_onboarding_test/views/deporbitest.dart';
// Assuming the Specifictest screen is in this path

class DeporbiTest extends StatelessWidget {
  const DeporbiTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.80),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.88,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40.r),
                      bottomRight: Radius.circular(40.r),
                    ),
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/image1.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.30),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.7,
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 35,
                            ),
                            Text(
                              "Depression\nOr\nBipolar",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'InriaSans'),
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            Text(
                              "The Test contains around 10\n"
                              "essential symptoms psychiatrists\n"
                              "use to diagnose the described\n"
                              "disorders .",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontFamily: 'InriaSans'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // Replacing the current back icon with a custom Container with IconButton
                Positioned(
                  top: 27,
                  left: 20,
                  child: Container(
                    width: 35.0, // Adjust the width of the circle
                    height: 35.0, // Adjust the height of the circle
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.80), // Background color
                      shape: BoxShape.circle, // Circular shape
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15), // Shadow color
                          spreadRadius: 2, // How much the shadow should spread
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
                          builder: (context) =>
                              const homescreen(), // Replace with the appropriate screen
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
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.12,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Specifictest(),
                  ),
                );
              },
              child: Text(
                "Let's get started >",
                style: TextStyle(
                    color: Color(0xff537F5C),
                    fontSize: 32,
                    fontFamily: 'InriaSans'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
