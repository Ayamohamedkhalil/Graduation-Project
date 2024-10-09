import 'package:flutter/material.dart';


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
          IconButton(
            icon: const Icon(Icons.check, color: Color(0xffD9D9D9)),
            onPressed: () {
              // Handle save action
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
            // Title input field
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
            // Journal entry input field (multiline)
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
