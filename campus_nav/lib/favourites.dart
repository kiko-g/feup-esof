import 'package:flutter/material.dart';
import 'drawer.dart';
import 'main.dart';

class MyFavourites extends StatefulWidget {
  @override
  State <StatefulWidget> createState() => MyFavouritesState();
}

class MyFavouritesState extends State<MyFavourites> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('Favourites'),),
      drawer: AppDrawer(),
      body: Column(),
    );
  }
}