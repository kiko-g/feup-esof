//Flutter widgets
import 'package:flutter/material.dart';
//Controller
import 'package:campus_nav/controller/Controller.dart';
//Favourites List
import 'FavouritesList_screen.dart';

class MyFavourites extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('My Favourites')),
        body: FavouritesList(),
        drawer: Controller.instance().getSideMenu(),
    );
  }

}
