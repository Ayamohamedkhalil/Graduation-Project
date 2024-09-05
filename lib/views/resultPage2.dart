//import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:splash_onboarding_test/components/ButtonBar.dart';
import 'package:splash_onboarding_test/components/Ellipses.dart';
import 'package:splash_onboarding_test/constant/Colors.dart';

class Resultpage2 extends StatelessWidget {
  const Resultpage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          //
          //for backGround
          //
          Container(
            decoration: BoxDecoration(
              color: PriamryColor,
            ),
          ),
          Center(
            child: Image.asset(
              'assets/New Project-2-svg 1.png',
              color: Colors.white.withOpacity(0.1),
              fit: BoxFit.cover,
            ),
          ),
          //
          //
          //
          Column(
            children: [
              //
              //scrollable content
              //
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
                            const Text(
                              "“ADHD, or Attention-Deficit/Hyperactivity Disorder, can be abstractly understood as a mind in constant motion, where focus drifts like a leaf in the wind. It’s the challenge of holding onto a single thought as countless others rush in, competing for attention.”",
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                    child: const Text(
                                      "WHAT IS ADHD: your guide to adrenaline deficiency & hyperactivity disorder",
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
              //
              //
              //
              //Button Bar
              //
              //
              Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  //
                  //Guidlines Button
                  //
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
