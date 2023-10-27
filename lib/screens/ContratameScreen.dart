import 'package:tarea6/screens/CustomScreen.dart';
import 'package:flutter/material.dart';

class ContratameScreen extends CustomScreen {
  final String imagePath;
  final String text;

  ContratameScreen({required this.imagePath, required this.text})
      : super(imagePath: '', text: '');

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Center(
          child: Container(
            margin: EdgeInsets.only(
                top: 50, bottom: 30), // Adjust the top margin as needed
            child: CreateTitle(text),
          ),
        ),
        Container(
          // Adjust the height as needed
          child: Column(children: <Widget>[
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/fotomia.png'),
                  )
                ]),
            Container(
              margin: EdgeInsets.only(
                  top: 30, bottom: 30), // Adjust the top margin as needed
              child: Text(
                'Mi nombre es Hipolito Perez, soy apasionado del desarrollo de software, me especializo en Automatizacion y desarrollo backend, comunicate conmigo utilizando este correo: hipolitoprz2001@gmail.com',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Impact',
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
          ]),
        ),
      ],
    );
  }
}
