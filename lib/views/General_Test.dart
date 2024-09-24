import 'package:flutter/material.dart';
import 'package:splash_onboarding_test/home.dart';
import 'package:splash_onboarding_test/views/generaltest.dart';

class General_test extends StatelessWidget {
  const General_test({super.key});

  @override
  Widget build(BuildContext context) {
    // Getting screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.80),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: screenHeight * 0.87, // 70% of screen height
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/lastupdateofgeneraltest.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: screenHeight * 0.1),
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.04, vertical: screenHeight * 0.02),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.30),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SizedBox(
                    height: screenHeight * 0.65, // 60% of screen height
                    width: screenWidth * 0.7, // 70% of screen width
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: screenHeight * 0.05, // 5% of screen height
                        ),
                        Text(
                          "General Test",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.07, // 7% of screen width
                            fontWeight: FontWeight.w500,
                            fontFamily: 'InriaSans',
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.05, // 5% of screen height
                        ),
                        Text(
                          "This test includes various symptoms for a\n"
                          "range of mental disorders, such as ADHD, OCD, PTSD, and more\n"
                          "we know, identifying these disorders is crucial\n"
                          "for improving the quality of life for many individuals.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.06, // 5% of screen width
                            fontFamily: 'InriaSans',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: screenHeight * 0.03, // 3% from top
                left: screenWidth * 0.05, // 5% from left
                child: Container(
                  width: screenWidth * 0.09, // 10% of screen width
                  height: screenWidth * 0.09, // 10% of screen width
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.80),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    color: const Color(0xFF537F5C),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const homescreen(),
                      ));
                    },
                    iconSize: screenWidth * 0.07, // 7% of screen width
                    padding:  EdgeInsets.symmetric(
                        vertical: screenHeight * 0.005,
                      horizontal: screenWidth * 0.02,),
                    splashRadius: screenWidth * 0.08, // Adjust splash radius
                    tooltip: "Next",
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: screenHeight * 0.01, // 2% of screen height
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Generaltest(),
                ),
              );
            },
            child: Text(
              "Let's get started >",
              style: TextStyle(
                color: const Color(0xff537F5C),
                fontSize: screenWidth * 0.08, // 8% of screen width
                fontFamily: 'InriaSans',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
