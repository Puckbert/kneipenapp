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
  Future <List<Kneipe>> _getKneipen() async {
    var responseData = await http.get("http://192.168.122.1:8080/alleKneipen");

    var jsonData = json.decode(responseData.body);

    List<Kneipe> kneipen = [];

    for(var k in jsonData){
      Kneipe kneipe = new Kneipe(name: k["name"], oeffnungszeiten: k["oeffnungszeiten"], koordinaten: k["geometry"]["coordinates"], tags: k["tags"]);
      kneipen.add(kneipe);
    }

    print(kneipen.length);

    return kneipen;
  }

  @override 
  void initState() {
    super.initState();
  }

//----------------- Build Methode -----------------------------------------//

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        child: FutureBuilder(
          future: _getKneipen(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.data == null){
              return new Container(
                child: new Center(
                  child: Text("Loading...")
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: new Text(snapshot.data[index].name)
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

// ----------------- Funktionen -------------------------------------------//

}
