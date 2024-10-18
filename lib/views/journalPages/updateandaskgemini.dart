import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:splash_onboarding_test/views/ConatctUspage/contactUsPage.dart';

class Updateandaskgemini extends StatefulWidget {
  final String title;
  final String content;
  final String date;
  final String id;

  const Updateandaskgemini({
    super.key,
    required this.title,
    required this.content,
    required this.date,
    required this.id,
  });

  @override
  _Updateandaskgemini createState() => _Updateandaskgemini();
}

class _Updateandaskgemini extends State<Updateandaskgemini> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.title);
    _contentController = TextEditingController(text: widget.content);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  // Enhanced updateJournal function with logging and detailed error handling
  Future<void> _updateJournal() async {
  final String? token = await getToken(); 
  

  const String url = 'https://backend-production-19d7.up.railway.app/api/edit_journal';

  // Log for debugging
  print('Token: $token');
  print('Journal ID: ${widget.id}');
  print('Request Body: ${{
    'id': widget.id,
    'new_title': _titleController.text,
    'new_content': _contentController.text,
  }}');

  try {
    final response = await http.put(
      Uri.parse(url),
      headers: {
        'Authorization': token ?? '',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'id': widget.id,  // Journal ID
        'new_title': _titleController.text,
        'new_content': _contentController.text,
      }),
    );

    // Check the response status and body for debugging
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      String message = responseData['message'] ?? 'Journal updated successfully!';

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    } else {
      // Improved error handling
      final Map<String, dynamic> errorResponse = jsonDecode(response.body);
      String errorMessage = errorResponse['error'] ?? 'An error occurred';

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update the journal: $errorMessage')),
      );
    }
  } catch (e) {
    print('Error: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('An error occurred. Please try again.')),
    );
  }
}

  // Dialog for confirming the journal update
  void _confirmUpdate() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Update'),
          content: const Text('Are you sure you want to update this journal entry?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _updateJournal(); // Proceed with the update
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> askGemini() async {
    final String? token = await getToken(); // Assuming token is retrieved here
    

    const String url = 'https://backend-production-19d7.up.railway.app/api/ask-gemini';

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Authorization': token ??'',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'prompt': _contentController.text,
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      String responseText = responseData['response'] ?? '';
      responseText = responseText.replaceAll('*', '');  // Remove all asterisks
      showResponseBottomSheet(responseText);
    } else {
      showResponseBottomSheet('Failed to get a response. Please try again.');
    }
  }

  // Bottom sheet for showing Gemini's response
  void showResponseBottomSheet(String response) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.4,
          minChildSize: 0.2,
          maxChildSize: 0.8,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/geminilogo.png',  // Ensure this path is correct for your image
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      response,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF537F5C),
      appBar: AppBar(
        backgroundColor: const Color(0xFF537F5C),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xffD9D9D9)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: IconButton(
              icon: Image.asset(
                'assets/gemini.png',
                width: 25,
                height: 25,
              ),
              onPressed: () {
                askGemini();
              },
            ),
          ),
          IconButton(
            icon: const Icon(Icons.check, color: Color(0xffD9D9D9)),
            onPressed: () {
              _confirmUpdate();  // Trigger the confirmation dialog
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.date,
              style: const TextStyle(
                color: Colors.white60,
                fontSize: 16,
                fontFamily: 'Inter',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _titleController,
              style: const TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontFamily: 'Ledger',
              ),
              decoration: const InputDecoration(
                hintText: 'Title...',
                hintStyle: TextStyle(
                  color: Color(0xFFD9D9D9),
                  fontSize: 26,
                  fontFamily: 'Ledger',
                ),
                border: InputBorder.none,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                  color: const Color(0xFFB7B597).withOpacity(.80),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: TextField(
                  controller: _contentController,
                  maxLines: null,
                  expands: true,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Ledger',
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Start writing...',
                    hintStyle: TextStyle(
                      color: Color(0xFFD9D9D9),
                      fontSize: 20,
                      fontFamily: 'Ledger',
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Dummy getToken function; implement your actual token retrieval logic

