import 'dart:async';

import 'package:flutter/material.dart';
import 'main.dart';

class Bloc {
  final _themeController = StreamController<bool>();
  get changeTheme => _themeController.sink.add;
  get darkThemeEnabled => _themeController.stream;
}

final bloc = Bloc();

class MySettings extends StatefulWidget {
  @override
  State <StatefulWidget> createState() => MySettingsState();
}

class MySettingsState extends State<MySettings> {

  bool darkMode = false;

  void onChanged(bool valueReceived) {
    setState(() {
      bloc.changeTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('Settings'),),
      drawer: AppDrawer(),
      body: Container(
        padding: new EdgeInsets.all(32.0),
        child: new Column(
          children: <Widget>[
            new SwitchListTile(
              title: Text('Dark Mode'),
              activeColor: Colors.white,
              value: darkMode,
              onChanged: (bool value) { onChanged(value); },
            )
          ],
        ),
      ),
      //body: ,
    
    );
  }
}