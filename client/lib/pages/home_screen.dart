import 'package:flutter/material.dart';

import 'package:client/scaffolds/kneipen_liste.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override 
  void initState() {
    super.initState();
  }

//----------------- Build Methode -----------------------------------------//

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Alle Kneipen',
      home: new KneipenListe(),
    );
  }

// ----------------- Funktionen -------------------------------------------//

}
