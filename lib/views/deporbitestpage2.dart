import 'package:flutter/material.dart';
import 'package:splash_onboarding_test/constant/answers.dart';
import 'package:splash_onboarding_test/home.dart';
import 'package:splash_onboarding_test/views/deporbitestpage3.dart';
//import 'package:splash_onboarding_test/views/gentestlastpage.dart';

class specifictestpage2 extends StatefulWidget {
  @override
  _specifictestpage2 createState() => _specifictestpage2();
}

class _specifictestpage2 extends State<specifictestpage2> {
  int _currentQuestionIndex = 0;
  bool _answerSelected = false;

  final List<String> _questions = [
    "I felt jfldfkld",
    "I felt cAya",
    "I felt medo",
    "I felt reko",
    "I felt zozo",

    // Add more questions here...
  ];

  @override
  void initState() {
    super.initState();
    answers2 = List<String?>.filled(_questions.length, null);
  }

  void _selectAnswer(String answer) {
    setState(() {
      answers2[_currentQuestionIndex] = answer;
      _answerSelected = true;
      print('Current Answers List: $answers2');
    });
  }

  void _nextQuestion() {
    if (_answerSelected) {
      if (_currentQuestionIndex < _questions.length - 1) {
        setState(() {
          _currentQuestionIndex++;
          _answerSelected = answers2[_currentQuestionIndex] != null;
        });
      } else {
        // Navigate to the SubmitPage if this is the last question
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => specifictestpage3(),
          ),
        );
      }
    } else {
      _showAnswerAlert();
    }
  }

  void _previousQuestion() {
    if (_currentQuestionIndex > 0) {
      setState(() {
        _currentQuestionIndex--;
        _answerSelected = answers2[_currentQuestionIndex] != null;
      });
    }
  }

  void _showAnswerAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Answer Required"),
          content: const Text("Please select an answer before proceeding."),
          actions: [
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showQuitConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            side: BorderSide(
                color: const Color(0xffD9D9D9).withOpacity(.69), width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: const Color(0xff537F5C)
              .withOpacity(.88), // Match the background color
          content: SizedBox(
            height: 350, // Set the height of the dialog
            width: 320,
            // Set the width of the dialog
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 60,
                ),
                const Text(
                  "Are you sure\n you want to Quit the \ntest?",
                  style: TextStyle(
                      color: Colors.white, // White text color
                      fontSize: 22, // Similar font size
                      //fontWeight: FontWeight.bold,
                      fontFamily: 'InriaSans-Regular'),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                    height: 20), // Add space between text and buttons
                Container(
                  width: 200,
                  decoration: BoxDecoration(
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
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const homescreen()),
                      ); // Close the dialog
                      // Add your logic to quit the test here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffA71C1C)
                          .withOpacity(.88), // Red color for "Quit"
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Rounded button
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text(
                      "Quit",
                      style: TextStyle(
                          color: Colors.white, // White text color
                          fontSize: 22, // Adjust the font size
                          fontFamily: 'InriaSans-Bold'),
                    ),
                  ),
                ),
                const SizedBox(height: 20), // Add space between buttons
                SizedBox(
                  width: 200, // Set the width of the "Cancel" button
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                          color: Colors.white, width: 2), // White border
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Rounded button
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        color: Colors.white, // White text color
                        fontSize: 22, // Adjust the font size
                        fontFamily: 'InriaSans-Regular',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildProgressIndicator() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 100.0),
        child: Row(
          children: List.generate(_questions.length, (index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 2.0),
              width: 16, // Adjusted width for oval shape
              height: 9.0, // Height remains the same
              decoration: BoxDecoration(
                color: index == _currentQuestionIndex
                    ? Colors.white
                    : Colors.white.withOpacity(0.5),
                borderRadius: const BorderRadius.all(Radius.elliptical(16, 10)),
              ),
            );
          }),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff537F5C),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildProgressIndicator(),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: const Color(0xff5B8864),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white10,
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 3), // Shadow position
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _questions[_currentQuestionIndex],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 60),
                        Container(
                          // margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(.25),
                                spreadRadius: 0,
                                blurRadius: 4,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          height: 55,
                          width: 271,
                          child: ElevatedButton(
                            onPressed: () {
                              _selectAnswer("YES");
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFB7B597),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 40),
                            ),
                            child: const Center(
                              child: Text(
                                "YES",
                                style: TextStyle(
                                    color: Color(0xFF3E1904),
                                    fontFamily: 'Inter',
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(.25),
                                spreadRadius: 0,
                                blurRadius: 4,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          height: 55,
                          width: 271,
                          child: ElevatedButton(
                            onPressed: () {
                              _selectAnswer("NO");
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFB7B597),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 40),
                            ),
                            child: const Center(
                              child: Text(
                                "NO",
                                style: TextStyle(
                                    color: Color(0xFF3E1904),
                                    fontFamily: 'Inter',
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 35.0, // Adjust the width of the circle
                  height: MediaQuery.of(context).size.height * 0.12,
                  decoration: BoxDecoration(
                    color: Colors.white
                        .withOpacity(.70), // Background color (light green)
                    shape: BoxShape.circle, // Circular shape
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15), // Shadow color
                        spreadRadius: 2, // How much the shadow should spread
                        blurRadius: 5, // The blur radius of the shadow
                        offset:
                            const Offset(0, 2), // Offset the shadow vertically
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    color: const Color(
                        0xFF537F5C), // Set the color of the arrow icon
                    onPressed: _previousQuestion,
                    iconSize: 30.0, // Adjust the size of the icon
                    padding: const EdgeInsets.all(
                        3.0), // Adjust padding around the icon
                    splashRadius: 25.0, // Adjust the splash radius on click
                    tooltip: "Next",
                  ),
                ),
                Container(
                  width: 35.0, // Adjust the width of the circle
                  height: 35.0, // Adjust the height of the circle
                  decoration: BoxDecoration(
                    color: Colors.white
                        .withOpacity(.70), // Background color (light green)
                    shape: BoxShape.circle, // Circular shape
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15), // Shadow color
                        spreadRadius: 2, // How much the shadow should spread
                        blurRadius: 5, // The blur radius of the shadow
                        offset:
                            const Offset(0, 2), // Offset the shadow vertically
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward),
                    color: const Color(
                        0xFF537F5C), // Set the color of the arrow icon
                    onPressed: _nextQuestion,
                    iconSize: 30.0, // Adjust the size of the icon
                    padding: const EdgeInsets.all(
                        3.0), // Adjust padding around the icon
                    splashRadius: 25.0, // Adjust the splash radius on click
                    tooltip: "Next",
                  ),
                ),
              ],
            ),
            Container(
              width: 200,
              height: MediaQuery.of(context).size.height * 0.075,
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
                onPressed: () {
                  _showQuitConfirmationDialog(); // Show the quit confirmation dialog
                },
                child: Text(
                  'Quit test', // Button text
                  style: TextStyle(
                    color: const Color(0xffD9D9D9), // Text color
                    fontSize: 23, // Text size
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.5), // Shadow color
                        offset: const Offset(2, 2), // Shadow offset
                        blurRadius: 4, // Shadow blur radius
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
