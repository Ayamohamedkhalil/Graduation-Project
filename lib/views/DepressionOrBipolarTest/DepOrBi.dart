import 'package:flutter/material.dart';
import 'package:splash_onboarding_test/views/DepressionOrBipolarTest/DepOrBilastpage.dart';
import 'package:splash_onboarding_test/views/models/question.dart';
import 'package:splash_onboarding_test/views/widgets/custom_widgets.dart';
import 'package:splash_onboarding_test/views/widgets/navigateor.dart';

class Deporbi extends StatefulWidget {
  const Deporbi({super.key});

  @override
  _Deporbi createState() => _Deporbi();
}

class _Deporbi extends State<Deporbi> {
  int _currentQuestionIndex = 0;
  String? _selectedAnswer;

  final List<Question> _questions = [
    Question(
      questionText:
          "I usually experience Mood Swings",
      possibleAnswers: [
        "YES",
        "NO",
        
      ],
    ),
    Question(
      questionText:
          "On a scale of 1 to 10, how often do you find yourself optimistic",
      possibleAnswers: [
        "1",
        "2",
        "3",
        "4",
        "5",
        "6",
        "7",
        "8",
        "9",
        "10",
      ],
    ),
    Question(
      questionText:
          "I feel an unstoppable wave of sadness:",
      possibleAnswers: [
        "Seldom",
        "Someties",
        "Usually",
        "Most-often"
      ],
    ),
    Question(
      questionText:
          "On a scale of 1 to 10, how sexually active do you usually find yourself",
      possibleAnswers: [
        "1",
        "2",
        "3",
        "4",
        "5",
        "6",
        "7",
        "8",
        "9",
        "10",
      ],
    ),
    Question(
      questionText:
          "I feel euphoric",
      possibleAnswers: [
         "Seldom",
        "Someties",
        "Usually",
        "Most-often"
      ],
    ),
      Question(
      questionText:
          "I experience a lot of nervous breakdowns",
      possibleAnswers: [
        "YES",
        "NO",
        
      ],
    ),
     Question(
      questionText:
          "How often do you feel drained?",
      possibleAnswers: [
         "Seldom",
        "Someties",
        "Usually",
        "Most-often"
      ],
    ),
     Question(
      questionText:
          "I’ve suicidal thoughts and can be easily triggered",
      possibleAnswers: [
        "YES",
        "NO",
        
      ],
    ),
    Question(
      questionText:
          "On a scale of 1 to 10, rank your attention span/concentration",
      possibleAnswers: [
        "1",
        "2",
        "3",
        "4",
        "5",
        "6",
        "7",
        "8",
        "9",
        "10",
      ],
    ),
    
     Question(
      questionText:
          "I usually find myself deep in the pit of overthinking",
      possibleAnswers: [
        "YES",
        "NO",
        
      ],
    ),
  ];

  List<String?> _generalAnswers = [];

  @override
  void initState() {
    super.initState();
    _generalAnswers = List<String?>.filled(_questions.length, null);
  }

  void _selectAnswer(String answer) {
    setState(() {
      _selectedAnswer = answer;
      _generalAnswers[_currentQuestionIndex] = answer;
    });
    // _nextQuestion(); // Automatically move to the next question
  }

  void _nextQuestion() {
    if (_selectedAnswer != null) {
      if (_currentQuestionIndex < _questions.length - 1) {
        setState(() {
          _currentQuestionIndex++;
          _selectedAnswer = _generalAnswers[_currentQuestionIndex];
        });
      } else {
        // Navigate to the submit page when questions are completed
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DepoRBiSubmitPage(answers: _generalAnswers),
          ),
        );
      }
    } else {
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
  }

  void _previousQuestion() {
    if (_currentQuestionIndex > 0) {
      setState(() {
        _currentQuestionIndex--;
        _selectedAnswer = _generalAnswers[_currentQuestionIndex];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff537F5C),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 40),
              ProgressIndicatorWidget(
                currentIndex: _currentQuestionIndex,
                totalQuestions: _questions.length,
              ),
              const SizedBox(height: 100),
              Expanded(
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        Container(
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
                                offset: const Offset(3, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _questions[_currentQuestionIndex].questionText,
                                style: const TextStyle(
                                  fontSize: 23,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 40),
                              _buildAnswerOptions(
                                  _questions[_currentQuestionIndex]
                                      .possibleAnswers),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              NavigationButtons(
                onPrevious: _previousQuestion,
                onNext: _nextQuestion,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnswerOptions(List<String> answers) {
    // If less than 4 answers, display them in a row (horizontal)
    if (answers.length <= 4) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: answers.map((answer) {
          return GestureDetector(
            onTap: () => _selectAnswer(answer),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                    _selectedAnswer == answer
                        ? Colors.blueAccent
                        : const Color(0xFFB7B597), // Default color
                  ),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  padding: WidgetStateProperty.all<EdgeInsets>(
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                  ),
                ),
                onPressed: () => _selectAnswer(answer),
                child: Text(
                  answer,
                  style: const TextStyle(
                      color: Color(0xFF3E1904),
                      fontFamily: 'Inter',
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        }).toList(),
      );
    } else {
      // If 4 or more answers, use GridView
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: answers.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          final answer = answers[index];
          return GestureDetector(
            onTap: () => _selectAnswer(answer),
            child: CircleAvatar(
              maxRadius: 25,
              backgroundColor: _selectedAnswer == answer
                  ? Colors.blueAccent
                  : const Color(0xFFB7B597), // Default color
              child: Text(
                answer,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      );
    }
  }
}
