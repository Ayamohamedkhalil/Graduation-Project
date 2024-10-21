import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:splash_onboarding_test/Registeration/login.dart';
import 'package:splash_onboarding_test/views/ConatctUspage/contactUsPage.dart';
import 'package:splash_onboarding_test/views/accountsetting.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _changePassword() async {
    final String? token = await getToken();
    // API endpoint
    const url =
        'https://backend-production-19d7.up.railway.app/api/changePassword';

    // Prepare the request data
    final body = {
      'current_password': oldPasswordController.text,
      'new_password': newPasswordController.text,
      'confirm_password': confirmPasswordController.text,
    };

    // Make the PUT request with authorization header
    final response = await http.put(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': token ?? '',
      },
      body: jsonEncode(body),
    );

    // Handle the response
    if (response.statusCode == 200) {
      // Success response
      final responseData = jsonDecode(response.body);
      if (responseData['message'] == 'Password updated successfully!') {
        _showSuccessDialog();
      }
    } else {
      // Error handling
      final responseData = jsonDecode(response.body);
      if (response.statusCode == 400 &&
          responseData['error'] == 'Current password is incorrect.') {
        _showErrorDialog('Current password is incorrect.');
      } else if (responseData['error'] == 'Current password is required.') {
        _showErrorDialog('Current password is required.');
      } else if (responseData['error'] == 'Passwords do not match') {
        _showErrorDialog('Passwords do not match.');
      }
    }
  }

  // Success dialog
  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
         backgroundColor: Color(0xff537F5C),
          content: const Text('Password updated successfully!',style: TextStyle(color: Colors.white),),
          actions: <Widget>[
            TextButton(
              child: const Text('OK',style: TextStyle(color: Colors.white),),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                // Navigate to Login after the dialog is closed
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              },
            ),
          ],
        );
      },
    );
  }

  // Error dialog
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          
         backgroundColor: Color(0xff537F5C),
         
          content: Text(message,style: TextStyle(color: Colors.white),),
          actions: <Widget>[
            TextButton(
              child: const Text('OK',style: TextStyle(color: Colors.white),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  String? _validateOldPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your old password';
    }
    return null;
  }

  String? _validateNewPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a new password';
    }
    String pattern =
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Password must be at least 8 characters long, include uppercase, lowercase letters, a number, and a special character';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your new password';
    }
    if (value != newPasswordController.text) {
      return 'Passwords do not match';
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
          margin: const EdgeInsets.only(left: 22),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: const Color(0xFF537F5C),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Accountsetting(),
                ),
              );
            },
            iconSize: 25.0,
            splashRadius: 25.0,
            tooltip: "Back",
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 20),
              _buildPasswordField(
                  'Old Password', oldPasswordController, _validateOldPassword),
              const SizedBox(height: 20),
              _buildPasswordField(
                  'New Password', newPasswordController, _validateNewPassword),
              const SizedBox(height: 20),
              _buildPasswordField('Confirm Password', confirmPasswordController,
                  _validateConfirmPassword),
              const SizedBox(height: 60),
              _buildSaveButton(),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build password fields
  Padding _buildPasswordField(String hint, TextEditingController controller,
      String? Function(String?) validator) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        controller: controller,
        obscureText: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white70, fontSize: 16),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffD9D9D9))),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
        ),
      ),
    );
  }

  // Save button
  Container _buildSaveButton() {
    return Container(
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
              offset: const Offset(0, 4))
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff537F5C),
          shadowColor: const Color(0xff537F5C),
          alignment: Alignment.center,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            await _changePassword();
          }
        },
        child: const Text(
          'Save',
          style: TextStyle(
              fontSize: 28, color: Colors.white, fontFamily: 'InriaSans-Bold'),
        ),
      ),
    );
  }
}
