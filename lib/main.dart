import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//Nombre: Hipolito Perez
//Matricula: 20187078
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/first': (context) => FirstScreen(),
        '/second': (context) => SecondScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla Principal'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menú de navegación',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Vista 1'),
              onTap: () {
                Navigator.of(context).pop(); // Cierra el drawer o menu
                Navigator.pushNamed(
                    context, '/first'); //Navegamos a la Pantalla 1
              },
            ),
            ListTile(
              title: Text('Vista 2'),
              onTap: () {
                Navigator.of(context).pop(); // Cierra el drawer o menu
                Navigator.pushNamed(
                    context, '/second'); //Navegamos a la Pantalla 2
              },
            )
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/fotomia.png'),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Nombre: Hipolito',
              style: TextStyle(fontSize: 20),
            ),
            Text('Apellido: Perez Peña', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {
  final TextEditingController _numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vista 1'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _numberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Ingrese un número',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                int number = int.tryParse(_numberController.text) ?? 0;

                ///Calcular y mostrar la tabla de multiplicacioneishon
                _showMultiplicationTable(context, number);
              },
              child: Text('Calcular tabla de multiplicacion'),
            ),
          ],
        ),
      ),
    );
  }

  void _showMultiplicationTable(BuildContext context, int number) {
    List<Widget> rows = [];
    for (int i = 0; i <= 14; i++) {
      rows.add(ListTile(
        title: Text('$number x $i = ${number * i}'),
      ));
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Tablas de Multiplicacion'),
          content: SingleChildScrollView(
            child: Column(
              children: rows,
            ),
          ),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cerrar'))
          ],
        );
      },
    );
  }
}

class SecondScreen extends StatelessWidget {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  final TextEditingController _num3Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla 2'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Numero1'),
            ),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Numero2'),
            ),
            TextField(
              controller: _num3Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Numero3'),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                int num1 = int.tryParse(_num1Controller.text) ?? 0;
                int num2 = int.tryParse(_num2Controller.text) ?? 0;
                int num3 = int.tryParse(_num3Controller.text) ?? 0;
                _showResults(context, num1, num1, num3);
              },
              child: Text('calcular'),
            )
          ],
        ),
      ),
    );
  }

  void _showResults(BuildContext context, int num1, int num2, int num3) {
    List<int> numbers = [num1, num2, num3];
    numbers.sort();

    int minValue = numbers.first;
    int maxValue = numbers.last;
    double averageValue = (num1 + num2 + num3) / 3;

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Resultados'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Mayor: $maxValue'),
                Text('Menor: $minValue'),
                Text('Promedio: $averageValue'),
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cerrar'),
              )
            ],
          );
        });
  }
}
//Nombre: Hipolito Perez
//Matricula: 20187078