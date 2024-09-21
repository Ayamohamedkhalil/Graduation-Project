import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:splash_onboarding_test/components/ButtonBar.dart';
import 'package:splash_onboarding_test/constant/Colors.dart';
import 'package:splash_onboarding_test/views/LoginActivityPage/component/PreviosLogInCard.dart';
import 'package:splash_onboarding_test/views/PrivacySettingPage/PrivacySettingPage.dart';
import 'package:splash_onboarding_test/Registeration/auth_service.dart'; 

class Loginactivitypage extends StatefulWidget {
  const Loginactivitypage({super.key});

  @override
  State<Loginactivitypage> createState() => _LoginactivitypageState();
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

class _LoginactivitypageState extends State<Loginactivitypage> {
  // Update the type to allow dynamic values
  List<Map<String, dynamic>> loginActivity = [];

  // Function to fetch login activity data
  Future<void> fetchLoginActivity() async {
    const url = 'https://backend-production-19d7.up.railway.app/api/loginActivity';
    final token = await getToken(); 
    
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {'Authorization': '$token',},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          loginActivity = List<Map<String, dynamic>>.from(data['login_activities']
              .map((activity) => {
                    "LoginClock": activity['time'],
                    "LoginDevice": activity['mobile'],
                    "LoginDate": activity['date'],
                  })
              .toList());
        });
      } else {
        print('Failed to load login activities');
      }
    } catch (e) {
      print('Error fetching login activities: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchLoginActivity();  // Fetch data when the page loads
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: PriamryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Appbar
            Row(
              children: [
                const SizedBox(height: 100),
                Stack(children: [
                  Positioned(
                    top: 5,
                    left: 20,
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
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const PrivacySettingPage(),
                          ));
                        },
                        iconSize: 25.0,
                        padding: const EdgeInsets.symmetric(
                            vertical: 3, horizontal: 9),
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
                          "Login Activity",
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

            // Login Activity List
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.10),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 1,
                    color: Colors.white,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Previous Login",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: 'InriaSans'),
                    ),
                    const SizedBox(height: 5),
                    Flexible(
                      child: loginActivity.isNotEmpty
                          ? ListView.builder(
                              primary: true,
                              padding: EdgeInsets.zero,
                              itemCount: loginActivity.length,
                              itemBuilder: (context, index) {
                                final login = loginActivity[index];
                                return Previoslogincard(
                                  LoginDate: login["LoginDate"].toString(),
                                  LoginDevice: login["LoginDevice"].toString(),
                                  LoginClock: login["LoginClock"].toString(),
                                );
                              },
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
                            ),
                    ),
                  ],
                ),
              ),
            ),

            // Button Bar
            const BarButton(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
