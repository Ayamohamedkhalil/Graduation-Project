import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:splash_onboarding_test/components/ButtonBar.dart';
import 'package:splash_onboarding_test/constant/Colors.dart';
import 'package:splash_onboarding_test/views/ConatctUspage/contactUsPage.dart';

import 'package:splash_onboarding_test/views/FAQPage.dart';
import 'package:splash_onboarding_test/views/PreviosTestPage/PreviousTestPage.dart';
import 'package:splash_onboarding_test/views/PrivacySettingPage/PrivacySettingPage.dart';
import 'package:splash_onboarding_test/views/accountsetting.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});
  final String userImage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      color: const Color(0xFF537F5C),
      child: Column(
        children: [
          const SizedBox(height: 65),
          //
          //Image + name + Email
          //
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: userImage == ""
                      ? Container(
                          color: Colors.grey,
                          width: 80,
                          height: 80,
                        )
                      : Image.asset(
                          userImage,
                          width: 80,
                          height: 80,
                        ),
                ),
              ),
              //const SizedBox(width: 10),
              const Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 100),
                    child: Text(
                      "John Doe",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text("john.doe@example.com",
                      style: TextStyle(
                        color: Colors.white,
                      ))
                ],
              ),
            ],
          ),
          //
          //
          //
          const SizedBox(height: 50),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //
                  //Previous Tests
                  //
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: BackgroundColor,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Previous Tests",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Previoustestpage()),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      "show all",
                                      style: TextStyle(
                                        color: PriamryColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Icon(
                                      Icons.play_arrow,
                                      color: PriamryColor,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Depression Assessment",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 41, 50, 66),
                                ),
                              ),
                              Text(
                                "01/01/2023",
                                style: TextStyle(
                                    color: Color(0xff6B7280), fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Anxiety Assessment",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 41, 50, 66),
                                  )),
                              Text(
                                "15/02/2023",
                                style: TextStyle(
                                    color: Color(0xff6B7280), fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Stress Level Assessment",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 41, 50, 66),
                                  )),
                              Text(
                                "20/03/2023",
                                style: TextStyle(
                                    color: Color(0xff6B7280), fontSize: 12),
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
                  const SizedBox(height: 25),
                  //
                  //Settings
                  //
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: BackgroundColor,
                    ),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Settings",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 3),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Accountsetting()),
                              );
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  FontAwesomeIcons.userGear,
                                  color: Color(0xff6B7280),
                                  size: 13,
                                ),
                                SizedBox(width: 10),
                                Text("Account Settings",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 41, 50, 66),
                                    )),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 3),
                          child: GestureDetector(
                            onTap: () {},
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  FontAwesomeIcons.solidBell,
                                  color: Color(0xff6B7280),
                                  size: 13,
                                ),
                                SizedBox(width: 10),
                                Text("Notification Settings",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 41, 50, 66),
                                    )),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 3),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PrivacySettingPage()),
                              );
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  FontAwesomeIcons.lock,
                                  color: Color(0xff6B7280),
                                  size: 13,
                                ),
                                SizedBox(width: 10),
                                Text("Privacy Settings",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 41, 50, 66),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //
                  //
                  //
                  const SizedBox(height: 25),
                  //
                  //Help and support
                  //
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: BackgroundColor,
                    ),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Help and support",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 3),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>  FAQPage()),
                              );
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  FontAwesomeIcons.circleInfo,
                                  color: Color(0xff6B7280),
                                  size: 13,
                                ),
                                SizedBox(width: 10),
                                Text("FAQ",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 41, 50, 66),
                                    )),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 3),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ContactUsPage(),
                                ),
                              );
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(FontAwesomeIcons.solidEnvelope,
                                    color: Color(0xff6B7280), size: 13),
                                SizedBox(width: 10),
                                Text("Contact us",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 41, 50, 66),
                                    )),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 7),
                          child: GestureDetector(
                            onTap: () {},
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Icon(FontAwesomeIcons.handshakeAngle,
                                      color: Color(0xff6B7280), size: 12),
                                ),
                                SizedBox(width: 7),
                                Text(" Get in Touch",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 41, 50, 66),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //
                  //
                  //
                ],
              ),
            ),
          ),
          //
          //ButtonBar
          //
          const BarButton(),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    ));
  }
}
