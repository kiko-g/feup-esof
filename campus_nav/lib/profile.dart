import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'drawer.dart';

class MyProfile extends StatefulWidget {
  @override
  State <StatefulWidget> createState() => MyProfileState();
}

class MyProfileState extends State<MyProfile> 
{
  String dropdownValue = 'One';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DropdownButton<String>(
          value: dropdownValue,
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 100,
          style: TextStyle(color: Colors.lightBlue, fontFamily: "calibri"),
          underline: Container(height: 6,color: Colors.white70,),
          onChanged: (String newValue) {setState(() {dropdownValue = newValue; }); },
          
          items: <String>['One', 'Two', 'Free', 'Four']
            .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            })
            .toList(),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   var scaffold = new Scaffold(
  //     appBar: AppBar(title: Text('PROFILE')),
  //     drawer: AppDrawer(context),
  //     body: new Checkbox(activeColor: Colors.blue, value: false, tristate: true, onChanged: (bool value) {},),
  //   );
  //   return scaffold;
  // }

}