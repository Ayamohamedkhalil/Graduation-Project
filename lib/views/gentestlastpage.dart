import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:splash_onboarding_test/views/result1.dart';

class SubmitPage extends StatelessWidget {
  final List<String?> answers;

  const SubmitPage({Key? key, required this.answers}) : super(key: key);

  Future<void> _submitAnswers(BuildContext context) async {
    final url = Uri.parse('https://ml-models-production-90be.up.railway.app/generalPredict');

    // Convert answers to a list of maps
    final payload = jsonEncode({
      'data': List.generate(
        answers.length,
        (index) => {
          'question': 'Question ${index + 1}',
          'answer': answers[index] ?? 'Unknown',
        },
      )
    });

    print('Payload: $payload'); // Debugging output

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: payload,
      );

      print('Response Status Code: ${response.statusCode}'); // Debugging output
      print('Response Body: ${response.body}'); // Debugging output

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        if (responseData is Map<String, dynamic>) {
          final result = responseData.values.first ?? 'Unknown';

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Result1(result: result),
            ),
          );
        } else {
          throw Exception('Unexpected response format');
        }
      } else {
        throw Exception('Failed to submit answers');
      }
    } catch (e) {
      print('Error: $e'); // Debugging output
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff537F5C),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "     You've answered all the\n questions! Are you sure you\n         want to submit your\n                  answers?",
                style: TextStyle(
                  color: Colors.white.withOpacity(.80),
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Image.asset(
              'assets/submitpage.png',
              height: 300,
              width: 320,
            ),
            const SizedBox(height: 20),
            _buildButton(
              context,
              'Submit',
              () => _submitAnswers(context),
            ),
            const SizedBox(height: 15),
            _buildButton(
              context,
              'Go Back',
              () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String label, VoidCallback onPressed) {
    return Container(
      width: 180,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.white),
        borderRadius: BorderRadius.circular(20),
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
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
            color: const Color(0xffD9D9D9),
            fontSize: 20,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
