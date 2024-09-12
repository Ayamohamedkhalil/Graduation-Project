import 'package:flutter/material.dart';
import 'package:splash_onboarding_test/constant/Colors.dart';

class JournalYearData extends StatelessWidget {
  final String title;
  final String date;

  JournalYearData({required this.title, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: PriamryColor)),
        color: const Color(0xffD9D9D9),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
        subtitle: Text(date),
        onTap: () {
          // Handle journal entry tap
        },
      ),
    );
  }
}
