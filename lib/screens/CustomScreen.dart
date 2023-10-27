import 'package:flutter/material.dart';

class CustomScreen extends StatelessWidget {
  final String imagePath;
  final String text;

  CustomScreen({required this.imagePath, required this.text});
  @override
  Widget build(BuildContext context) {
    return ListView();
  }

  Text CreateTitle(
    String desiredText,
  ) {
    Text subtitle = Text(
      desiredText,
      style: TextStyle(
        color: Colors.white,
        fontSize: 40,
        fontFamily: 'Impact',
        fontWeight: FontWeight.bold,
        letterSpacing: 2.0,
        shadows: [
          Shadow(
            color: Colors.black,
            offset: Offset(2, 2),
            blurRadius: 5,
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
    return subtitle;
  }

  Text CreateSubtitle(String desiredText,
      [double? fontsize = 40, Color color = Colors.white]) {
    Text subtitle = Text(
      desiredText,
      style: TextStyle(
        color: Colors.white,
        fontSize: fontsize,
        fontFamily: 'Impact',
        fontWeight: FontWeight.bold,
        letterSpacing: 2.0,
        shadows: [
          Shadow(
            color: Colors.black,
            offset: Offset(2, 2),
            blurRadius: 5,
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
    return subtitle;
  }
}
