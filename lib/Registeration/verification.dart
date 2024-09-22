import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:splash_onboarding_test/Registeration/forgetpassword.dart';
import 'package:splash_onboarding_test/Registeration/newPassword.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  _VerifyEmailScreenState createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  String verificationCode = "";

  void verifyCode() async {
    // API call to verify the code
    try {
      var response = await http.post(
        Uri.parse(
            'https://backend-production-19d7.up.railway.app/api/resetPasswordInternal'),
        headers: {
          'Content-Type': 'application/json',
         'Cookie': 'session=eyJlbWFpbCI6ImF5YWs3ODExOEBnbWFpbC5jb20ifQ.ZusXlQ.M91jNiCyvnr8Klr_02gQzHcJte0',

        },
        body: jsonEncode({
          'verification_code': verificationCode, // Send the entered code
        }),
      );
      print(verificationCode);
      print(verificationCode.runtimeType == String);
      var responseBody = jsonDecode(response.body);
      print(responseBody);

      // Add this to see the full response from the backend
      if (response.statusCode == 200 &&
          responseBody['message'] ==
              'Verification successful, proceed to reset password.') {
        // Navigate to the NewPassword screen on success
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Newpassword()),
        );
      } else {
        // Show an error message if verification fails
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Invalid verification code. Please try again.')),
        );
      }
    } catch (e) {
      // Handle errors (like network issues)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF537F5C),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Container(
          width: 35.0,
          height: 35.0,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.80),
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
          margin: const EdgeInsets.only(left: 22),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: const Color(0xFF537F5C),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Forgetpassword()),
              );
            },
            iconSize: 25.0,
            splashRadius: 25.0,
            tooltip: "Back",
          ),
        ),
        title: const Text(
          'Verify your email',
          style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter'),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Image.asset(
                'assets/verification.png',
                height: 250,
                width: 250,
              ),
              const SizedBox(height: 40),
              const Text(
                'Please enter the 4-digit code we sent to your email',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Inter',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: PinCodeTextField(
                  appContext: context,
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(20),
                    fieldHeight: 60,
                    fieldWidth: 60,
                    activeFillColor: Colors.white54,
                    inactiveFillColor: Colors.white30,
                    selectedFillColor: Colors.white,
                    activeColor: Colors.transparent,
                    inactiveColor: Colors.transparent,
                    selectedColor: Colors.transparent,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: const Color(0xFF537F5C),
                  enableActiveFill: true,
                  onCompleted: (v) {
                    setState(() {
                      verificationCode = v;
                    });

                    print(
                        "Entered Verification Code: $verificationCode"); // Debugging step

                    // Check if entered code matches your hardcoded code
                  },
                  onChanged: (value) {
                    // Handle changes if necessary
                  },
                  beforeTextPaste: (text) {
                    return true;
                  },
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // Add resend code logic here
                },
                child: const Text(
                  'Resend code',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white70,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Container(
                width: 270,
                height: 44,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
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
                      verifyCode(); // Call the verification function
                    },
                    child: const Text(
                      'Verify',
                      style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontFamily: 'InriaSans-Bold'),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
