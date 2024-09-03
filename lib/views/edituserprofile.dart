import 'package:flutter/material.dart';

//import 'package:splash_onboarding_test/Registeration/registeration.dart';
import 'package:splash_onboarding_test/views/accountsetting.dart';


class Edituserprofile extends StatefulWidget {
  @override
  _Edituserprofile createState() => _Edituserprofile();
}

class _Edituserprofile extends State<Edituserprofile> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
 

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();

    super.dispose();
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

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
      backgroundColor: Color(0xFF537F5C),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 320),
            width: 35.0, // Adjust the width of the circle
            height: 35.0, // Adjust the height of the circle
            decoration: BoxDecoration(
              color: Colors.white
                  .withOpacity(.80), // Background color (light green)
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
              icon: Icon(Icons.arrow_back_ios),
              color: Color(0xFF537F5C), // Set the color of the arrow icon
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Accountsetting(),
                ));
              },
              iconSize: 25.0, // Adjust the size of the icon
              padding: EdgeInsets.symmetric(
                  vertical: 3, horizontal: 9), // Adjust padding around the icon
              splashRadius: 25.0, // Adjust the splash radius on click
              tooltip: "Next",
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              
             
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: TextFormField(
                  controller: nameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: _validateName,
                  cursorColor: Colors.white,
                  decoration: const InputDecoration(
                    hoverColor: Colors.white,
                    prefix: SizedBox(width: 1),
                    // labelText: 'Email',
                    hintText: 'Name',
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
              SizedBox(
                height: 20,
              ),
              Padding(
               padding: const EdgeInsets.symmetric(horizontal: 32),
                child: TextFormField(
                  controller: emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
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
             
              SizedBox(height: 60),
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
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff537F5C),
                    shadowColor: Color(0xff537F5C),
                    alignment: Alignment.center,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      // Gather form data
                     
                    }
                  },
                  child: Text(
                    'Sign-up',
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
