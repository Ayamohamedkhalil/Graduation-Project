import 'package:flutter/material.dart';
import 'package:splash_onboarding_test/home.dart';
import 'package:splash_onboarding_test/views/deporbitestpage2.dart';


class specifictestpage1 extends StatefulWidget {
  @override
  _specifictestpage1 createState() => _specifictestpage1();
}

class _specifictestpage1 extends State<specifictestpage1> {
  int _currentQuestionIndex = 0;
  bool _answerSelected = false;

  final List<String> _questions = [
    "Do you often feel nervous or on edge without a clear reason?",
    "Have you ever felt sudden, intense fear or panic without any warning?",
    "Do you find yourself breathing quickly, especially when others might not be?",
    
  ];
  List<String?> answers1 = [];

  @override
  void initState() {
    super.initState();
    answers1 = List<String?>.filled(_questions.length, null);
  }

  void _selectAnswer(String answer) {
    setState(() {
      answers1[_currentQuestionIndex] = answer;
      _answerSelected = true;
    });
  }

  void _nextQuestion() {
    if (_answerSelected) {
      if (_currentQuestionIndex < _questions.length - 1) {
        setState(() {
          _currentQuestionIndex++;
          _answerSelected = answers1[_currentQuestionIndex] != null;
        });
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>specifictestpage2() ,
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
        _answerSelected = answers1[_currentQuestionIndex] != null;
      });
    }
  }

  void _showAnswerAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            // side:
            //BorderSide(color: Color(0xffD9D9D9).withOpacity(.69), width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor:
              Color(0xff537F5C).withOpacity(.88), // Match the background color
          content: Container(
            height: 350, // Set the height of the dialog
            width: 320,
            // Set the width of the dialog
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Answer Required!",
                  style: TextStyle(
                      color: Colors.white, // White text color
                      fontSize: 22, // Similar font size
                      //fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                  
                ),
                Image.asset('assets/Answerreqiured.png',width: 140,height: 140,),
              Text(
                  "Please answer the question\nbefore moving to the other\nquestions",
                  style: TextStyle(
                      color: Colors.white, // White text color
                      fontSize: 18, // Similar font size
                      //fontWeight: FontWeight.bold,
                      fontFamily: 'InriaSans-Regular'),
                  textAlign: TextAlign.center,
                ),
                
                SizedBox(height: 20), // Add space between buttons
                SizedBox(
                  height: 45,
                  width: 95, // Set the width of the "Cancel" button
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                          color: Colors.white, width: 1), // White border
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Rounded button
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(
                      "OK",
                      style: TextStyle(
                        color: Colors.white, // White text color
                        fontSize: 16, // Adjust the font size
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


  void _showQuitConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            // side:
            //BorderSide(color: Color(0xffD9D9D9).withOpacity(.69), width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor:
              Color(0xff537F5C).withOpacity(.88), // Match the background color
          content: Container(
            height: 350, // Set the height of the dialog
            width: 320,
            // Set the width of the dialog
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 60,
                ),
                Text(
                  "Are you sure\n you want to Quit the \ntest?",
                  style: TextStyle(
                      color: Colors.white, // White text color
                      fontSize: 22, // Similar font size
                      //fontWeight: FontWeight.bold,
                      fontFamily: 'InriaSans-Regular'),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20), // Add space between text and buttons
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
                      backgroundColor: Color(0xffA71C1C)
                          .withOpacity(.88), // Red color for "Quit"
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Rounded button
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(
                      "Quit",
                      style: TextStyle(
                          color: Colors.white, // White text color
                          fontSize: 22, // Adjust the font size
                          fontFamily: 'InriaSans-Bold'),
                    ),
                  ),
                ),
                SizedBox(height: 20), // Add space between buttons
                SizedBox(
                  width: 200, // Set the width of the "Cancel" button
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                          color: Colors.white, width: 2), // White border
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Rounded button
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(_questions.length, (index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 3.0),
            width: 14,
            height: 9.8,
            decoration: BoxDecoration(
              border: Border.all(
                  color: Color(0xffD9D9D9).withOpacity(.60), width: 0.9),
              color: index == _currentQuestionIndex
                  ? Colors.white
                  : Color(0xffD9D9D9).withOpacity(.20),
              borderRadius: BorderRadius.all(Radius.elliptical(16, 10)),
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff537F5C),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40), // Space from the top of the screen
            _buildProgressIndicator(),
            // Progress indicator at the top
            SizedBox(
              height: 80,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 430,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Color(0xff5B8864),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(.20),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(3, 3), // Shadow position
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _questions[_currentQuestionIndex],
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      //SizedBox(height: 40),
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
                        height: 47,
                        width: 220,
                        child: ElevatedButton(
                          onPressed: () {
                            _selectAnswer("Yes");
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFB7B597),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 40),
                          ),
                          child: Center(
                            child: Text(
                              "Seldom",
                              style: TextStyle(
                                  color: Color(0xFF3E1904),
                                  fontFamily: 'Inter',
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
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
                        height: 47,
                        width: 220,
                        child: ElevatedButton(
                          onPressed: () {
                            _selectAnswer("Somtimes");
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFB7B597),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 40),
                          ),
                          child: Center(
                            child: Text(
                              "Sometimes",
                              style: TextStyle(
                                  color: Color(0xFF3E1904),
                                  fontFamily: 'Inter',
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
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
                        height: 47,
                        width: 220,
                        child: ElevatedButton(
                          onPressed: () {
                            _selectAnswer("Usually");
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFB7B597),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 40),
                          ),
                          child: Center(
                            child: Text(
                              "Usually",
                              style: TextStyle(
                                  color: Color(0xFF3E1904),
                                  fontFamily: 'Inter',
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
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
                        height: 47,
                        width: 220,
                        child: ElevatedButton(
                          onPressed: () {
                            _selectAnswer("Most-Often");
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFB7B597),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 40),
                          ),
                          child: Center(
                            child: Text(
                              "Most-often",
                              style: TextStyle(
                                  color: Color(0xFF3E1904),
                                  fontFamily: 'Inter',
                                  fontSize: 22,
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
            SizedBox(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                        offset: Offset(0, 2), // Offset the shadow vertically
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    color: Color(0xFF537F5C), // Set the color of the arrow icon
                    onPressed: _previousQuestion,
                    iconSize: 25.0, // Adjust the size of the icon
                    padding: EdgeInsets.only(
                        left: 7), // Adjust padding around the icon
                    splashRadius: 25.0, // Adjust the splash radius on click
                    tooltip: "Next",
                  ),
                ),
                SizedBox(
                  width: 110,
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
                        offset: Offset(0, 2), // Offset the shadow vertically
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    color: Color(0xFF537F5C), // Set the color of the arrow icon
                    onPressed: _nextQuestion,
                    iconSize: 25.0, // Adjust the size of the icon
                    padding:
                        EdgeInsets.all(3.0), // Adjust padding around the icon
                    splashRadius: 25.0, // Adjust the splash radius on click
                    tooltip: "Next",
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            _buildQuitButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildQuitButton() {
    return Container(
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
          backgroundColor: Color(0xff618969),
          shadowColor: const Color(0xff537F5C),
          alignment: Alignment.center,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: _showQuitConfirmationDialog,
        child: Text(
          'Quit test',
          style: TextStyle(
            color: Color(0xffD9D9D9),
            fontSize: 22,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
