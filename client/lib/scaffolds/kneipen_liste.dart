import 'package:flutter/material.dart';
import 'package:client/DataModels/kneipe.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:client/scaffolds/kneipe_listTile.dart';

class KneipenListe extends StatefulWidget {
  List _kneipen;

  KneipenListe(this._kneipen);
  KneipenListe.empty();

  @override
  _KneipenListeState createState() {
    return new _KneipenListeState();
  }
}

class _KneipenListeState extends State<KneipenListe> {
  double _sliderValue = 5.0;
  var _kneipen;

  Future<List> _getKneipenData() async {
    var data = await _getKneipenJson();

    setState(() {
      _kneipen = data;
    });

    return data;
  }

  @override
  void initState() {
    super.initState();
    _getKneipenData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Padding(
        padding: const EdgeInsets.all(5.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // new Slider(
            //   activeColor: Colors.red,
            //   min: 0.0,
            //   max: 15.0,
            //   onChanged: (newRadius) {
            //     setState(() => _sliderValue = newRadius);
            //   },
            //   value: _sliderValue,
            // ),
            // new Center(
            //   child: Text(
            //     '${_sliderValue.toInt()} km Radius',
            //     style: TextStyle(fontSize: 25.0),
            //   ),
            // ),
            new Expanded(
                child: new RefreshIndicator(
              onRefresh: _getKneipenData,
              child: new ListView.builder(
                itemCount: _kneipen == null ? 0 : _kneipen.length,
                itemBuilder: (context, index) {
                  return new FlatButton(
                    child: new KneipenTile(_kneipen, index),
                    padding: const EdgeInsets.all(0.0),
                    onPressed: () {
                      _pressed();
                    },
                    // TODO: Implement onPressed -> Link zur Kneipe!
                    color: Colors.white,
                  );
                },
              ),
            ))
          ],
        ),
      ),
    );
  }

  Future<List> _getKneipenJson() async {
    var url = "http://192.168.122.1:8080/alleKneipen";
    http.Response response = await http.get(url);
    print(response.body);
    return json.decode(response.body);
  }
}

void _pressed() {
  print("PRESSSEDED!");
}
