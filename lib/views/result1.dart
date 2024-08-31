import 'package:flutter/material.dart';

class Result1 extends StatelessWidget {
  Result1({super.key});

  final String UserImage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff537F5C),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
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
            SizedBox(
              height: 40,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: UserImage == ""
                  ? Container(
                      color: Colors.grey,
                      width: 200,
                      height: 200,
                    )
                  : Image.asset(
                      UserImage,
                      width: 200,
                      height: 200,
                    ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Based on your test results, you have been\ndiagnosed with a mental health condition\n                         identified as: ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Ledger-Regular',
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'ADHD',
              style: TextStyle(
                color: Color(0xffD9D9D9),
                fontSize: 37,
                fontFamily: 'Ledger-Regular',
              ),
            ),
            SizedBox(
              height: 85,
            ),
            Stack(
              children: [
                Image.asset('assets/Rectangle.png'),
                Positioned(
                  right: 62,
                  bottom: 29,
              
                  child: Center(
                    child: TextButton(
                      child: Text(
                        'Go to next page >',
                        style: TextStyle(
                          fontFamily: 'InriaSans-Regular',
                          fontSize: 30, // Adjust the font size as needed
                          // Make the text bold if needed
                          color: Color(
                              0xff537F5C), // Use a contrasting color to the image
                          // Adjust letter spacing to match the design
                        ),
                      ),
                      onPressed: (){

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
