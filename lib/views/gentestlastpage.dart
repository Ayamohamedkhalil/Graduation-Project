import 'package:flutter/material.dart';
import 'package:splash_onboarding_test/constant/answers.dart';
import 'package:splash_onboarding_test/views/result1.dart';

class SubmitPage extends StatelessWidget {
  final List<String?> answers;

  SubmitPage({required this.answers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff537F5C),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: Text(
              'Submit your answers',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // SizedBox(height: 20),
          Container(
            height: 50,
            width: 230,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.white),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff618969),
                shadowColor: const Color(0xff537F5C),
                alignment: Alignment.center,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Result1(),
                  ),
                );
                print('Submitted Answers: $answers');
                allanswers = answers1 + answers2;
                print('Submitted Answers: $allanswers');
              },
              child: Text(
                'Submit', // Button text
                style: TextStyle(
                  color: Color(0xffD9D9D9), // Text color
                  fontSize: 23, // Text size
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.5), // Shadow color
                      offset: Offset(2, 2), // Shadow offset
                      blurRadius: 4, // Shadow blur radius
                    ),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(height: 40),
          Container(
            height: 50,
            width: 230,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.white),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff618969),
                shadowColor: const Color(0xff537F5C),
                alignment: Alignment.center,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Go Back', // Button text
                style: TextStyle(
                  color: Color(0xffD9D9D9), // Text color
                  fontSize: 23, // Text size
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.5), // Shadow color
                      offset: Offset(2, 2), // Shadow offset
                      blurRadius: 4, // Shadow blur radius
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
