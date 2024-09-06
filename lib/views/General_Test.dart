import 'package:flutter/material.dart';
import 'package:splash_onboarding_test/views/generaltest.dart';

class General_test extends StatelessWidget {
  const General_test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.80),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 690,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/6.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 80),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.20),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SizedBox(
                    height: 500,
                    width: 270,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 35,
                        ),
                        Text(
                          "General Test",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xffC8E3CE),
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'InriaSans'),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Text(
                          "This test includes various symptoms for a\n"
                          "range of mental disorders, such as ADHD, OCD, PTSD, and more\n"
                          "we know, identifying these disorders is crucial\n"
                          "for improving the quality of life for many individuals .",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontFamily: 'InriaSans'),
                        ),
                        //SizedBox(height: 80,), // This will push the button to the bottom of the container
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 27,
                left: 20,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 13,
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Generaltest(),
                ),
              );
            },
            child: Text(
              "Let's get started >",
              style: TextStyle(
                  color: Color(0xff537F5C),
                  fontSize: 32,
                  //fontWeight: FontWeight.bold,
                  fontFamily: 'InriaSans'),
            ),
          ),
        ],
      ),
    );
  }
}
