import 'package:Gintama_The_Very_Final/screens/CustomScreen.dart';
import 'package:flutter/material.dart';

class CharactersScreen extends CustomScreen {
  final String imagePath;
  final String text;

  CharactersScreen({required this.imagePath, required this.text})
      : super(imagePath: '', text: '');

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Center(
          child: Container(
              margin: EdgeInsets.only(
                  top: 50, bottom: 30), // Adjust the top margin as needed
              child: CreateTitle(text)),
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
