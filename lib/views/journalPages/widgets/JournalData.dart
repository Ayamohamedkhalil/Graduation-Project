import 'package:flutter/material.dart';

class JournalData extends StatelessWidget {
  final String title;
  final String date;

  JournalData({required this.title, required this.date});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
         // padding: EdgeInsets.symmetric(vertical: 10),
          height: 60,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xffD9D9D9),
          ),
          child: ListTile(
            title: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            visualDensity: const VisualDensity(horizontal: 0, vertical: -4.0),
            subtitle: Text(date),
            onTap: () {
              // Handle journal entry tap
            },
          ),
        ),
       
      ],
    );
  }
}
