import 'package:flutter/material.dart';
import 'package:splash_onboarding_test/Registeration/login.dart';
import 'package:splash_onboarding_test/Registeration/sign-up.dart';
import 'package:splash_onboarding_test/constant/Colors.dart';
import 'package:splash_onboarding_test/home.dart';
import 'package:splash_onboarding_test/views/UserProfile.dart';

import 'package:splash_onboarding_test/Registeration/auth_service.dart';
import 'package:splash_onboarding_test/views/journalPages/journalPage.dart';

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
        return Dialog(
          backgroundColor: const Color(0xff537F5C).withOpacity(.88),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            width: 300, // Set width of the dialog
            height: 500, // Set height of the dialog
            padding: const EdgeInsets.all(20),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/oops.png'),
                    const SizedBox(height: 10,),
                    const Text(
                      'Oops!!!',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Martel-Black'),
                    ),
                    const SizedBox(height: 20,),
                    const Text(
                      "It looks like you're not signed in.\n please",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontFamily: 'Ledger',
                       fontWeight: FontWeight.w500,
                      ),
                    ),
                   
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Handle login action
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const Login(),
                              ),
                            ); // Close the dialog
                          },
                          child: const Text(
                            'log-in',
                            style: TextStyle(
                              color: Color(0xff1F355A),
                              fontSize: 24,
                              decoration: TextDecoration.underline,
                               decorationColor:Color(0xff1F355A) , 
                               fontFamily: 'Ledger',
                               fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const Text(
                          ' or ',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                             fontFamily: 'Ledger',
                             fontWeight: FontWeight.w500,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Handle sign-up action
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const Signup(),
                              ),
                            ); // Cl // Close the dialog
                          },
                          child: const Text(
                            'sign-up',
                            style: TextStyle(
                              color: Color(0xff1F355A),
                              fontSize: 24,
                              decoration: TextDecoration.underline,
                               decorationColor:Color(0xff1F355A) , 
                               fontFamily: 'Ledger',
                               fontWeight: FontWeight.w500,
                              
                            ),
                          ),
                        ),
                      ],
                    ),
                     const Text(
                          ' to continue ',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                             fontFamily: 'Ledger',
                            // fontWeight: FontWeight.bold,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                  ],
                ),
                Positioned(
                  top: 2,
                  right: 2,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: Container(
          // margin: EdgeInsets.only(left: 5),
            width: 35.0,
            height: 35.0,
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
              icon: const Icon(Icons.close_rounded),
              color: const Color(0xFF537F5C),
              onPressed: () {
                Navigator.of(context).pop();
              },
              iconSize: 30.0,
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal:3),
              splashRadius: 25.0,
              
            ),
          ),
                  ),
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
                  width: MediaQuery.of(context).size.width *
                      ratioOfStartAndEndPadding,
                ),
                Expanded(
                  child: IconButton(
                    color: isGuest ? const Color(0xff3B5D44) : iconColor,
                    onPressed: () {
                      _handleButtonPress(context, () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const JournalPage()),
                        );
                      });
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
                   Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const homescreen()), // Assuming Home is the correct route.
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
                      _handleButtonPress(context, () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UserProfile()),
                        );
                      });
                    },
                    icon: Icon(
                      Icons.person,
                      size: iconSize,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width *
                      ratioOfStartAndEndPadding,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
