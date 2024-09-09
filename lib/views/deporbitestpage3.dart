import 'package:flutter/material.dart';
import 'package:splash_onboarding_test/constant/answers.dart';
import 'package:splash_onboarding_test/home.dart';
import 'package:splash_onboarding_test/views/gentestlastpage.dart';

class specifictestpage3 extends StatefulWidget {
  @override
  _specifictestpage3 createState() => _specifictestpage3();
}

class _specifictestpage3 extends State<specifictestpage3> {
  int _currentQuestionIndex = 0;
  bool _answerSelected = false;

  final List<String> _questions = [
    "I felt jfldfkld",
    "I felt cAya",
    "I felt medo",
    "I felt reko",
    "I felt zozo",
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
    answers3 = List<String?>.filled(_questions.length, null);
  }

  void _selectAnswer(String answer) {
    setState(() {
      answers3[_currentQuestionIndex] = answer;
      _answerSelected = true;
      print('Current Answers List: $answers3');
    });
  }

  void _nextQuestion() {
    if (_answerSelected) {
      if (_currentQuestionIndex < _questions.length - 1) {
        setState(() {
          _currentQuestionIndex++;
          _answerSelected = answers3[_currentQuestionIndex] != null;
        });
      } else {
        // Navigate to the SubmitPage if this is the last question
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SubmitPage(answers: answers3),
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
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
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
                              fontSize: 22, // Adjust font size accordingly
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 40),
                          // This is the grid of 1-10 answer options
                          GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                            ),
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  _selectAnswer((index + 1).toString());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: answers3[_currentQuestionIndex] ==
                                            (index + 1).toString()
                                        ? const Color(0xFFB7B597)
                                        : Colors.white.withOpacity(0.8),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(.25),
                                        spreadRadius: 0,
                                        blurRadius: 4,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Text(
                                      (index + 1).toString(),
                                      style: TextStyle(
                                        color:
                                            answers3[_currentQuestionIndex] ==
                                                    (index + 1).toString()
                                                ? const Color(0xFF3E1904)
                                                : const Color(0xFF537F5C),
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Navigation buttons
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: const Color.fromARGB(255, 244, 246, 244),
                  onPressed: _previousQuestion,
                  iconSize: 30.0,
                  padding: const EdgeInsets.all(3.0),
                  splashRadius: 25.0,
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  color: const Color.fromARGB(255, 253, 254, 254),
                  onPressed: _nextQuestion,
                  iconSize: 30.0,
                  padding: const EdgeInsets.all(3.0),
                  splashRadius: 25.0,
                ),
              ],
            ),
            const SizedBox(height: 40),
            // Quit button
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
                  _showQuitConfirmationDialog();
                },
                child: Text(
                  'Quit test',
                  style: TextStyle(
                    color: const Color(0xffD9D9D9),
                    fontSize: 23,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.5),
                        offset: const Offset(2, 2),
                        blurRadius: 4,
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
