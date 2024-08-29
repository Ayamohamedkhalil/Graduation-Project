import 'package:flutter/material.dart';
import 'package:splash_onboarding_test/views/DepOrBi_Test.dart';
import 'package:splash_onboarding_test/views/General_Test.dart';

class card extends StatelessWidget {
  const card({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
            child: Container(
              height: 320,
              width: 220,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image.png'),
                  // fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 25,
                    left: 25,
                    right: 25,
                    child: Container(
                      height: 100,
                      // width: 60,
                      // padding: EdgeInsets.all(.0),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'Depression\nOr\nBipolar',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xffC8E3CE),
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'InriaSans'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const DeporbiTest()));
            }),
        GestureDetector(
            child: Container(
              height: 320,
              width: 220,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Generaltestupdate.png'),
                  // fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 25,
                    left: 25,
                    right: 25,
                    child: Container(
                      height: 100,
                      // width: 60,
                      // padding: EdgeInsets.all(.0),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'General\nTest',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xffC8E3CE),
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'InriaSans'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const General_test()));
            }),
      ],
    );
  }
}
