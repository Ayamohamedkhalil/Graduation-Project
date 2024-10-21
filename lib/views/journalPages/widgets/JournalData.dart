import 'package:flutter/material.dart';
import 'package:splash_onboarding_test/views/journalPages/updateandaskgemini.dart';

class JournalData extends StatelessWidget {
  final String id; // Add id field
  final String title;
  final String date;
  final String content;

  const JournalData({
    super.key,
    required this.id,
    required this.title,
    required this.date,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("ID=================================================$id ");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Updateandaskgemini(
              id: id, // Pass id to Updateandaskgemini
              title: title,
              content: content,
              date: date,
            ),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            height: 50,
            width: 320,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xffD9D9D9),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    date,
                    style: const TextStyle(
                        fontSize: 13, color: Color.fromARGB(255, 51, 51, 51)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
