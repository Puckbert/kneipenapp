import 'package:flutter/material.dart';
import 'package:client/pubHUBHome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "PubHUB",
      theme: new ThemeData(
        primaryColor: new Color(0xFFFFB74D),
        accentColor: Colors.white
      ),
      debugShowCheckedModeBanner: false,
      home: new PubHUBHome(),
    );
  }
  // This widget is the root of your application.
}
