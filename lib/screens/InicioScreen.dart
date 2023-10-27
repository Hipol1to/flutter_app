import 'package:tarea6/screens/CustomScreen.dart';
import 'package:flutter/material.dart';

class InicioScreen extends CustomScreen {
  final String imagePath;
  final String text;

  InicioScreen({required this.imagePath, required this.text})
      : super(imagePath: '', text: '');

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Center(
          child: Container(
            margin: EdgeInsets.only(
                top: 50, bottom: 130), // Adjust the top margin as needed
            child: CreateTitle(text),
          ),
        ),
        Container(
          child: Image(
              height: 300,
              image: NetworkImage(
                  "https://cdn-icons-png.flaticon.com/512/538/538161.png")),
        ),
      ],
    );
  }
}
