import 'package:flutter/material.dart';

import 'package:splash_onboarding_test/Registeration/registeration.dart';

import 'package:splash_onboarding_test/views/reasonfordeleteaccount.dart';

class confirmpasswordfordeleteaccount extends StatefulWidget {
  confirmpasswordfordeleteaccount({super.key});

  @override
  _confirmpasswordfordeleteaccount createState() =>
      _confirmpasswordfordeleteaccount();
}

class _confirmpasswordfordeleteaccount
    extends State<confirmpasswordfordeleteaccount> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController passwordController = TextEditingController();
  

  @override
  void dispose() {
    passwordController.dispose();
    
    super.dispose();
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }

    // Regular expression for strong password
    String pattern =
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
    RegExp regex = RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return 'Password must be at least 8 characters long,\n include uppercase and lowercase letters,\n a number, and a special character';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF537F5C),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Container(
          // Use leading for the icon on the left
          width: 35.0,
          height: 35.0,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.80),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          margin: const EdgeInsets.only(
              left: 22), // Properly position the icon within the AppBar
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: const Color(0xFF537F5C),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const DeleteAccountScreen()), //this must be modified
              ); // Adjusted for a typical back operation
            },
            iconSize: 25.0,
            splashRadius: 25.0,
            tooltip: "Back",
          ),
        ),
        title: const Text(
          'Confirm password For deleting',
          style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter'),
        ),
        titleSpacing: 30,
        centerTitle: true, // Ensure the title is centered
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 20),
              Image.asset(
                'assets/New-password.png', // Replace with your image path
                height: 270,
                width: 270,
              ),
              const SizedBox(height: 30),
              Text(
                'Please enter your password ',
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.white.withOpacity(.90),
                    fontFamily: 'Inter'),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true, // Hides password input
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: _validatePassword,
                  cursorColor: Colors.white,
                  decoration: const InputDecoration(
                    hoverColor: Colors.white,
                    prefix: SizedBox(width: 1),
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
              const SizedBox(
                height: 20,
              ),
              const SizedBox(height: 60),
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
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Registeration()),
                      );
                    }
                  },
                  child: const Text(
                    'Confirm',
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
