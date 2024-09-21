import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:splash_onboarding_test/constant/Colors.dart';
import 'package:splash_onboarding_test/views/UserProfile.dart';
import 'package:splash_onboarding_test/Registeration/auth_service.dart';

class Contact {
  final String contactType;
  final String way;

  Contact({required this.contactType, required this.way});

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      contactType: json['contact'],
      way: json['way'],
    );
  }
}

Future<List<Contact>> fetchContacts() async {
  final String? token = await getToken();
  final response = await http.get(
    Uri.parse('https://backend-production-19d7.up.railway.app/api/contact_support'),
    headers: {
      'Authorization': token ?? '',
    },
  );

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    final List<Contact> contacts = (jsonData['Contacts'] as List)
        .map((contact) => Contact.fromJson(contact))
        .toList();
    return contacts;
  } else {
    throw Exception('Failed to load contacts');
  }
}

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: PriamryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Appbar
            Row(
              children: [
                const SizedBox(height: 100),
                Stack(children: [
                  Positioned(
                    left: 20,
                    top: 3,
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
                          "Contact Us",
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
            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "We’re here to help!",
                      style: TextStyle(
                          fontFamily: "InriaSans",
                          color: Colors.white,
                          fontSize: 27,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "If you have any questions, feedback, or need support, feel free to reach out to us. Our team is always ready to assist you.",
                      style: TextStyle(
                          fontFamily: "InriaSans-Light",
                          fontSize: 18,
                          color: Colors.white,
                          height: 1.1),
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      "Contact us through these channels:",
                      style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'InriaSans'),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: FutureBuilder<List<Contact>>(
                        future: fetchContacts(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(child: Text('Error: ${snapshot.error}'));
                          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                            return const Center(child: Text('No contact information available'));
                          }

                          final contacts = snapshot.data!;
                          return ListView.separated(
                            itemCount: contacts.length,
                            separatorBuilder: (context, index) => Divider(color: PriamryColor),
                            itemBuilder: (context, index) {
                              final contact = contacts[index];
                              return Container(
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 194, 193, 193),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                child: ListTile(
                                  leading: _getIcon(contact.contactType),
                                  title: Text(
                                    contact.way,
                                    style: const TextStyle(
                                        fontFamily: "Inter",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Icon _getIcon(String contactType) {
    switch (contactType) {
      case 'email':
        return const Icon(FontAwesomeIcons.solidEnvelope, color: Color(0xff374151));
      case 'phone':
        return const Icon(FontAwesomeIcons.phone, color: Color(0xff374151));
      case 'linkedin':
        return const Icon(FontAwesomeIcons.linkedin, color: Color(0xff374151));
      case 'facebook':
        return const Icon(FontAwesomeIcons.facebook, color: Color(0xff374151));
      case 'twitter':
        return const Icon(FontAwesomeIcons.twitter, color: Color(0xff374151));
      default:
        return const Icon(Icons.help, color: Color(0xff374151));
    }
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
