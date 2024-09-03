import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:splash_onboarding_test/components/FAQCard.dart';
import 'package:splash_onboarding_test/constant/Colors.dart';
import 'package:splash_onboarding_test/home.dart';
import 'package:splash_onboarding_test/views/UserProfile.dart';

List<Map<String, String>> FAQ = [
  {
    "Q": "How to reset Account?",
    "A":
        "if you want to know more about this disorder more about this disorder more about this disorder."
  },
  {
    "Q": "How to reset Account?",
    "A":
        "if you want to know more about this disorder more about this disorder more about this disorder."
  },
  {
    "Q": "How to reset Account?",
    "A":
        "if you want to know more about this disorder more about this disorder more about this disorder."
  },
  {
    "Q": "How to reset Account?",
    "A":
        "if you want to know more about this disorder more about this disorder more about this disorder."
  },
];

class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                  builder: (context) => UserProfile(),
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
                              const SizedBox(
                                height: 20,
                              ),
                              Image.asset(
                                "assets/New Project-2-svg 1.png",
                                width: 110,
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
              child: Container(
                //margin: EdgeInsets.only(top: 10),
                height: 40,
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextFormField(
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    //hoverColor: Colors.white,
                    filled: true,
                    fillColor: Color(
                        0xffC4D3C7), // Background color similar to the image
                    prefixIcon: Icon(Icons.search,
                        color: Color(0xFF537F5C)), // Left icon
                    suffixIcon: Icon(Icons.mic_none,
                        color: Color(0xFF537F5C)), // Right icon
                    hintText: 'Search for test',
                    hintStyle: TextStyle(
                        color: Color(0xFF537F5C),
                        fontFamily: 'Ledger',
                        fontSize: 18), // Text color similar to the image
                    contentPadding: EdgeInsets.symmetric(vertical: 2.0),
                    // Padding to align text centrally
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(25.0), // Rounded corners
                      borderSide: BorderSide(
                        color: Color(
                            0xFF52734D), // Border color similar to the image
                        width: 1.2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color:
                            Color(0xFF537F5C), // Border color for enabled state
                        width: 1.2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
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
          //FAQ Cards
          //
          Expanded(
            child: Stack(children: [
              Scrollbar(
                interactive: true,
                radius: const Radius.circular(40),
                thickness: 14,
                thumbVisibility: true,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: FAQ.length,
                  itemBuilder: (context, index) {
                    return FAQCard(Q: FAQ[index]["Q"]!, A: FAQ[index]["A"]!);
                  },
                ),
              ),
              //
              //ButtonBar
              //
              Positioned(
                bottom: 5,
                left: MediaQuery.of(context).size.width * 0.15,
                child: Container(
                  height: 58,
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: ThirdColor),
                    color: const Color(0xffC4D3C7).withOpacity(1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SizedBox(
                    height: 58,
                    width: 350,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.1,
                        ),
                        Expanded(
                          child: IconButton(
                            color: const Color(0xff3B5D44),
                            onPressed: () {},
                            icon: const Icon(
                              Icons.edit,
                              size: 37,
                            ),
                          ),
                        ),
                        // FaIcon(FontAwesomeIcons.pen),
                        Expanded(
                          child: IconButton(
                            color: const Color(0xff3B5D44),
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const homescreen()),
                              );
                            },
                            icon: const Icon(
                              Icons.home,
                              size: 37,
                            ),
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            color: const Color(0xff3B5D44),
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const UserProfile()),
                              );
                            },
                            icon: const Icon(
                              Icons.person,
                              size: 37,
                            ),
                          ),
                        ),
                       SizedBox(
                          width: MediaQuery.of(context).size.width * 0.1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
