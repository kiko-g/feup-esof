//Flutter widgets
import 'package:flutter/material.dart';
//Data Search
import 'package:campus_nav/view/Screens/HomePage/DataSearch_screen.dart';
//Controller
import 'package:campus_nav/controller/Controller.dart';
//Conferece List
import 'conference_screen.dart';
//Bottom Navigation Menu
import 'BottomNav_screen.dart';

class MyHomePage extends StatelessWidget {
  final DataSearch searchWidget = DataSearch();
  MyHomePage();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Campus NAV', key: Key('Screen title')),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'search',
            onPressed: () {
              showSearch(context: context, delegate: searchWidget);
            }
          )
        ],
      ),
      body: ConferenceList(),
      drawer: Controller.instance().getSideMenu(),
      bottomNavigationBar: BottomNavigationMenu(),
    );
  }

}
