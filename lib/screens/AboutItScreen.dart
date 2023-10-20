import 'package:Gintama_The_Very_Final/screens/CustomScreen.dart';
import 'package:flutter/material.dart';

class AboutItScreen extends CustomScreen {
  final String imagePath;
  final String text;

  AboutItScreen({required this.imagePath, required this.text})
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
            Image.asset(
              'assets/gintama_logo.jpg',
              height: 250,
              fit: BoxFit.contain,
              alignment: Alignment.bottomCenter,
            ),
            Container(
              margin: EdgeInsets.only(
                  top: 30, bottom: 30), // Adjust the top margin as needed
              child: Text(
                'Gintama es una serie de manga escrita e ilustrada por Hideaki Sorachi. Su adaptación a serie de anime fue dirigida por Shinji Takamatsu desde el episodio uno hasta el ciento cinco y por Yōichi Fujita desde el episodio cien en adelante. La obra tiene lugar en Edo —antiguo nombre que recibía la ciudad de Tokio—, la cual ha sido conquistada por unos extraños seres alienígenas llamados «Amanto». El manga narra las aventuras de un samurái conocido como Gintoki Sakata, quien trabaja de forma independiente junto a sus amigos Shinpachi Shimura y Kagura.',
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
