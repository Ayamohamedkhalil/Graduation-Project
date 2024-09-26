import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:splash_onboarding_test/components/ButtonBar.dart';
import 'package:splash_onboarding_test/components/FAQCard.dart';
import 'package:splash_onboarding_test/constant/Colors.dart';
import 'package:splash_onboarding_test/views/UserProfile.dart';
import 'package:splash_onboarding_test/Registeration/auth_service.dart'; 

// Declare the FAQPage class
class FAQPage extends StatefulWidget {
  @override
  _FAQPageState createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  List<Map<String, String>> faqList = [];
  List<Map<String, String>> filteredFaqList = []; // This will hold filtered FAQs
  bool isLoading = true;
  String? errorMessage;
  TextEditingController searchController = TextEditingController(); // For handling search input

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
        headers: {'Authorization': token,},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        if (responseData.containsKey('faq') && responseData['faq'] is List) {
          final List<dynamic> faqData = responseData['faq'];

          setState(() {
            faqList = faqData.map<Map<String, String>>((faq) {
              return {
                "Q": faq["question"].toString(),
                "A": faq["answer"].toString(),
              };
            }).toList();
            filteredFaqList = faqList; // Initially, show all FAQs
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

  void filterFAQs(String query) {
    setState(() {
      filteredFaqList = faqList
          .where((faq) => faq["Q"]!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    fetchFAQs(); // Fetch the FAQ data when the page loads

    // Add a listener to search controller to filter FAQs in real-time
    searchController.addListener(() {
      filterFAQs(searchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Stack(children: [
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
                        Positioned(
                          top: 25,
                          left: 25,
                          child: Container(
                            margin: const EdgeInsets.only(right: 320),
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
                              padding: const EdgeInsets.symmetric(
                                  vertical: 3, horizontal: 9),
                              splashRadius: 25.0,
                              tooltip: "Next",
                            ),
                          ),
                        ),
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
            Positioned(
              bottom: 10,
              left: MediaQuery.of(context).size.width * 0.1,
              child: SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextFormField(
                  controller: searchController, // Attach the controller
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xffC4D3C7),
                    prefixIcon: const Icon(Icons.search,
                        color: Color(0xFF537F5C)),
                    suffixIcon: const Icon(Icons.mic_none,
                        color: Color(0xFF537F5C)),
                    hintText: 'Search for test',
                    hintStyle: const TextStyle(
                        color: Color(0xFF537F5C),
                        fontFamily: 'Ledger',
                        fontSize: 18),
                    contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(25.0),
                      borderSide: const BorderSide(
                        color: Color(0xFF52734D),
                        width: 1.2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(
                        color: Color(0xFF537F5C),
                        width: 1.2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(
                        color: Color(0xFF537F5C),
                        width: 1.2,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
          Expanded(
            child: Stack(
              children: [
                if (isLoading)
                  const Center(child: CircularProgressIndicator())
                else if (errorMessage != null)
                  Center(child: Text(errorMessage!))
                else
                  Padding(
                    padding: const EdgeInsets.only(bottom: 60.0),
                    child: Scrollbar(
                      interactive: true,
                      radius: const Radius.circular(40),
                      thickness: 14,
                      thumbVisibility: true,
                      child: ListView.builder(
                        padding: const EdgeInsets.all(0),
                        itemCount: filteredFaqList.length, // Use filtered list
                        itemBuilder: (context, index) {
                          return FAQCard(
                              Q: filteredFaqList[index]["Q"]!,
                              A: filteredFaqList[index]["A"]!);
                        },
                      ),
                    ),
                  ),
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
