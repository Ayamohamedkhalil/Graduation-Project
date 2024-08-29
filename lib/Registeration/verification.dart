import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:splash_onboarding_test/Registeration/newPassword.dart';

class VerifyEmailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF537F5C),
      appBar: AppBar(
        backgroundColor: const Color(0xFF537F5C),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text(
          'Verify your email',
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
            fontFamily: 'Inter',
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              Image.asset(
                'assets/verification.png', // Replace with your image path
                height: 200,
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
              const SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child: PinCodeTextField(
                  appContext: context,
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10),
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
                    // Add verification logic here
                  },
                  onChanged: (value) {
                    // Handle changes
                  },
                  beforeTextPaste: (text) {
                    return true;
                  },
                ),
              ),
              const SizedBox(height: 20),
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
              const SizedBox(height: 50),
              Container(
                width: 305,
                height: 44,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.25),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      )
                    ]),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      alignment: Alignment.center,
                      backgroundColor: Color(0xff537F5C),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Newpassword()),
                      );
                    },
                    child: Text(
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
