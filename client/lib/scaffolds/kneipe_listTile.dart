import 'package:flutter/material.dart';

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
              children: <Widget>[
                new Image.network('https://via.placeholder.com/150',
                    fit: BoxFit.cover)
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
                new Row(
                  children: <Widget>[
                    new Wrap(children: <Widget>[
                      new Text(
                        _kneipen[index]['name'],
                        style: new TextStyle(fontSize: 20.0),
                      ),
                    ])
                  ],
                ),
                new Divider(
                  height: 20.0,
                ),
                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Container(
                        padding: const EdgeInsets.all(0.0),
                        color: Colors.red,
                        child: new Wrap(
                            direction: Axis.horizontal,
                            children: <Widget>[
                              new Text(
                                buildKneipenTagString(_kneipen[index]['tags']),
                                textAlign: TextAlign.left,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              )
                            ]))
                  ],
                )
              ],
            ))
          ],
        ));
  }

  String buildKneipenTagString(List tags) {
    String build = '';
    for (var t in tags) {
      print(t);
      build = t + ', ' + build;
    }
    return build;
  }
}
