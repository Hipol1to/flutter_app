import 'package:Gintama_The_Very_Final/screens/CustomScreen.dart';
import 'package:flutter/material.dart';
import 'package:Gintama_The_Very_Final/screens/CoverScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

  final List<CustomScreen> _widgetOptions = <CustomScreen>[
    CoverScreen(
      imagePath: 'assets/portada.jpg',
      text: 'Gintama The Very Final',
    ),
    CustomScreen(
      imagePath: 'assets/fotomia.png',
      text: 'Screen 2 Text',
    ),
    CustomScreen(
      imagePath: 'assets/fotomia.png',
      text: 'Screen 3 Text',
    ),
    CustomScreen(
      imagePath: 'assets/fotomia.png',
      text: 'Screen 4 Text',
    ),
    CustomScreen(
      imagePath: 'assets/fotomia.png',
      text: 'Screen 5 Text',
    ),
    CustomScreen(
      imagePath: 'assets/fotomia.png',
      text: 'Screen 6 Text',
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
        backgroundColor: Colors.black,
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
              label: 'Portada',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Personajes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.movie),
              label: 'Momentos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'Acerca de',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.face),
              label: 'Mi vida',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.work),
              label: 'Contrátame',
            ),
          ],
        ));
  }
}
