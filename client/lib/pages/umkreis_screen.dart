import 'dart:async';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart';
import 'package:client/scaffolds/kneipen_liste.dart';

// TODO: Update Get Request mit Body, Maps in Dart

class UmkreisScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _UmkreisScreenState();
}

class _UmkreisScreenState extends State<UmkreisScreen> {
  //Notwendige Variablen deklarieren um State festzulegen!
  Map<String, double> _currentLocation; // Speichert den aktuellen Standort!
  Location _location = new Location();
  bool _permission = false;
  String error;
  StreamSubscription<Map<String, double>> _locationSubscription;
  double _sliderValue = 5.0;

  @override
  void initState() {
    super.initState();

    initPlatformState();

    _locationSubscription =
        _location.onLocationChanged().listen((Map<String, double> result) {
      if (this.mounted) {
        setState(() {
          _currentLocation = result;
        });
      }
    });
  }

  initPlatformState() async {
    //location wird als Map gespeichert, mit einer Bezeichnung und einem Doublewert

    Map<String, double> location;

    try {
      _permission = await _location.hasPermission();
      location = await _location.getLocation();

      error = null;
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'Permission denied!';
      } else if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error = 'Permission denied - please ask user!';
      }

      location = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets;
    widgets = new List();
    if (_currentLocation != null) {
      widgets.add(new Center(
          child: new Text(_location != null
              ? 'Start location: ${_currentLocation['longitude']}\n'
              : 'Error: $error\n')));
    }
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: 
        new Center(
          child: new Text(_location != null
              ? 'Start location: ${_currentLocation['latitude']}\n'
              : 'Error: $error\n')
        )
    );
  }
}
