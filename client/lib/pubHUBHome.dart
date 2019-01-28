import 'package:flutter/material.dart';
import 'package:client/pages/favorites_screen.dart';
import 'package:client/pages/home_screen.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart';
import 'package:client/pages/maps_screen.dart';

class PubHUBHome extends StatefulWidget {
  @override
  _PubHUBHomeState createState() => _PubHUBHomeState();
}

class _PubHUBHomeState extends State<PubHUBHome>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 1, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("PubHUB"),
        elevation: 0.7,
        bottom: new TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            new Tab(text: "Umkreis"),
            new Tab(icon: new Icon(Icons.favorite)),
            new Tab(text: "Home")
          ],
        ),
        actions: <Widget>[
          new Icon(Icons.search),
          new Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.5),
          ),
          new Icon(Icons.more_vert)
        ],
      ),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          new MapsScreen(),
          new FavoriteScreen(),
          new HomeScreen(),
        ],
      ),
    );
  }
}
