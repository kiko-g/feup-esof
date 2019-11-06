//Flutter widgets
import 'dart:io';

import 'package:flutter/material.dart';
//Image picker to select photo from camera
import 'package:image_picker/image_picker.dart';
//Flutter slidable widget
import 'package:flutter_slidable/flutter_slidable.dart';

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

  @override
  Widget build(BuildContext context){
    return new Column(
      children: <Widget>[
        //Profile image and edit icon
        Stack(
          children: <Widget>[
            Container(
              width: 350,
              height: 300,
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
              height: 300,
              child: Align(
                alignment: Alignment.center,
                child: ClipOval(
                  child: Image.asset(img==null?defaultProfile:img.path,
                    fit: BoxFit.fitWidth,
                    width: 180.0,
                    height: 180.0,
                  )
                ),
              ),
            ),
          ],
        ),

        Container(
          width: 1000,
          height: 200,
          child: Align(
            alignment: Alignment.topCenter,
            child: Text(name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
                  /*Positioned(
                    right: 20,
                    top: 20,
                    child: Icon(Icons.edit),
                  ),*/
      ],
    );
  }
}