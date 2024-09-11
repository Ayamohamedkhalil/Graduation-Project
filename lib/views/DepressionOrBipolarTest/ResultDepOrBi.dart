import 'package:flutter/material.dart';
import 'package:splash_onboarding_test/views/DepressionOrBipolarTest/Result2DepOrBi.dart';

class Result1DepORBi extends StatelessWidget {
  final String result;

  const Result1DepORBi({super.key, required this.result});
  
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
                  'The Result of DEPRESSION or Bipolar Test',
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
                      'assets/image1.png',
                      width: 200,
                      height: 200,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey,
                          width: 200,
                          height: 200,
                          child: Center(
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
              style: TextStyle(
                color: const Color(0xffD9D9D9),
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
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Result2DepOrBi(result: result),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
