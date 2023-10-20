import 'package:Gintama_The_Very_Final/screens/CustomScreen.dart';
import 'package:flutter/material.dart';

class CoverScreen extends CustomScreen {
  final String imagePath;
  final String text;

  CoverScreen({required this.imagePath, required this.text})
      : super(imagePath: '', text: '');

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Center(
          child: Container(
            margin: EdgeInsets.only(
                top: 50, bottom: 30), // Adjust the top margin as needed
            child: Text(
              'Gintama The Very Final',
              style: TextStyle(
                color: Colors.red,
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
            ),
          ),
        ),
        Container(
          // Adjust the height as needed
          child: Image.asset(
            'assets/portadas.jpg',
            fit: BoxFit.contain,
            alignment: Alignment.bottomCenter,
          ),
        ),
      ],
    );
  }
}
