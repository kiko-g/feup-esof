//Flutter widgets
import 'package:flutter/material.dart';
//Side Menu
import 'package:campus_nav/view/screens/SideMenu_screen.dart';
//Conferece List
import 'conference_screen.dart';
//Bottom Navigation Menu
import 'BottomNav_screen.dart';
//Search Bar
import 'package:campus_nav/view/Screens/HomePage/Search_screen.dart';

class MyHomePage extends StatelessWidget {
  final title;
  MyHomePage({this.title});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'search',
            onPressed: () {
              showSearch(
              context: context,
              delegate: DataSearch()
              );
            },
          )
        ],
      ),
      body: ConferenceList(),
      drawer: SideMenu(),
      bottomNavigationBar: BottomNavigationMenu(),
    );
  }

}
