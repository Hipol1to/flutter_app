import 'package:tarea6/screens/CustomScreen.dart';
import 'package:tarea6/screens/EdadScreen.dart';
import 'package:tarea6/screens/GeneroScreen.dart';
import 'package:tarea6/screens/InicioScreen.dart';
import 'package:tarea6/screens/ContratameScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gintama The Very Final',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  var myController = TextEditingController();

  final List<Widget> _widgetOptions = <Widget>[
    Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://img.freepik.com/free-photo/purple-blue-background-with-swirl-light_1340-27556.jpg"),
              fit: BoxFit.cover)),
      child: InicioScreen(
        imagePath: '',
        text: 'Utilidades & Herramientas',
      ),
    ),
    Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://img.freepik.com/free-photo/purple-blue-background-with-swirl-light_1340-27556.jpg"),
              fit: BoxFit.cover)),
      child: GeneroScreen(
        imagePath: '',
        text: 'Predecir genero',
      ),
    ),
    Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://img.freepik.com/free-photo/purple-blue-background-with-swirl-light_1340-27556.jpg"),
              fit: BoxFit.cover)),
      child: EdadScreen(
        imagePath: '',
        text: 'Predecir edad',
      ),
    ),
    /*ss
    EdadsScreen(
      imagePath: 'assets/fotomia.png',
      text: 'Momentos destacados',
    ),
    AboutItScreen(
      imagePath: 'assets/fotomia.png',
      text: 'Acerca de Gintama',
    ), */
    ContratameScreen(
      imagePath: 'assets/fotomia.png',
      text: 'Contratame',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _widgetOptions[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // Configura el tipo como 'fixed'
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          backgroundColor: Color.fromARGB(255, 48, 45, 45),
          unselectedItemColor: Color.fromARGB(
              255, 177, 176, 176), // Color de los íconos no seleccionados
          selectedItemColor: Color.fromARGB(
              255, 250, 69, 69), // Color de los íconos seleccionados
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Genero',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.movie),
              label: 'Edad',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'País',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.face),
              label: 'Clima',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.work),
              label: 'Wordpress',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.work),
              label: 'Contrátame',
            ),
          ],
        ));
  }
}
