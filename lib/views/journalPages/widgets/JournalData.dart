import 'package:flutter/material.dart';

class JournalData extends StatelessWidget {
  final String title;
  final String date;

  const JournalData({super.key, required this.title, required this.date});

  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
        Container(
            // padding: EdgeInsets.symmetric(vertical: 10),
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
            )),
      ],
    );
  }
}
