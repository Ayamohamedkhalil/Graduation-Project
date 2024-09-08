import 'package:flutter/material.dart';
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
          Stack(
            children: [
              Container(
                height: 710,
                width: double.infinity,
                decoration: BoxDecoration(
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
                  margin: EdgeInsets.symmetric(vertical: 80),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.30),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SizedBox(
                    height: 500,
                    width: 270,
                    child: Column(
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
                        offset: Offset(0, 2), // Offset the shadow vertically
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    color: Color(0xFF537F5C), // Set the color of the arrow icon
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            homescreen(), // Replace with the appropriate screen
                      ));
                    },
                    iconSize: 25.0, // Adjust the size of the icon
                    padding: EdgeInsets.symmetric(
                        vertical: 3,
                        horizontal: 9), // Adjust padding around the icon
                    splashRadius: 25.0, // Adjust the splash radius on click
                    tooltip: "Next",
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 13,
          ),
          TextButton(
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
        ],
      ),
    );
  }
}
