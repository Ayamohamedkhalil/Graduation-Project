import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ResultCard extends StatelessWidget {
  const ResultCard(
      {super.key,
      required this.testName,
      required this.testResult,
      required this.testDate});

  final String testName;
  final String testResult;
  final String testDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Color.fromARGB(62, 255, 255, 255)))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            testName,
            style: const TextStyle(
              fontFamily: "Inter",
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xffD1E7D6),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text(
                    "Result",
                    style: TextStyle(
                        color: Color(0xffD1CEA1),
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    FontAwesomeIcons.arrowRight,
                    size: 16,
                    color: Color(0xffD1CEA1),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    testResult,
                    style: const TextStyle(
                        color: Color(0xffD1CEA1),
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              Text(
                testDate,
                style: const TextStyle(
                    color: Colors.white, fontSize: 14, fontFamily: "Inter"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
