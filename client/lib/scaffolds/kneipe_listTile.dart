import 'package:flutter/material.dart';

class KneipenTile extends StatelessWidget {
  final _kneipen;
  final index;

  KneipenTile(this._kneipen, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(0.0),
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Column(
              children: <Widget>[
                new Image.network('https://via.placeholder.com/150', fit: BoxFit.cover)
              ],
            ),
            new Column(
              children: <Widget>[
                new Text(_kneipen[index]['name'], style: new TextStyle(fontSize: 20.0),),
                new Text(_kneipen[index]['tags'][0])
              ],
            )
          ],
        ));
  }
}
