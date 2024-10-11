import 'package:flutter/material.dart';
import 'package:splash_onboarding_test/constant/Colors.dart';
import 'package:splash_onboarding_test/views/journalPages/updateandaskgemini.dart';
// Import the page where details are shown

class JournalYearData extends StatelessWidget {
  final String title;
  final String date;
  final String content; // Add content field

  const JournalYearData({
    super.key,
    required this.title,
    required this.date,
    required this.content, // Add content field as required
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: PriamryColor)),
        borderRadius: BorderRadius.circular(7),
        color: const Color(0xffD9D9D9),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
        subtitle: Text(date),
        onTap: () {
          // Navigate to the Updateandaskgemini page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Updateandaskgemini(
                title: title,
                content: content, // Pass content to the page
                date: date,
              ),
            ),
          );
        },
      ),
    );
  }
}
