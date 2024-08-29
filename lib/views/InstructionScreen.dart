import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:splash_onboarding_test/Registeration/registeration.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});

  final List<PageViewModel> pages = [
    PageViewModel(
      titleWidget: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: Text(
          'Welcome to MALAZ',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'InriaSans',
          ),
          textAlign: TextAlign.center,
        ),
      ),
      bodyWidget: Padding(
        padding: const EdgeInsets.only(top: 400),
        child: Text(
          'your personal mental\nwellness companion',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'InriaSans',
          ),
          textAlign: TextAlign.center,
        ),
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
      body: ' Our app is designed\n to help you \nunderstand and\n manage your mental health\n through a variety of \ndiagnostic tests',
     
      decoration: const PageDecoration(
        bodyTextStyle: TextStyle(
          fontFamily: 'InriaSans',
          fontSize: 30,
          color: Colors.white,
          

        ),
        bodyPadding: EdgeInsets.only(top: 170),
        pageColor: Color(0xFF537F5C), // Matching the background color
      ),
    ),
    PageViewModel(
      title: '',
      body: '',
     /* footer: ElevatedButton(
        onPressed: () {},
        child: const Text("Let is Go"),
      ),*/
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        pageColor: Color(0xFF537F5C), // Matching the background color
      ),
    ),
    PageViewModel(
      title: '',
      body: '',
      /*footer: ElevatedButton(
        onPressed: () {},
        child: const Text("Let is Go"),
      ),*/
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        pageColor: Color(0xFF537F5C), // Matching the background color
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Color(0xFF537F5C), // Set the background color of the Scaffold
      body: IntroductionScreen(
        globalBackgroundColor: Color(0xFF537F5C),
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
        onSkip: ()=>onSkip(context),
      ),
    );
  }

  void onDone(context) {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const Registeration()));
  }
}
void onSkip(context) {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const Registeration()));
  }

