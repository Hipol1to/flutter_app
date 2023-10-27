import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:tarea6/screens/CustomScreen.dart';
import 'package:flutter/material.dart';

class EdadScreen extends CustomScreen {
  final String imagePath;
  final String text;
  var myController = TextEditingController();

  EdadScreen({required this.imagePath, required this.text})
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
                  "https://cdn-icons-png.flaticon.com/512/3787/3787829.png")),
        ),
        CreateSubtitle('Introduce tu nombre para predecir tu edad', 20),
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
                    content: FutureBuilder<int>(
                      future: confirmGender(myController.text),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator(); // Show a loading indicator.
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else if (snapshot.data! <= 19) {
                          return Column(
                            children: [
                              Container(
                                child: Image(
                                    height: 300,
                                    image: NetworkImage(
                                        "https://w7.pngwing.com/pngs/427/153/png-transparent-computer-icons-business-user-company-young-miscellaneous-child-face-thumbnail.png")),
                              ),
                              Text('Eres joven manito')
                            ],
                          );
                        } else if (snapshot.data! > 19 && snapshot.data! < 64) {
                          return Column(
                            children: [
                              Container(
                                child: Image(
                                    height: 300,
                                    image: NetworkImage(
                                        "https://w7.pngwing.com/pngs/427/153/png-transparent-computer-icons-business-user-company-young-miscellaneous-child-face-thumbnail.png")),
                              ),
                              Text('Eres un adulto bro')
                            ],
                          );
                        } else if (snapshot.data! >= 65) {
                          return Column(
                            children: [
                              Container(
                                child: Image(
                                    height: 300,
                                    image: NetworkImage(
                                        "https://assets.stickpng.com/images/5f4646e0803a0d0004146c5a.png")),
                              ),
                              Text('Eres un anciano, debes andar con cuidado')
                            ],
                          );
                        } else {
                          return Text('No fue encontrado ninguna edad :(');
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

  Future<int> confirmGender(String name) async {
    int result = 0;
    try {
      var httpsUri = Uri.parse('https://api.agify.io/?name=' + name);
      print(httpsUri);
      var response = await http.get(httpsUri);

      if (response.statusCode == 200) {
        var genderInfo = json.decode(response.body);
        result = genderInfo["age"];
      }
    } catch (e) {}
    return result;
  }
}
