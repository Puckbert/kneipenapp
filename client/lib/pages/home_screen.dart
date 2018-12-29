import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new KneipenListDisplay(),
    );
  }
}
class KneipenListDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: ListView.builder(
        padding: EdgeInsets.all(20.0),
        itemExtent: 100.0,
        itemBuilder: (BuildContext context, int index){
          return Text("entry $index",style: TextStyle(fontSize: 15.0),);
        },
      )//ListView.builder
    );
  }
}