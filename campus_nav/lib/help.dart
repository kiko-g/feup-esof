import 'package:flutter/material.dart';

//App drawer used in all modules
import 'drawer.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Help"),),
        body: Text("Help!\n"),
        drawer: AppDrawer(),
    );
  }
}