import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geocoding/geocoding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tarea 9 y 10',
      home: LocationScreen(),
    );
  }
}

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController latitudeController = TextEditingController();
  TextEditingController longitudeController = TextEditingController();

  LatLng? markerPosition;
  StreamController<LatLng?> _markerPositionStreamController =
      StreamController<LatLng?>.broadcast();
  String address = '';

  @override
  void dispose() {
    _markerPositionStreamController.close();
    super.dispose();
  }

  void _showLocationInfo(
    BuildContext context,
    LatLng position,
    String firstName,
    String lastName,
  ) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks.first;
        setState(() {
          address =
              '$firstName $lastName, ${placemark.locality ?? ''}, ${placemark.country}';
        });

        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Direccion e Informacion'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Nombre: $firstName'),
                Text('Apellido: $lastName'),
                Text('Ciudad: ${placemark.locality ?? 'N/A'}'),
                Text('Pais: ${placemark.country}'),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      } else {
        // Handle case where no placemarks were found
        print('No address found for the given coordinates.');
      }
    } catch (e) {
      print('Error fetching address: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarea 9 y 10'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: firstNameController,
              decoration: InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: lastNameController,
              decoration: InputDecoration(labelText: 'Apellido'),
            ),
            TextField(
              controller: latitudeController,
              decoration: InputDecoration(labelText: 'Latitud'),
            ),
            TextField(
              controller: longitudeController,
              decoration: InputDecoration(labelText: 'Longitud'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                double latitude = double.parse(latitudeController.text);
                double longitude = double.parse(longitudeController.text);

                setState(() {
                  markerPosition = LatLng(latitude, longitude);
                  _markerPositionStreamController.add(markerPosition);
                });
              },
              child: Text('Next'),
            ),
            Expanded(
              child: StreamBuilder<LatLng?>(
                stream: _markerPositionStreamController.stream,
                builder: (context, snapshot) {
                  LatLng center = snapshot.data ?? LatLng(0, 0);

                  return FlutterMap(
                    options: MapOptions(
                      center: center,
                      zoom: 1,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: ['a', 'b', 'c'],
                        minZoom: 0,
                        maxZoom: 19,
                      ),
                      if (markerPosition != null)
                        MarkerLayer(
                          markers: [
                            Marker(
                              width: 30.0,
                              height: 30.0,
                              point: markerPosition!,
                              child: GestureDetector(
                                onTap: () {
                                  String firstName = firstNameController.text;
                                  String lastName = lastNameController.text;

                                  _showLocationInfo(context, markerPosition!,
                                      firstName, lastName);
                                },
                                child: Container(
                                  child: Icon(Icons.location_on),
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  );
                },
              ),
            ),
            if (address.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Direccion e Informacion: $address',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
