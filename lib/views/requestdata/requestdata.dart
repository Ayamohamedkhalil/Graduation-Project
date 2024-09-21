import 'package:flutter/material.dart';
import 'package:splash_onboarding_test/components/ButtonBar.dart';
import 'package:splash_onboarding_test/constant/Colors.dart';
import 'package:splash_onboarding_test/views/PrivacySettingPage/PrivacySettingPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; 
import 'package:splash_onboarding_test/Registeration/auth_service.dart'; 

class RequestdataPage extends StatelessWidget {
  const RequestdataPage({super.key});

  Future<void> _startRequest(BuildContext context) async {
    final String? token = await getToken();
    if (token != null) {
      final response = await http.post(
        Uri.parse('https://backend-production-19d7.up.railway.app/api/request-data'),
        headers: {
          'Authorization': token,
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        _showAnswerAlert(context, responseData['message']);
      } else {
        // Handle error response
        _showAnswerAlert(context, 'Failed to send request. Please try again.');
      }
    } else {
      // Handle no token case
      _showAnswerAlert(context, 'No token found. Please log in again.');
    }
  }

void _showAnswerAlert(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: const Color(0xff537F5C).withOpacity(.88),
        content: SizedBox(
          height: 268, // Keep the height
          width: 280, // Keep the width
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12), 
              const Text(
                "Request Status",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 6), 
              Image.asset(
                'assets/mail-sent-successfully-with-checklist-cartoon-icon-illustration-business-object-icon-concept-isolated-premium-vector-removebg-preview.png', // Replace with your image path
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 8), 
              Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'InriaSans-Regular',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 14), // Adjusted spacing before button
              SizedBox(
                height: 40,
                width: 80,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.white, width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: const Text(
                    "OK",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'InriaSans-Regular',
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


  Future<String?> getToken() async {
    final String? token = await AuthService.getToken();
    if (token == null) {
      print('No token found');
    } else {
      print('Retrieved Token: $token');
    }
    return token;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: PriamryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(height: 100),
                Stack(children: [
                  Positioned(
                    left: 20,
                    top: 5,
                    child: Container(
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
                        icon: const Icon(Icons.arrow_back_ios),
                        color: const Color(0xFF537F5C),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const PrivacySettingPage(),
                            ),
                          );
                        },
                        iconSize: 25.0,
                        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 9),
                        splashRadius: 25.0,
                        tooltip: "Next",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Request your data",
                          style: TextStyle(
                              fontFamily: "InriaSans-Bold",
                              fontSize: 28,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  )
                ]),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 40),
                      child: Text(
                        "You will receive an email from our mail to complete your request",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      width: 270,
                      height: 44,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.10),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: const Offset(0, 4),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(100, 44),
                          backgroundColor: const Color(0xff537F5C),
                          shadowColor: const Color(0xff537F5C),
                          alignment: Alignment.center,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(color: Colors.white),
                          ),
                        ),
                        onPressed: () => _startRequest(context), // Call the request function
                        child: const Text(
                          'Start request',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontFamily: 'InriaSans-Bold',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const BarButton(),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
