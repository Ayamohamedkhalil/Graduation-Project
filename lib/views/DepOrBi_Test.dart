import 'package:flutter/material.dart';
import 'package:splash_onboarding_test/home.dart';
import 'package:splash_onboarding_test/views/DepressionOrBipolarTest/DepOrBi.dart';

class DeporbiTest extends StatelessWidget {
  const DeporbiTest({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the height and width of the screen
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.80),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: screenHeight * 0.87, // 75% of screen height
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/image1.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: screenHeight * 0.1), // 10% of screen height for vertical margin
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.04, vertical: screenHeight * 0.02), // Adjusting padding
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.30),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SizedBox(
                    height: screenHeight * 0.65, // 60% of screen height
                    width: screenWidth * 0.7,  // 70% of screen width
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: screenHeight * 0.05, // 5% of screen height
                        ),
                         Text(
                          "Depression\nOr\nBipolar",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                           fontSize: screenWidth * 0.07,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'InriaSans',
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.05, // 5% of screen height
                        ),
                       Text(
                          "The Test contains around 10\n"
                          "essential symptoms psychiatrists\n"
                          "use to diagnose the described\n"
                          "disorders.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                           fontSize: screenWidth * 0.06,
                            fontFamily: 'InriaSans',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Custom back button
              Positioned(
                top: screenHeight * 0.03, // 4% of screen height for vertical position
                left: screenWidth * 0.05, // 5% of screen width for horizontal position
                child: Container(
                  width: screenWidth * 0.09, // 9% of screen width
                  height: screenWidth * 0.09, // 9% of screen width (making it circular)
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.80), // Background color
                    shape: BoxShape.circle, // Circular shape
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15), // Shadow color
                        spreadRadius: 2, // How much the shadow should spread
                        blurRadius: 5, // The blur radius of the shadow
                        offset: const Offset(0, 2), // Offset the shadow vertically
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    color: const Color(0xFF537F5C), // Set the color of the arrow icon
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const homescreen(), // Replace with the appropriate screen
                      ));
                    },
                    iconSize: screenWidth * 0.07, // Adjust the size of the icon
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.005,
                      horizontal: screenWidth * 0.02,
                    ), // Adjust padding around the icon
                    splashRadius: screenWidth * 0.08, // Adjust the splash radius on click
                    tooltip: "Next",
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: screenHeight * 0.01, // 2% of screen height for spacing
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Deporbi(),
                ),
              );
            },
            child: Text(
              "Let's get started >",
              style: TextStyle(
                color: const Color(0xff537F5C),
                fontSize: screenWidth * 0.08, // 8% of screen width for text size
                fontFamily: 'InriaSans',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
