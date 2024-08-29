import 'package:flutter/material.dart';

class SubmitPage extends StatelessWidget {
  final List<String?> answers;

  SubmitPage({required this.answers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff537F5C),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Submit Your Answers',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle the submission logic here
                print('Submitted Answers: $answers');
                Navigator.pop(context); // Go back to the previous page after submission
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff618969),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              ),
              child: Text(
                'Submit',
                style: TextStyle(
                  color: Color(0xffD9D9D9),
                  fontSize: 23,
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back to the test without submitting
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff5B8864),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              ),
              child: Text(
                'Go Back',
                style: TextStyle(
                  color: Color(0xffD9D9D9),
                  fontSize: 23,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
