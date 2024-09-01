import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:splash_onboarding_test/constant/Colors.dart';
import 'package:splash_onboarding_test/home.dart';
import 'package:splash_onboarding_test/views/accountsetting.dart';

class UserProfile extends StatelessWidget {
  UserProfile({super.key});
  final String UserImage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      color: const Color(0xFF537F5C),
      child: Column(
        children: [
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: UserImage == ""
                    ? Container(
                        color: Colors.grey,
                        width: 80,
                        height: 80,
                      )
                    : Image.asset(
                        UserImage,
                        width: 80,
                        height: 80,
                      ),
              ),
              const SizedBox(width: 20),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "John Doe",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text("john.doe@example.com",
                      style: TextStyle(color: Colors.white))
                ],
              ),
              Image.asset(
                "assets/logoupdate.png",
                width: 100,
              )
            ],
          ),
          const SizedBox(height: 50),
          // Using Expanded to make the SingleChildScrollView take available space
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
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
                              horizontal: 5.0, vertical: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Previous Tests",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                              GestureDetector(
                                onTap: () {},
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
                                    Icon(Icons.play_arrow, color: PriamryColor),
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
                              Text("Depression Assessment"),
                              Text(
                                "01/01/2023",
                                style: TextStyle(color: Color(0xff6B7280)),
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
                              Text("Anxiety Assessment"),
                              Text(
                                "15/02/2023",
                                style: TextStyle(color: Color(0xff6B7280)),
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
                              Text("Stress Level Assessment"),
                              Text(
                                "20/03/2023",
                                style: TextStyle(color: Color(0xff6B7280)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  Container(
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
                              horizontal: 5.0, vertical: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Settings",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
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
                        MaterialPageRoute(builder: (context) => Accountsetting()),
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
                                Text("Account Settings"),
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
                                Text("Notification Settings"),
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
                                  FontAwesomeIcons.lock,
                                  color: Color(0xff6B7280),
                                  size: 13,
                                ),
                                SizedBox(width: 10),
                                Text("Privacy Settings"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  Container(
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
                              horizontal: 5.0, vertical: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Help and support",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                            ],
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
                                  FontAwesomeIcons.circleInfo,
                                  color: Color(0xff6B7280),
                                  size: 13,
                                ),
                                SizedBox(width: 10),
                                Text("FAQ"),
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
                                Icon(FontAwesomeIcons.solidEnvelope,
                                    color: Color(0xff6B7280), size: 13),
                                SizedBox(width: 10),
                                Text("Contact us"),
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
                                Icon(FontAwesomeIcons.handshake,
                                    color: Color(0xff6B7280), size: 13),
                                SizedBox(width: 10),
                                Text(" Get in Touch"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            // margin: EdgeInsets.symmetric(horizontal: 50),
            height: 58,
            width: 300,
            decoration: BoxDecoration(
              border: Border.all(
                  width: 2, color: Color(0xff3B5D44).withOpacity(.90)),
              color: Color.fromARGB(255, 196, 211, 199),
              borderRadius: BorderRadius.circular(20),
              /*boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.),
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  )
                ]*/
            ),
            child: SizedBox(
              height: 58,
              width: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    color: const Color(0xff3B5D44),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit,
                      size: 37,
                    ),
                  ),
                  const SizedBox(
                    width: 20, // Closer spacing to the home icon
                  ),
                  // FaIcon(FontAwesomeIcons.pen),
                  IconButton(
                    color: const Color(0xff3B5D44),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => homescreen()),
                      );
                    },
                    icon: const Icon(
                      Icons.home,
                      size: 37,
                    ),
                  ),
                  const SizedBox(
                    width: 20, // Closer spacing to the person icon
                  ),
                  IconButton(
                    color: const Color(0xff3B5D44),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => UserProfile()),
                      );
                    },
                    icon: const Icon(
                      Icons.person,
                      size: 37,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    ));
  }
}
