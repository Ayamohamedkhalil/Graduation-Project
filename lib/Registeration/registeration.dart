import 'package:flutter/material.dart';
import 'package:splash_onboarding_test/home.dart';
import 'package:splash_onboarding_test/Registeration/login.dart';
import 'package:splash_onboarding_test/Registeration/sign-up.dart';
import 'auth_service.dart'; // Import the AuthService

class Registeration extends StatelessWidget {
  const Registeration({super.key});

  void _continueAsGuest(BuildContext context) async {
    await AuthService.saveLoginInfo("", "", "", isGuest: true);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const homescreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset('assets/Rectangle 32.png'),
              Padding(
                padding: const EdgeInsets.all(60),
                child: Image.asset(
                  'assets/registeration.png',
                  height: 250,
                  width: 300,
                ),
              ),
              Positioned(
                top: 273, // Adjust the position of the text as needed
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    'MALAZ',
                    style: TextStyle(
                      fontFamily: 'Ledger',
                      fontSize: 30, // Adjust the font size as needed
                      fontWeight:
                          FontWeight.w500, // Make the text bold if needed
                      color:
                          Colors.white.withOpacity(.80), // Use a contrasting color to the image
                      letterSpacing:
                          4, // Adjust letter spacing to match the design
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          Container(
            width: 270,
            height: 44,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.25),
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  )
                ]),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  alignment: Alignment.center,
                  backgroundColor: const Color(0xff537F5C),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                },
                child: const Text(
                  'Log in',
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontFamily: 'InriaSans-Bold'),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 270,
            height: 44,
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: const Color(0xff537F5C)),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.25),
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  )
                ]),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  alignment: Alignment.center,
                  shadowColor: const Color(0xff537F5C),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Signup()),
                  );
                },
                child: const Text(
                  'Sign-up',
                  style: TextStyle(
                      fontSize: 24,
                      color: Color(0xff537F5C),
                      fontFamily: 'InriaSans-Bold'),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          const Row(
            children: [
              Expanded(
                child: Divider(
                  color: Colors.black,
                  thickness: 1,
                  indent: 30,
                  endIndent: 10,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'OR',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Divider(
                  color: Colors.black,
                  thickness: 1,
                  indent: 10,
                  endIndent: 30,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          Container(
            width: 270,
            height: 44,
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: const Color(0xff537F5C)),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.25),
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  )
                ]),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  alignment: Alignment.center,
                  backgroundColor: Colors.white,
                  shadowColor: const Color(0xff537F5C),
                ),
                onPressed: () {
                  _continueAsGuest(context);
                },
                child: const Text(
                  'Continue as a guest',
                  style: TextStyle(
                      fontSize: 24,
                      color: Color(0xff537F5C),
                      fontFamily: 'InriaSans-Bold'),
                )),
          ),
        ],
      ),
    );
  }
}