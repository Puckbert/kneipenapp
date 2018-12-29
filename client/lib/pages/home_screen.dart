import 'package:flutter/material.dart';
import 'package:client/DataModels/kneipe.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override 
  void initState() {
    super.initState();

    fetchKneipen();
  }

//----------------- Build Methode -----------------------------------------//
  @override
  Widget build(BuildContext context) {
    return new Container(
        child: ListView.builder(
      padding: EdgeInsets.all(20.0),
      itemExtent: 100.0,
      itemBuilder: (BuildContext context, int index) {
        return Text(
          "entry $index",
          style: TextStyle(fontSize: 15.0),
        );
      },
    ) //ListView.builder
        );
  }

// ----------------- Funktionen -------------------------------------------//
  Future<Kneipe> fetchKneipen() async {
    final response = await http.get("http://192.168.0.17:8080/alleKneipen");

    if (response.statusCode == 200) {
      return Kneipe.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Load Data!');
    }
  }
}
