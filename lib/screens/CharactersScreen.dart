import 'package:Gintama_The_Very_Final/screens/CustomScreen.dart';
import 'package:flutter/material.dart';

class CharactersScreen extends CustomScreen {
  CharactersScreen({required super.imagePath, required super.text});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
              top: 50, bottom: 190), // Adjust the top margin as needed
          child: CreateTitle(text),
        ),
        CharacterItem(
          imagePath: 'assets/moment.mp4',
          name: 'Sakata Gintoki',
          description:
              'Gintoki Sakata es el protagonista principal de la serie Gintama . Es el fundador y presidente de Yorozuya , además de un samurái altamente calificado, que luchó en la Guerra Joui en el pasado. Durante la guerra, se hizo conocido como Shiroyasha (que literalmente significa "Demonio blanco") debido a su poderosa habilidad con la espada, apariencia demoníaca, ropa blanca y cabello plateado.',
        ),
        CharacterItem(
          imagePath: 'assets/characters/shinpachi.jpg',
          name: 'Shimura Shinpachi',
          description:
              'Shinpachi Shimura es miembro de los Yorozuya , un samurái en formación y uno de los tres protagonistas principales de Gintama. Es uno de los personajes más normales de la serie, y ofrece las comprobaciones de la realidad necesarias o los chistes contra las travesuras de otros personajes.',
        ),
        CharacterItem(
          imagePath: 'assets/characters/kagura.jpg',
          name: 'Kagura',
          description:
              'Kagura es miembro de Yorozuya y la principal protagonista femenina de Gintama. Es miembro de la Tribu Yato, hija de Umibouzu y Kouka , y hermana menor de Kamui , uno de los principales antagonistas de la serie de Gintama.',
        ),
      ],
    );
  }
}

class CharacterItem extends StatefulWidget {
  final String imagePath;
  final String name;
  final String description;

  CharacterItem({
    required this.imagePath,
    required this.name,
    required this.description,
  });

  @override
  _CharacterItemState createState() => _CharacterItemState();
}

class _CharacterItemState extends State<CharacterItem> {
  bool isExpanded = false;
  CharactersScreen _screen = CharactersScreen(
    imagePath: '',
    text: '',
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Container(
            margin: EdgeInsets.only(
                top: 0, bottom: 50), // Adjust the top margin as needed
            child: _screen.CreateSubtitle(widget.name, 30),
          ),
        ),
        if (isExpanded)
          Column(
            children: <Widget>[
              Image.asset(
                widget.imagePath,
                height: 280,
                fit: BoxFit.contain,
                alignment: Alignment.bottomCenter,
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 10,
                  bottom: 20,
                ),
                child: Text(
                  widget.description,
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
            ],
          ),
      ],
    );
  }
}
