//Flutter widgets
import 'dart:io';

import 'package:flutter/material.dart';
//Image picker to select photo from camera
import 'package:image_picker/image_picker.dart';


class MyProfileWidget extends StatefulWidget {
  final name, interests, gender;
  
  MyProfileWidget({
    @required this.name, 
    @required this.interests, 
    @required this.gender
  });

  @override
  _MyProfileWidgetState createState() => 
  _MyProfileWidgetState(
    name: name,
    interests: interests,
    gender: gender
  );
}

class _MyProfileWidgetState extends State<MyProfileWidget> {
  var name, interests, gender;
  File img;
  final defaultProfile = "assets/images/profileDefault.png";
  bool sports = false, science = false, tech = false, softw = false, bussiness = false;

  _MyProfileWidgetState({
    @required this.name, 
    @required this.interests, 
    @required this.gender
  });

  @override
  void initState() {
    super.initState();
  }

  updatePhoto() {
    setState(() {
      updateImageGallery();
    });
  }

  updateImageGallery() async{
    img = await ImagePicker.pickImage(source: ImageSource.gallery);
  }

  updateImageCamera() async{
    img = await ImagePicker.pickImage(source: ImageSource.camera);
  }

  updateGender() {
    setState(() {
      gender == "Male" ? gender = "Female" : gender = "Male";
    });
  }

  updateSports() {
    setState(() {
      sports == false ? sports = true : sports = false;
    });
  }
  updateScience() {
    setState(() {
      science == false ? science = true : science = false;
    });
  }
  updateTech() {
    setState(() {
      tech == false ? tech = true : tech = false;
    });
  }
  updateSoftw() {
    setState(() {
      softw == false ? softw = true : softw = false;
    });
  }
  updateBussiness() {
    setState(() {
      bussiness == false ? bussiness = true : bussiness = false;
    });
  }

  //PROBLEMA QUANDO MECHO NO TICK SPORTS AFETA BUSSINESS

  @override
  Widget build(BuildContext context){
    return new Column(
      children: <Widget>[
        //Profile image and edit icon
        Stack(
          children: <Widget>[
            Container(
              width: 350,
              height: 200,
              child: Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: updatePhoto,
                  icon: Icon(Icons.edit)
                ), 
              ),  
            ),
            Container(
              width: 400,
              height: 200,
              child: Align(
                alignment: Alignment.center,
                child: ClipOval(
                  child: Image.asset(img==null?defaultProfile:img.path,
                    fit: BoxFit.fitWidth,
                    width: 150.0,
                    height: 150.0,
                  )
                ),
              ),
            ),
          ],
        ),

        Container(
          width: 500,
          height: 50,
          child: Align(
            alignment: Alignment.topCenter,
            child: Text(name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        //Gender
        ListTile(
          trailing: IconButton(
            tooltip: "Edit attribute",
            icon: Icon(Icons.edit),
            onPressed: updateGender,
          ),
          title: Text('Gender: ' + gender),
        ),
        ExpansionTile(
          title: Text("My Interests"),
          children: <Widget>[
            ListTile(
              trailing: IconButton(
                tooltip: "Edit attribute",
                icon: Icon(sports == true ? Icons.check_circle : Icons.check_circle_outline),
                onPressed: updateSports,
              ),
              title: Text('Sports', style: TextStyle(decoration: TextDecoration.underline),),
            ),
            ListTile(
              trailing: IconButton(
                tooltip: "Edit attribute",
                icon: Icon(science == true ? Icons.check_circle : Icons.check_circle_outline),
                onPressed: updateScience,
              ),
              title: Text('Science', style: TextStyle(decoration: TextDecoration.underline),),
            ),
            ListTile(
              trailing: IconButton(
                tooltip: "Edit attribute",
                icon: Icon(tech == true ? Icons.check_circle : Icons.check_circle_outline),
                onPressed: updateTech,
              ),
              title: Text('Tech', style: TextStyle(decoration: TextDecoration.underline),),
            ),
            ListTile(
              trailing: IconButton(
                tooltip: "Edit attribute",
                icon: Icon(softw == true ? Icons.check_circle : Icons.check_circle_outline),
                onPressed: updateSoftw,
              ),
              title: Text('Software Engineering', style: TextStyle(decoration: TextDecoration.underline),),
            ),
            ListTile(
              trailing: IconButton(
                tooltip: "Edit attribute",
                icon: Icon(sports == bussiness ? Icons.check_circle : Icons.check_circle_outline),
                onPressed: updateBussiness,
              ),
              title: Text('Business', style: TextStyle(decoration: TextDecoration.underline),),
            ),
          ],
        )
      ],
    );
  }
}