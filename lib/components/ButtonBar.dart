import 'package:flutter/material.dart';
import 'package:splash_onboarding_test/constant/Colors.dart';
import 'package:splash_onboarding_test/home.dart';
import 'package:splash_onboarding_test/views/UserProfile.dart';
import 'package:splash_onboarding_test/Registeration/login.dart';
import 'package:splash_onboarding_test/Registeration/sign-up.dart';
import 'package:splash_onboarding_test/Registeration/auth_service.dart';

class BarButton extends StatelessWidget {
  const BarButton({
    super.key,
    this.height = 58,
    this.ratioOfContainerWidth = 0.7,
    this.ratioOfStartAndEndPadding = 0.1,
    this.iconSize = 37,
    this.backGroundColor = const Color(0xffC4D3C7),
    this.iconColor = const Color(0xff3B5D44),
  });

  final double height;
  final double ratioOfContainerWidth;
  final double ratioOfStartAndEndPadding;
  final double iconSize;
  final Color backGroundColor;
  final Color iconColor;

  Future<bool> _isGuest() async {
    return (await AuthService.isGuest()) ?? false;
  }

  void _handleButtonPress(BuildContext context, VoidCallback onAction) async {
    final isGuest = await _isGuest();
    if (isGuest) {
      _showLoginAlert(context);
    } else {
      onAction();
    }
  }

 void _showLoginAlert(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: const Color(0xff537F5C).withOpacity(.88),
        content: SizedBox(
          height: 350,
          width: 320,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(Icons.close, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                ),
              ),
              Image.asset('assets/Answerreqiured.png', width: 140, height: 100),
              const SizedBox(height: 20),
              const Text(
                "Oops!!!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                "It looks like you’re not signed in. Please log-in or sign-up to continue.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'InriaSans-Regular',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                    child: Text(
                      "Log In",
                      style: TextStyle(
                        color: const Color(0xff003366), // Dark blue color
                        fontSize: 16,
                        fontFamily: 'InriaSans-Regular',
                      ),
                    ),
                  ),
                  const SizedBox(width: 10), // Add space between buttons
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Signup()),
                      );
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: const Color(0xff003366), // Dark blue color
                        fontSize: 16,
                        fontFamily: 'InriaSans-Regular',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _isGuest(),
      builder: (context, snapshot) {
        final isGuest = snapshot.data ?? false;

        return Container(
          height: height,
          width: MediaQuery.of(context).size.width * ratioOfContainerWidth,
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: ThirdColor),
            color: backGroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: SizedBox(
            height: height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * ratioOfStartAndEndPadding,
                ),
                Expanded(
                  child: IconButton(
                    color: isGuest ? const Color(0xff3B5D44) : iconColor,
                    onPressed: () {
                      if (isGuest) {
                        _showLoginAlert(context);
                      } else {
                        // Handle edit button press
                      }
                    },
                    icon: Icon(
                      Icons.edit,
                      size: iconSize,
                    ),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    color: const Color(0xff3B5D44),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const homescreen()),
                      );
                    },
                    icon: Icon(
                      Icons.home,
                      size: iconSize,
                    ),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    color: const Color(0xff3B5D44),
                    onPressed: () {
                      if (isGuest) {
                        _showLoginAlert(context);
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UserProfile()),
                        );
                      }
                    },
                    icon: Icon(
                      Icons.person,
                      size: iconSize,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * ratioOfStartAndEndPadding,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}