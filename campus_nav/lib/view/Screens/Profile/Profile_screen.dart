//Flutter Widgets
import 'package:flutter/material.dart';
//Controller
import 'package:campus_nav/controller/Controller.dart';
//Get custom profile widget
import 'package:campus_nav/view/widgets/MyProfileWidget.dart';

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
            'MyProfile', style: 
            new TextStyle()
            ),
        ),
        drawer: Controller.instance().getSideMenu(),
        body: MyProfileWidget(),
    );
  }
}