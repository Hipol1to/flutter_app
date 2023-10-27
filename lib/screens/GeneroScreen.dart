import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:tarea6/screens/CustomScreen.dart';
import 'package:flutter/material.dart';

class GeneroScreen extends CustomScreen {
  final String imagePath;
  final String text;
  var myController = TextEditingController();

  GeneroScreen({required this.imagePath, required this.text})
      : super(
          imagePath: '',
          text: '',
        );

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
  }

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
          margin: EdgeInsets.only(bottom: 30),
          child: Image(
              height: 120,
              image: NetworkImage(
                  "https://www.pngall.com/wp-content/uploads/5/Gender-PNG-High-Quality-Image.png")),
        ),
        CreateSubtitle('Introduce tu nombre para predecir tu genero', 20),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Nombre", fillColor: Colors.white, filled: true),
              controller: myController,
            )),
        Container(
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: FutureBuilder<String>(
                      future: confirmGender(myController.text),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator(); // Show a loading indicator.
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else if (snapshot.data == "male" ||
                            snapshot.data == 'male') {
                          return Scaffold(
                            backgroundColor: Colors.blue,
                          );
                        } else if (snapshot.data == "female" ||
                            snapshot.data == 'female') {
                          return Scaffold(
                            backgroundColor: Colors.pink,
                          );
                        } else {
                          return Text('No fue encontrado ningun genero');
                        }
                      },
                    ),
                  );
                },
              );
            },
            child: Text('Enviar'),
          ),
        )
      ],
    );
  }

  Future<String> confirmGender(String name) async {
    String result = "";
    try {
      var httpsUri = Uri.parse('https://api.genderize.io/?name=' + name);
      print(httpsUri);
      var response = await http.get(httpsUri);

      if (response.statusCode == 200) {
        var genderInfo = json.decode(response.body);
        result = genderInfo["gender"];
      }
    } catch (e) {}
    return result;
  }
}
