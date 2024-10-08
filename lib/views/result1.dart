import 'package:flutter/material.dart';
import 'package:splash_onboarding_test/views/resultPage2.dart';

class Result1 extends StatelessWidget {
  final String result;

  const Result1({super.key, required this.result});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff537F5C),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 130),
              child: Center(
                child: Text(
                  'The Result of General Test',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'Ledger-Regular',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: result.isEmpty
                  ? Container(
                      color: Colors.grey,
                      width: 200,
                      height: 200,
                    )
                  : Image.asset(
                      'assets/lastupdateofgeneraltest.png', // Adjust this line to match your image paths
                      width: 200,
                      height: 200,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey,
                          width: 200,
                          height: 200,
                          child: const Center(
                            child: Text(
                              'Image Error',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        );
                      },
                    ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Based on your test results, you have been\ndiagnosed with a mental health condition\n                         identified as: ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Ledger-Regular',
              ),
            ),
            const SizedBox(height: 30),
            Text(
              result,
              style: const TextStyle(
                color: Color(0xffD9D9D9),
                fontSize: 37,
                fontFamily: 'Ledger-Regular',
              ),
            ),
            const SizedBox(height: 85),
            Stack(
              children: [
                Image.asset('assets/Rectangle.png'),
                Positioned(
                  right: 62,
                  bottom: 29,
                  child: Center(
                    child: TextButton(
                      child: const Text(
                        'Go to next page >',
                        style: TextStyle(
                          fontFamily: 'InriaSans-Regular',
                          fontSize: 30,
                          color: Color(0xff537F5C),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Resultpage2(diseaseName: result)),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}