//Widgets
import 'package:flutter/material.dart';
//Side Menu
import 'package:campus_nav/view/screens/SideMenu_screen.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Help"),),
        body: Text("Help!\n"),
        drawer: SideMenu(),
    );
  }
}