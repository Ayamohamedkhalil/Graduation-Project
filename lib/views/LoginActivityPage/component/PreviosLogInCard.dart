import 'package:flutter/material.dart';


class Previoslogincard extends StatelessWidget {
  const Previoslogincard(
      {super.key,
      required this.LoginClock,
      required this.LoginDevice,
      required this.LoginDate});

  final String LoginClock;
  final String LoginDevice;
  final String LoginDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              LoginDate,
              style: const TextStyle(
                  color: Colors.white, fontSize: 14, fontFamily: "Inter"),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              LoginDevice,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              LoginClock,
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontFamily: "Inter",
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
