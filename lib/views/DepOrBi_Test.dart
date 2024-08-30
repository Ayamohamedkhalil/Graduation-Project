import 'package:flutter/material.dart';
import 'package:splash_onboarding_test/views/deporbitest.dart';

class DeporbiTest extends StatelessWidget {
  const DeporbiTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(158, 158, 158, 41),
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
                      'assets/image1.png',
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
                          "Depression\nOr\nBipolar",
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
                          "The Test contains around 10\n"
                          "essential symptoms psychiatrists\n"
                          "use to diagnose the described\n"
                          "disorders .",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
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
                  builder: (context) =>Specifictest(),
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
