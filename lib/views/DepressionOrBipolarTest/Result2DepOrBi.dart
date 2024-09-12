//import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:splash_onboarding_test/components/ButtonBar.dart';
import 'package:splash_onboarding_test/components/Ellipses.dart';
import 'package:splash_onboarding_test/constant/Colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:splash_onboarding_test/Registeration/auth_service.dart';

class Result2DepOrBi extends StatefulWidget {
  final String result;

  const Result2DepOrBi({super.key, required this.result});

  @override
  _Result2DepOrBiState createState() => _Result2DepOrBiState();
}

class _Result2DepOrBiState extends State<Result2DepOrBi> {
  String? description;
  String? link;
  bool isLoading = true;
  String? errorMessage;
  String? token; // Store the fetched token

  @override
  void initState() {
    super.initState();
    fetchDiseaseDescription(); // Fetch the disease description when the page loads
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


  Future<void> fetchDiseaseDescription() async {
    String? token = await getToken();
    if (token == null) {
      setState(() {
        errorMessage = 'Token not found. Please login again.';
        isLoading = false;
      });
      return;
    }

    final response = await http.get(
      Uri.parse('https://backend-production-19d7.up.railway.app/api/test/GeneralTest/${widget.result}'),
      headers: {
        'Authorization': '$token',
      },
    );
    print('Response status: ${response.statusCode}'); // Add this for debugging
    print('Response body: ${response.body}'); // Add this for debugging
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        description = data['description'];
        link = data['link'];
        isLoading = false;
      });
    } else if (response.statusCode == 401) {
      setState(() {
        errorMessage = 'Invalid token. Please login again.';
        isLoading = false;
      });
    } else {
      setState(() {
        errorMessage = 'Failed to load description. Status code: ${response.statusCode}';
        isLoading = false;
      });
    }
  }

Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
  @override
Widget build(BuildContext context) {
  return Scaffold(
    body: Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: PriamryColor,
          ),
        ),
        Center(
          child: Image.asset(
            'assets/NewProject-2-svg-1.png',
            //color: Colors.white.withOpacity(.1),
            fit: BoxFit.cover,
          ),
        ),
        Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 30),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.06),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.white,
                        ),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/logo.png",
                          ),
                          isLoading
                              ? const CircularProgressIndicator()
                              : description == null
                                  ? Text(
                                      errorMessage ?? 'No description available',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 21,
                                          fontFamily: "Ledger"),
                                    )
                                  : Text(
                                      description!,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 21,
                                          fontFamily: "Ledger"),
                                    ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 10),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 10),
                            decoration: BoxDecoration(
                                color: BackgroundColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: [
                                    const Expanded(
                                      flex: 6,
                                      child: Text(
                                        "If you want to know more about this disorder",
                                        softWrap: true,
                                        overflow: TextOverflow.clip,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: "Inter",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    IconButton(
                                      padding: EdgeInsetsDirectional.zero,
                                      onPressed: () {},
                                      icon: Icon(
                                        FontAwesomeIcons.caretDown,
                                        color: SecondryColor,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (link != null) {
                                        _launchUrl(link!);
                                    }
                                  },
                                  child: Text(
                                    link ?? "No link available",
                                    style: TextStyle(
                                        fontFamily: "Inter",
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff1D17D1),
                                        decoration: TextDecoration.underline),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          )
                        ],
                      ),
                    ),
                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [EllipsesInResultpage()],
                            ),
                          ),
                          Expanded(
                            flex: 8,
                            child: Column(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  child: const Text(
                                    "But don’t worry. we’re here to join you through your healing journey, so we’ve designed comprehensive guidelines specifically tailored to support your mental well-being",
                                    softWrap: true,
                                    style: TextStyle(
                                        fontFamily: "Ledger",
                                        fontSize: 21,
                                        color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [EllipsesInResultpage()],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: 200,
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
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff618969),
                      shadowColor: const Color(0xff537F5C),
                      alignment: Alignment.center,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Guidelines', // Button text
                          style: TextStyle(
                            color: const Color(0xffD9D9D9), // Text color
                            fontSize: 23, // Text size
                            shadows: [
                              Shadow(
                                color: Colors.black
                                    .withOpacity(0.5), // Shadow color
                                offset: const Offset(2, 2), // Shadow offset
                                blurRadius: 4, // Shadow blur radius
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          FontAwesomeIcons.arrowRight,
                          color: Colors.white,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const BarButton(),
                const SizedBox(
                  height: 10,
                ),
              ],
            )
          ],
        )
      ],
    ),
  );
}
}
