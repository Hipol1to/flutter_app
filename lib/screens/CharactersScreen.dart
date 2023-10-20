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
          child: Column(children: <Widget>[
            Image.asset(
              'assets/characters/gintoki.jpg',
              height: 280,
              fit: BoxFit.contain,
              alignment: Alignment.bottomCenter,
            ),
            CreateSubtitle('Sakata Gintoki', 30),
            Container(
                margin: EdgeInsets.only(
                    top: 10, bottom: 20), // Adjust the top margin as needed
                child: Text(
                  'Gintoki Sakata es el protagonista principal de la serie Gintama . Es el fundador y presidente de Yorozuya , además de un samurái altamente calificado, que luchó en la Guerra Joui en el pasado. Durante la guerra, se hizo conocido como Shiroyasha (que literalmente significa "Demonio blanco") debido a su poderosa habilidad con la espada, apariencia demoníaca, ropa blanca y cabello plateado.',
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
                ))
          ]),
        ),
        Container(
          // Adjust the height as needed
          child: Column(children: <Widget>[
            Image.asset(
              'assets/characters/shinpachi.jpg',
              height: 280,
              fit: BoxFit.contain,
              alignment: Alignment.bottomCenter,
            ),
            CreateSubtitle('Shimura Shinpachi', 30),
            Container(
                margin: EdgeInsets.only(
                    top: 10, bottom: 20), // Adjust the top margin as needed
                child: Text(
                  'Shinpachi Shimura es miembro de los Yorozuya , un samurái en formación y uno de los tres protagonistas principales de Gintama. Es uno de los personajes más normales de la serie, y ofrece las comprobaciones de la realidad necesarias o los chistes contra las travesuras de otros personajes. Además de trabajar en Yorozuya, Shinpachi también es el líder del club de fans de Terakado Tsuu : los Guardias Imperiales de Terakado Tsuu.',
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
                ))
          ]),
        ),
        Container(
          // Adjust the height as needed
          child: Column(children: <Widget>[
            Image.asset(
              'assets/characters/kagura.jpg',
              height: 280,
              fit: BoxFit.contain,
              alignment: Alignment.bottomCenter,
            ),
            CreateSubtitle('Kagura', 30),
            Container(
                margin: EdgeInsets.only(
                    top: 10, bottom: 20), // Adjust the top margin as needed
                child: Text(
                  'Kagura es miembro de Yorozuya y la principal protagonista femenina de Gintama. Es miembro de la Tribu Yato, hija de Umibouzu y Kouka , y hermana menor de Kamui , uno de los principales antagonistas de la serie de Gintama.',
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
                ))
          ]),
        ),
      ],
    );
  }
}
