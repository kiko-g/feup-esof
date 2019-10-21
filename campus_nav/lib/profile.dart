import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'drawer.dart';

class MyProfile extends StatefulWidget {
  @override
  State <StatefulWidget> createState() => MyProfileState();
}

class MyProfileState extends State<MyProfile> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('PROFILE')),
      drawer: AppDrawer(context),
      body: new Checkbox(activeColor: Colors.blue, value: false, tristate: true,),
    );
  }
}
