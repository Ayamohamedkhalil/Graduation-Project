import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:splash_onboarding_test/components/ButtonBar.dart';
import 'package:splash_onboarding_test/components/FAQCard.dart';
import 'package:splash_onboarding_test/constant/Colors.dart';
import 'package:splash_onboarding_test/views/UserProfile.dart';
import 'package:splash_onboarding_test/Registeration/auth_service.dart'; // Assuming AuthService is handling token storage

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});

  @override
  _FAQPageState createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  List<Map<String, String>> faqList = [];
  bool isLoading = true;
  String? errorMessage;
    Future<String?> getToken() async {
    final String? token = await AuthService.getToken();
    if (token == null) {
      print('No token found');
    } else {
      print('Retrieved Token: $token');
    }
    return token;
  }

  Future<void> fetchFAQs() async {
    final token = await getToken(); // Fetch the JWT token
    if (token == null) {
      setState(() {
        errorMessage = "No token found. Please log in again.";
        isLoading = false;
      });
      return;
    }

    try {
      final response = await http.get(
        Uri.parse('https://backend-production-19d7.up.railway.app/api/faq'),
        headers: {'Authorization': '$token',},
      );

      if (response.statusCode == 200) {
        // Parse the response body into a Map
        final Map<String, dynamic> responseData = json.decode(response.body);

        // Check if "faq" key exists and it's a list
        if (responseData.containsKey('faq') && responseData['faq'] is List) {
          final List<dynamic> faqData = responseData['faq'];

          setState(() {
            // Safely cast each element to Map<String, dynamic> and convert it to Map<String, String>
            faqList = faqData.map<Map<String, String>>((faq) {
              return {
                "Q": faq["question"].toString(),  // Convert to string
                "A": faq["answer"].toString(),    // Convert to string
              };
            }).toList();
            isLoading = false;
          });
        } else {
          setState(() {
            errorMessage = "FAQ data is not in the expected format.";
            isLoading = false;
          });
        }
      } else {
        setState(() {
          errorMessage = "Failed to load FAQs. Status code: ${response.statusCode}";
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = "An error occurred: $e";
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchFAQs(); // Fetch the FAQ data when the page loads
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          //
          //appBar
          //
          Stack(children: [
            //
            //backIcon + Image + Text("How can we help you")
            //
            SizedBox(
              height: 230,
              child: Column(
                children: [
                  Container(
                    height: 208,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: PriamryColor,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(23),
                            bottomRight: Radius.circular(23))),
                    child: Stack(
                      children: [
                        //
                        //BackButton
                        //
                        Positioned(
                          top: 25,
                          left: 25,
                          child: Container(
                            margin: const EdgeInsets.only(right: 320),
                            width: 35.0, // Adjust the width of the circle
                            height: 35.0, // Adjust the height of the circle
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(
                                  .80), // Background color (light green)
                              shape: BoxShape.circle, // Circular shape
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black
                                      .withOpacity(0.15), // Shadow color
                                  spreadRadius:
                                      2, // How much the shadow should spread
                                  blurRadius:
                                      5, // The blur radius of the shadow
                                  offset: const Offset(
                                      0, 2), // Offset the shadow vertically
                                ),
                              ],
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.arrow_back_ios),
                              color: const Color(
                                  0xFF537F5C), // Set the color of the arrow icon
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const UserProfile(),
                                ));
                              },
                              iconSize: 25.0, // Adjust the size of the icon
                              padding: const EdgeInsets.symmetric(
                                  vertical: 3,
                                  horizontal:
                                      9), // Adjust padding around the icon
                              splashRadius:
                                  25.0, // Adjust the splash radius on click
                              tooltip: "Next",
                            ),
                          ),
                        ),
                        //
                        //
                        //
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/logo1.png",
                                height: 130,
                                width: 170,
                              ),
                              const Expanded(
                                child: Text(
                                  "How can we Help you?",
                                  textAlign: TextAlign.center,
                                  softWrap: true,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontFamily: "Ledger"),
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //
            //
            //
            //
            //SearchBar
            //
            Positioned(
              bottom: 10,
              left: MediaQuery.of(context).size.width * 0.1,
              child: SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextFormField(
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(
                        0xffC4D3C7), // Background color similar to the image
                    prefixIcon: const Icon(Icons.search,
                        color: Color(0xFF537F5C)), // Left icon
                    suffixIcon: const Icon(Icons.mic_none,
                        color: Color(0xFF537F5C)), // Right icon
                    hintText: 'Search for test',
                    hintStyle: const TextStyle(
                        color: Color(0xFF537F5C),
                        fontFamily: 'Ledger',
                        fontSize: 18), // Text color similar to the image
                    contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(25.0), // Rounded corners
                      borderSide: const BorderSide(
                        color: Color(
                            0xFF52734D), // Border color similar to the image
                        width: 1.2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(
                        color:
                            Color(0xFF537F5C), // Border color for enabled state
                        width: 1.2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(
                        color:
                            Color(0xFF537F5C), // Border color for focused state
                        width: 1.2,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //
            //
            //
          ]),
          //
          //FAQ Cards with Padding
          //
          Expanded(
            child: Stack(
              children: [
                if (isLoading)
                  const Center(child: CircularProgressIndicator())
                else if (errorMessage != null)
                  Center(child: Text(errorMessage!))
                else
                  Padding(
                    padding: const EdgeInsets.only(bottom: 60.0), // Add bottom padding to avoid overlap with the button
                    child: Scrollbar(
                      interactive: true,
                      radius: const Radius.circular(40),
                      thickness: 14,
                      thumbVisibility: true,
                      child: ListView.builder(
                        padding: const EdgeInsets.all(0),
                        itemCount: faqList.length,
                        itemBuilder: (context, index) {
                          return FAQCard(
                              Q: faqList[index]["Q"]!, A: faqList[index]["A"]!);
                        },
                      ),
                    ),
                  ),
                //
                //ButtonBar
                //
                Positioned(
                    bottom: 5,
                    left: MediaQuery.of(context).size.width * 0.15,
                    child: const BarButton()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
