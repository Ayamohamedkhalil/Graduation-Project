import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:splash_onboarding_test/Registeration/forgetpassword.dart';
import 'package:splash_onboarding_test/Registeration/registeration.dart';
import 'dart:convert';
import 'package:splash_onboarding_test/home.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? email;
  String? password;
  GlobalKey<FormState> formstate = GlobalKey();

  // Function to validate email
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }

    String pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';

    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  // Function to validate password
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  // Function to perform login
  Future<void> _login() async {
    final url = Uri.parse(
        'https://gp-backend-production-54ab.up.railway.app/api/login');
    final Map<String, String> requestBody = {
      "email": email!,
      "password": password!
    };

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        final message = responseData['message'];
        final token = responseData['token'];
        final user = responseData['user'];

        print('Message: $message');
        print('Token: $token');
        print('User: ${user['username']}');

        // Navigate to home screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const homescreen()),
        );
      } else {
        print('Failed to login: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF537F5C),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        //iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 320),
            width: 35.0, // Adjust the width of the circle
            height: 35.0, // Adjust the height of the circle
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.80)
                  , // Background color (light green)
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
              icon: Icon(Icons.arrow_back),
              color: Color(0xFF537F5C), // Set the color of the arrow icon
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Registeration(),
                ));
              },
              iconSize: 30.0, // Adjust the size of the icon
              padding: EdgeInsets.all(3.0), // Adjust padding around the icon
              splashRadius: 25.0, // Adjust the splash radius on click
              tooltip: "Next",
            ),
          ),
          
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formstate,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 95),
              const Center(
                child: Text(
                  'Welcome back',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Inter',
                  ),
                ),
              ),
              const SizedBox(height: 55),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onSaved: (val) {
                    email = val;
                  },
                  validator: _validateEmail,
                  cursorColor: Colors.white,
                  decoration: const InputDecoration(
                  
                    hoverColor: Colors.white,
                    prefix: SizedBox(width: 1),
                   // labelText: 'Email',
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontFamily: 'InriaSans-Regular',
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xffD9D9D9)), // Normal border color
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: TextFormField(
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onSaved: (val) {
                    password = val;
                  },
                  validator: _validatePassword,
                  cursorColor: Colors.white,
                  decoration: const InputDecoration(
                    hoverColor: Colors.white,
                    prefix: SizedBox(width:1),
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontFamily: 'InriaSans-Regular',
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(0xffD9D9D9)), // Normal border color
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                child: Container(
                  margin: const EdgeInsets.only(left: 172),
                  child: const Text(
                    'Forgot your password?',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white,

                      //decorationStyle:TextDecorationStyle(boxsize) ,
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'InriaSans-Regular',
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Forgetpassword(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 75),
              Container(
                width: 270,
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
                    backgroundColor: const Color(0xff537F5C),
                    shadowColor: const Color(0xff537F5C),
                    alignment: Alignment.center,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    if (formstate.currentState!.validate()) {
                      formstate.currentState!.save();
                      _login(); // Trigger the login function
                    } else {
                      print('Not Valid');
                    }
                  },
                  child: const Text(
                    'Log in',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontFamily: 'InriaSans-Bold',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
