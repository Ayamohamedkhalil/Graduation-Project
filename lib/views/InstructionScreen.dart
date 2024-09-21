import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:splash_onboarding_test/Registeration/registeration.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});

  final List<PageViewModel> pages = [
    PageViewModel(
      titleWidget: Padding(
        padding: const EdgeInsets.only(top: 160.0),
        child: Text(
          'Welcome to MALAZ',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
            color: Colors.white.withOpacity(.85),
            fontFamily: 'Ledger',
          ),
          textAlign: TextAlign.center,
        ),
      ),

      bodyWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Image.asset(
              'assets/onBoarding.png',
              width: 300,
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          const Text(
            'your personal mental\nwellness companion',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Ledger',
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      //image: Image.asset('assets/Intro1.png'),
      decoration: const PageDecoration(
        pageColor: Color(0xFF537F5C),
        titlePadding: EdgeInsets.all(0),
        contentMargin: EdgeInsets.all(16),
        bodyPadding: EdgeInsets.only(top: 0),
      ),
    ),
     PageViewModel(
      title: '',
      bodyWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         // SizedBox(height: 10),
          // Background image with decoration
          Stack(
            alignment: Alignment.center,
            children: [
              // Decorative background image
              Image.asset(
                'assets/updateintro.png', // Make sure this asset path is correct
                fit: BoxFit.contain,
              ),
              // Centered text
             const Text(
              'Our app is designed\nto help you \nunderstand and\n manage your mental health\nthrough a variety of \ndiagnostic tests',
              style: TextStyle(
                fontFamily: 'Ledger',
                fontSize: 23,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            ],
          ),
        ],
      ),
      decoration: const PageDecoration(
        pageColor: Color(0xFF537F5C), // Matching the background color
      ),
    ),
    
    PageViewModel(
      title: '', // Empty since the design does not include a title
      bodyWidget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // First section - Take a test
            Row(children: [
              Image.asset('assets/introonboarding1.png',
                  height: 120), // Example image
              const SizedBox(
                width: 70,
              ),
              Text(
                'Take\n   a\n test',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withOpacity(.85),
                    fontFamily: 'Ledger'),
              ),
            ]),
            //SizedBox(height: 110), // Space between sections
            Image.asset(
              'assets/Line27.png',
              height: 110,
            ),
            // Second section - Look at the Guidelines
            Row(
              children: [
                // Example image

                Text(
                  '   Look at \n       the\n Guidelines',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white.withOpacity(.85),
                      fontFamily: 'Ledger'),
                ),
                const SizedBox(
                  width: 50,
                ),
                Image.asset('assets/introonboarding2.png', height: 120),
              ],
            ),
            Image.asset(
              'assets/Line 28.png',
              height: 110,
            ),
            //SizedBox(height: 110), // Space between sections

            // Third section - Write what you think
            Row(
              children: [
                Image.asset('assets/introonboarding3.png',
                    height: 120), // Example image
                const SizedBox(
                  width: 50,
                ),
                Text(
                  'Write what\n you think',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white.withOpacity(.85),
                      fontFamily: 'Ledger'),
                ),
              ],
            ),
          ],
        ),
      ),
      decoration: const PageDecoration(
        pageColor:
            Color(0xFF537F5C), // Background color similar to the screenshot
      ),
    ),
    PageViewModel(
      title: '',
      bodyWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          // Background image with decoration
          Stack(
            alignment: Alignment.center,
            children: [
              // Decorative background image
              Image.asset(
                'assets/intro4.png', // Make sure this asset path is correct
                fit: BoxFit.contain,
              ),
              // Centered text
              const Text(
                ' Your\n Journey\n Starts\n  Now',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  // height: 1.4,
                  fontFamily: 'Ledger', // Customize as per your font choice
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
      decoration: const PageDecoration(
        pageColor: Color(0xFF537F5C), // Matching the background color
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF537F5C), // Set the background color of the Scaffold
      body: IntroductionScreen(
        globalBackgroundColor: const Color(0xFF537F5C),
        pages: pages,
        dotsDecorator: const DotsDecorator(
          size: Size(10, 10),
          color: Colors.white,
          activeSize: Size.square(15),
          activeColor: Colors.grey,
        ),
        showDoneButton: true,
        done: const Text(
          'Done',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        showSkipButton: true,
        skip: const Text(
          'Skip',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        showNextButton: false,
        /*next: const Icon(
          Icons.arrow_forward,
          size: 20,
          color: Colors.black,
        ),*/
        onDone: () => onDone(context),
        onSkip: () => onSkip(context),
      ),
    );
  }

  void onDone(context) {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const Registeration()));
  }
}

void onSkip(context) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => const Registeration()));
}
