import 'package:flutter/material.dart';

class NavigationButtons extends StatelessWidget {
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const NavigationButtons({
    Key? key,
    required this.onPrevious,
    required this.onNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       IconButton(onPressed: onNext, icon: Icon(Icons.arrow_forward_ios)),
       IconButton(onPressed: onPrevious, icon: Icon(Icons.arrow_back_ios)),
      ],
    );
  }
}
