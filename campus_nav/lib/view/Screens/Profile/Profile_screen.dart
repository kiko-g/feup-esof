import 'package:flutter/material.dart';                         //Flutter Widgets
import 'package:campus_nav/controller/Controller.dart';         //Controller
import 'package:campus_nav/view/Widgets/MyProfileWidget.dart';  //Get custom profile widget

class MyProfile extends StatefulWidget {
  @override
  State <StatefulWidget> createState() => MyProfileState();
}

class MyProfileState extends State<MyProfile> {
 @override
  Widget build(BuildContext context){
    return  new Scaffold(
        appBar: new AppBar(
          title: new Text(
            'Campus NAV Profile', 
            key: Key('Screen title'),
          ),
        ),
        drawer: Controller.instance().getSideMenu(),
        body: MyProfileWidget(),
    );
  }
}