import 'package:flutter/material.dart';
import 'package:splash_onboarding_test/views/PrivacySettingPage/PrivacySettingPage.dart';

class Requestdata extends StatelessWidget {
  const Requestdata({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff537F5C),
      appBar: AppBar(
        backgroundColor: Color(0xff537F5C),
        title: Text(
          'Request Your Data',
          style: TextStyle(color: Colors.white,fontFamily: 'InriaSans-Bold', fontSize: 20), // Adjusted font size for better visibility
        ),
        automaticallyImplyLeading: false, // Prevent automatic back button
        leading: Container(
          margin: EdgeInsets.symmetric(horizontal: 10), // Small margin to align the back button better
          width: 35.0, // Adjust the width of the circle
          height: 35.0, // Adjust the height of the circle
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.80), // Background color (light green)
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
                builder: (context) => PrivacySettingPage(),
              ));
            },
            iconSize: 25.0, // Adjust the size of the icon
            padding: EdgeInsets.symmetric(vertical: 3, horizontal: 9), // Adjust padding around the icon
            splashRadius: 25.0, // Adjust the splash radius on click
            tooltip: "Back",
          ),
        ),
      ),
    );
  }
}
