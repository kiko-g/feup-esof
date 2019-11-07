//Widgets
import 'package:flutter/material.dart';
//Controller
import 'package:campus_nav/controller/Controller.dart';


class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Help'),),
        body: Text('Help!\n'),
        drawer: Controller.instance().getSideMenu(),
    );
  }
}