import 'package:flutter/material.dart';
import 'package:splash_onboarding_test/home.dart';
import 'package:splash_onboarding_test/views/gentestlastpage.dart';

class Generaltest extends StatefulWidget {
  const Generaltest({super.key});

  @override
  _Generaltest createState() => _Generaltest();
}

class _Generaltest extends State<Generaltest> {
  int _currentQuestionIndex = 0;
  bool _answerSelected = false;
  String _selectedAnswer = "";

  final List<String> _questions = [
    "Do you often feel nervous or on edge without a clear reason?",
    "Have you ever felt sudden, intense fear or panic without any warning?",
    "Do you find yourself breathing quickly, especially when others might not be?",
    "Do you sweat a lot, even when it’s s not hot or physically challenging?",
    " Do you have difficulty focusing on tasks, even if they’re re usually easy for you?",
    "Do you often struggle to fall asleep, stay asleep, or wake up too early?",
    "Has your work or school performance dropped because of problems with focus, motivation, or energy",
    " Do you often feel like things will never get better?",
    "Do you get angry easily or have trouble controlling your temper?",
    "Do you often react too strongly to situations that others might handle calmly?",
    "Have your eating habits changed a lot, like eating much more or much less than usual?",
    "Have you thought about ending your life or harming yourself?",
    "Do you often feel tired, even if you’ve had enough sleep?",
    "Do you lack a close friend or someone to share your thoughts and feelings with?",
    "Do you spend so much time on social media that it interferes with your daily life?",
    "Have you recently gained weight for no clear reason?",
    "Do you usually prefer being alone or with small groups rather than in large gatherings?",
    "Do upsetting memories or flashbacks suddenly come to mind?",
    "Do you often have nightmares or disturbing dreams?",
    "Do you avoid certain people, places, or activities because they make you anxious or uncomfortable?",
    "Do you often feel negative about yourself or your life?",
    "Do you have a hard time focusing, even when you try to?",
    "Do you often blame yourself when things go wrong, even if it is not your fault?",
    "Have you seen, heard, or felt things that others don't?",
    "Do you do certain things over and over again, feeling like you have to?",
    "Does your mood or energy level change a lot with the seasons?",
    "Have you experienced times when you have much more energy or activity than usual?"
    // Add more questions here...
  ];
  List<String?> generLanswers = [];

  @override
  void initState() {
    super.initState();
    generLanswers = List<String?>.filled(_questions.length, null);
  }

  void _selectAnswer(String answer) {
    setState(() {
      _selectedAnswer = answer;
      generLanswers[_currentQuestionIndex] = answer;
      _answerSelected = true;
    });
  }

  void _nextQuestion() {
    if (_answerSelected) {
      if (_currentQuestionIndex < _questions.length - 1) {
        setState(() {
          _currentQuestionIndex++;
          _selectedAnswer = ""; // إعادة تعيين الإجابة المختارة
          _answerSelected = generLanswers[_currentQuestionIndex] != null;
        });
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SubmitPage(answers: generLanswers),
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
        _answerSelected = generLanswers[_currentQuestionIndex] != null;
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
                  height: 20,
                ),
                const Text(
                  "Answer Required!",
                  style: TextStyle(
                      color: Colors.white, // White text color
                      fontSize: 22, // Similar font size
                      //fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Image.asset(
                  'assets/Answerreqiured.png',
                  width: 140,
                  height: 140,
                ),
                const Text(
                  "Please answer the question\nbefore moving to the other\nquestions",
                  style: TextStyle(
                      color: Colors.white, // White text color
                      fontSize: 18, // Similar font size
                      //fontWeight: FontWeight.bold,
                      fontFamily: 'InriaSans-Regular'),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 20), // Add space between buttons
                SizedBox(
                  height: 45,
                  width: 95, // Set the width of the "Cancel" button
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                          color: Colors.white, width: 1), // White border
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Rounded button
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text(
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(_questions.length, (index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 3.0),
            width: 14,
            height: 9.8,
            decoration: BoxDecoration(
              border: Border.all(
                  color: const Color(0xffD9D9D9).withOpacity(.60), width: 0.9),
              color: index == _currentQuestionIndex
                  ? Colors.white
                  : const Color(0xffD9D9D9).withOpacity(.20),
              borderRadius: const BorderRadius.all(Radius.elliptical(16, 10)),
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff537F5C),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 40), // Space from the top of the screen
            _buildProgressIndicator(),
            // Progress indicator at the top
            const SizedBox(
              height: 80,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 430,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: const Color(0xff5B8864),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(.20),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: const Offset(3, 3), // Shadow position
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _questions[_currentQuestionIndex],
                        style: const TextStyle(
                          fontSize: 23,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
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
                        height: 47,
                        width: 220,
                        child: ElevatedButton(
                          onPressed: () {
                            _selectAnswer("YES");
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _selectedAnswer == "YES"
                                ? Color(0xff666556)
                                : const Color(0xFFB7B597),
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
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
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
                            _selectAnswer("NO");
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _selectedAnswer == "NO"
                                ? Color(0xff666556)
                                : const Color(0xFFB7B597),
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
            const SizedBox(height: 30),
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
                        offset:
                            const Offset(0, 2), // Offset the shadow vertically
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    color: const Color(
                        0xFF537F5C), // Set the color of the arrow icon
                    onPressed: _previousQuestion,
                    iconSize: 25.0, // Adjust the size of the icon
                    padding: const EdgeInsets.only(
                        left: 7), // Adjust padding around the icon
                    splashRadius: 25.0, // Adjust the splash radius on click
                    tooltip: "Next",
                  ),
                ),
                const SizedBox(
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
                        offset:
                            const Offset(0, 2), // Offset the shadow vertically
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios),
                    color: const Color(
                        0xFF537F5C), // Set the color of the arrow icon
                    onPressed: _nextQuestion,
                    iconSize: 25.0, // Adjust the size of the icon
                    padding: const EdgeInsets.all(
                        3.0), // Adjust padding around the icon
                    splashRadius: 25.0, // Adjust the splash radius on click
                    tooltip: "Next",
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            buildQuitButton(),
          ],
        ),
      ),
    );
  }

  Widget buildQuitButton() {
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
          backgroundColor: const Color(0xff618969),
          shadowColor: const Color(0xff537F5C),
          alignment: Alignment.center,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: _showQuitConfirmationDialog,
        child: const Text(
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
