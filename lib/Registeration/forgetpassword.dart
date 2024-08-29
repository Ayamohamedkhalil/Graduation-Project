import 'package:flutter/material.dart';
import 'package:splash_onboarding_test/Registeration/verification.dart';

class Forgetpassword extends StatefulWidget {
  Forgetpassword({super.key});

  @override
  State<Forgetpassword> createState() => _ForgetpasswordState();
}

class _ForgetpasswordState extends State<Forgetpassword> {
  String? email;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF537F5C),
      
      appBar: AppBar(
        title: Text(
          'Forget password',
          style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
              fontFamily: 'Inter'),
        ),
        titleSpacing: 40,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formstate,
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              Image.asset(
                'assets/Forget Password.png',
                height: 260,
                width: 300,
              ),
              const SizedBox(height: 20),
              Text(
                'No worries! Just enter your email\naddress below, and we’ll send you\na Verification code to reset your\n                 password.',
                style: TextStyle(
                    color: Colors.white, fontSize: 19, fontFamily: 'Inter'),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onSaved: (val) {
                    email = val;
                  },
                  validator: _validateEmail,
                  cursorColor: Colors.white,
                  decoration: const InputDecoration(
                    hoverColor: Colors.white,
                    prefix: SizedBox(width: 3),
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontFamily: 'InriaSans-Regular',
                    ),
                     enabledBorder:UnderlineInputBorder(
                      borderSide: BorderSide(
                          color:  Color(0xffD9D9D9)), // Normal border color
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  width: 305,
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
                        // _For(); // Trigger the login function
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VerifyEmailScreen()),
                        );
                      }
                    },
                    child: const Text(
                      'Send',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontFamily: 'InriaSans-Bold',
                      ),
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
