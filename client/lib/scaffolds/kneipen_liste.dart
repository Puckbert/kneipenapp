import 'package:flutter/material.dart';
import 'package:client/DataModels/kneipe.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:client/scaffolds/kneipe_listTile.dart';

class KneipenListe extends StatefulWidget {
  @override
  _KneipenListeState createState() {
    return new _KneipenListeState();
  }
}

class _KneipenListeState extends State<KneipenListe> {
  double _sliderValue = 5.0;
  var _kneipen;

  void getKneipenData() async {
    var data = await getKneipenJson();

    setState(() {
      _kneipen = data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getKneipenData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Padding(
        padding: const EdgeInsets.all(20.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Slider(
              activeColor: Colors.red,
              min: 0.0,
              max: 15.0,
              onChanged: (newRadius) {
                setState(() => _sliderValue = newRadius);
              },
              value: _sliderValue,
            ),
            new Center(
              child: Text('${_sliderValue.toInt()} km Radius', style: TextStyle(fontSize: 30.0),),
            ),
            new Expanded(
              child: new ListView.builder(
                itemCount: _kneipen == null ? 0 : _kneipen.length,
                itemBuilder: (context, index) {
                  return FlatButton(
                    child: new KneipenTile(_kneipen, index),
                    padding: const EdgeInsets.all(0.0),
                    onPressed: () {_pressed();},
                    // TODO: Implement onPressed -> Link zur Kneipe!
                    color: Colors.white,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<List> getKneipenJson() async {
    var url = "http://192.168.122.1:8080/alleKneipen";
    http.Response response = await http.get(url);
    print(response.body);
    return json.decode(response.body);
  }
}

void _pressed () {
  print("PRESSSEDED!");
}
