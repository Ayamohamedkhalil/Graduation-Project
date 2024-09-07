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
          Center(
            child: Text(
              "     You've answered all the\n questions! Are you sure you\n         want to submit your\n                  answers?",
              style:
                  TextStyle(color: Colors.white.withOpacity(.80), fontSize: 20, fontFamily: 'Poppins'
                      , fontWeight: FontWeight.bold,
                      ),
            ),
          ),
          Image.asset(
            'assets/submitpage.png',
            height: 300,
            width: 320,
          ),
           SizedBox(height: 20),
          Container(
            width: 180,
            height: 40,
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
                allanswers = answers1 + answers2 + answers3;
                print('Submitted Answers: $allanswers');
              },
              child: Text(
                'Submit', // Button text
                style:TextStyle(
            color: Color(0xffD9D9D9),
            fontSize: 20,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
          ),
              ),
            ),
          ),

          SizedBox(height: 15),
          Container(
            width: 180,
            height: 40,
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
            color: Color(0xffD9D9D9),
            fontSize: 20,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
          ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
