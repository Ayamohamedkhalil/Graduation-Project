import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:splash_onboarding_test/views/ConatctUspage/contactUsPage.dart'; // For jsonDecode

class Updateandaskgemini extends StatefulWidget {
  final String title;
  final String content;
  final String date;

  const Updateandaskgemini({
    super.key,
    required this.title,
    required this.content,
    required this.date,
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

  Future<void> askGemini() async {
    final String? token = await getToken();
    const String url = 'https://backend-production-19d7.up.railway.app/api/ask-gemini';

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Authorization': token ?? '',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'prompt': _contentController.text,  // Using content as the prompt
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

  void showResponseBottomSheet(String response) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.4,  // Start at 40% of screen height
          minChildSize: 0.2,  // Min height 20%
          maxChildSize: 0.8,  // Max height 80%
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
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
                   // Center(child: Image.asset('assets/geminilogo.png')),
                   /* Text(
                      'Response:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),*/
                    SizedBox(height: 20),
                    Text(
                      response,
                      style: TextStyle(
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
                'assets/gemini.png',  // Use the Gemini icon instead of star
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
             // Trigger the API call when check is pressed
              
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
