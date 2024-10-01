import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewJournalEntryPage extends StatelessWidget {
  final DateTime currentDate;

  const NewJournalEntryPage({super.key, required this.currentDate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFF537F5C), // Set the green background color
      appBar: AppBar(
        backgroundColor:
            const Color(0xFF537F5C), // Match app bar with the background color
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xffD9D9D9)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check, color: Color(0xffD9D9D9)),
            onPressed: () {
              // Add save functionality here
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display formatted date
            Text(
              '${DateFormat.EEEE().format(currentDate)}  ${DateFormat('d/MM/yyyy').format(currentDate)}',
              style: const TextStyle(
                color: Colors.white60,
                fontSize: 16,
                fontFamily: 'Inter',
              ),
            ),
            // const SizedBox(height: 10),
            // Title input field
            const  TextField(
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontFamily: 'Ledger',
              ),
              decoration: InputDecoration(
                hintText: 'Title...',
                hintStyle: TextStyle(
                  color: Color(0xFFD9D9D9),
                  fontSize: 26,
                  fontFamily: 'Ledger',
                ),
                border: InputBorder.none,
                focusedBorder: InputBorder.none, 
                enabledBorder: InputBorder.none,
              ),
            ),
            // const SizedBox(height: 20),
            // Journal entry input field (multiline)
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                  color: const Color(0xFFB7B597)
                      .withOpacity(.80), // Set light green background
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: const TextField(
                  maxLines: null, // Allow multiple lines
                  expands: true,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Ledger',
                  ),
                  decoration: InputDecoration(
                    hintText: 'start writing...',
                    hintStyle: TextStyle(
                      color: Color(0xFFD9D9D9),
                      fontSize: 20,
                      fontFamily: 'Ledger',
                    ),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none, 
                    enabledBorder: InputBorder.none,
                    disabledBorder:InputBorder.none
                    
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
