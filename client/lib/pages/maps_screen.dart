import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class MapsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  //Location Variablen
  Location _location = new Location();
  Map<String, double> _currentUserLocation;

  //Maps Variablen
  GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  @override
  void initState() {
    super.initState();
    _location.onLocationChanged().listen((value) {
      setState(() {
        _currentUserLocation = value;
        print(_currentUserLocation["latitude"].toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: _currentUserLocation == null
                ? Center(
                  child: CircularProgressIndicator(),
                )
                : GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                        target: LatLng(
                            _currentUserLocation["latitude"],
                            _currentUserLocation["longitude"]),
                        zoom: 14.0),
                    rotateGesturesEnabled: true,
                    scrollGesturesEnabled: true,
                    tiltGesturesEnabled: true,
                  ),
          )
        ]);
  }

  // Future<Map<String, double>> _getLocation() async {
  //   var currentLocation = <String, double>{};
  //   try {
  //     currentLocation = await _location.getLocation();
  //   } catch (e) {
  //     print('WRONG');
  //     currentLocation = null;
  //   }
  //   return currentLocation;
  // }
}
