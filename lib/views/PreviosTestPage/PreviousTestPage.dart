import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:splash_onboarding_test/components/ButtonBar.dart';
import 'package:splash_onboarding_test/constant/Colors.dart';
import 'package:splash_onboarding_test/views/PreviosTestPage/component/ResultCard.dart';
import 'package:splash_onboarding_test/views/UserProfile.dart';
import 'package:splash_onboarding_test/Registeration/auth_service.dart';

// Model class for Test
class Test {
  final String date;
  final String diseaseName;
  final String testName;

  Test({required this.date, required this.diseaseName, required this.testName});

  factory Test.fromJson(Map<String, dynamic> json) {
    return Test(
      date: json['date'],
      diseaseName: json['disease_name'],
      testName: json['test_name'],
    );
  }
}

// Function to fetch tests from the API
Future<List<Test>> getTests() async {
  final String? token = await getToken(); // Your method to get the token
  final response = await http.get(
    Uri.parse('https://backend-production-19d7.up.railway.app/api/tests'),
    headers: {
      'Authorization': token ?? '',
    },
  );

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);

    // Check if the message indicates no tests found
    if (jsonData['message'] == "No tests found") {
      return Future.error(jsonData['message']);
    }

    final List<Test> tests = (jsonData['tests'] as List)
        .map((test) => Test.fromJson(test))
        .toList();
    
    return tests;
  } else {
    throw Exception('No tests yet');
  }
}

// Main widget for Previous Test Page
class Previoustestpage extends StatelessWidget {
  const Previoustestpage({super.key});

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
                const SizedBox(height: 90),
                Stack(children: [
                  Positioned(
                    top: 2,
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
                            builder: (context) => const UserProfile(),
                          ));
                        },
                        iconSize: 25.0,
                        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 9),
                        splashRadius: 25.0,
                        tooltip: "Back",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Tests History",
                          style: TextStyle(
                            fontFamily: "InriaSans",
                            fontSize: 26,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
              ],
            ),
            // Result content
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: Colors.white),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.10),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: FutureBuilder<List<Test>>(
                  future: getTests(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No tests available'));
                    }

                    final tests = snapshot.data!;
                    return Scrollbar(
                      thumbVisibility: true,
                      interactive: true,
                      thickness: 6,
                      radius: const Radius.circular(40),
                      child: ListView.builder(
                        itemCount: tests.length,
                        itemBuilder: (context, index) {
                          final test = tests[index];
                          return ResultCard(
                            testName: test.testName,
                            testResult: test.diseaseName, // or any relevant field
                            testDate: test.date,
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
            // ButtonBar
            const BarButton(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

// Method to retrieve the token (stub)
Future<String?> getToken() async {
  final String? token = await AuthService.getToken();
  if (token == null) {
    print('No token found');
  } else {
    print('Retrieved Token: $token');
  }
  return token;
}
