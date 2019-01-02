import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class KneipenTile extends StatelessWidget {
  final _kneipen;
  final index;

  KneipenTile(this._kneipen, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(

        margin: const EdgeInsets.all(10.0),
        child: new Row(
          children: <Widget>[
            new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Wrap(
                  children: <Widget>[
                    new Image.network('https://via.placeholder.com/150',
                        fit: BoxFit.cover)
                  ],
                )
              ],
            ),
            new Divider(
              indent: 10.0,
            ),
            new Expanded(
                child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Row(children: <Widget>[
                  new Container(
                    child: new Text(
                      _kneipen[index]['name'],
                      style: new TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                      softWrap: true,
                    ),
                  ),
                ]),
                new Divider(
                  height: 60.0,
                ),
                new Container(
                  child: new Container(
                      padding: const EdgeInsets.all(0.0),
                      child: new Text(
                        buildKneipenTagString(_kneipen[index]['tags']),
                        style: new TextStyle(color: Colors.grey[500]),
                      )),
                )
              ],
            ))
          ],
        ));
  }

  String buildKneipenTagString(List tags) {
    String build = '';
    for (var t in tags) {
      build = t + ', ' + build;
    }
    return build;
  }
}
