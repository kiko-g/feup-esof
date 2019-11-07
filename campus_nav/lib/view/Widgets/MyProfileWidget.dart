//IO operations and variables
import 'dart:io';
import 'dart:math';
//Flutter widgets 
import 'package:flutter/material.dart';
//Image picker to select photo from camera
import 'package:image_picker/image_picker.dart';


class MyProfileWidget extends StatefulWidget {

  @override
  _MyProfileWidgetState createState() => 
  _MyProfileWidgetState();
}

class _MyProfileWidgetState extends State<MyProfileWidget> {
  File img;
  final defaultProfile = "assets/images/profileDefault.png";
  
  var name="Martim", gender="Male", image="";
  bool sports = false, science = false, tech = false, softw = false, business = false;

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
    image = img.path;
  }

  updateImageCamera() async{
    img = await ImagePicker.pickImage(source: ImageSource.camera);
    image = img.path;
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

  updateBusiness() {
    setState(() {
      business == false ? business = true : business = false;
    });
  }

  @override
  Widget build(BuildContext context){
    return new SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
        //Profile image and edit icon
          Stack(
            children: <Widget>[
              //Camera icon
              Container(
                width: 350,
                height: 150,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    onPressed: updatePhoto,
                    icon: Icon(Icons.photo)
                  ), 
                ),  
              ),
              //Gallery icon
              Container(
                width: 350,
                height: 150,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: updatePhoto,
                    icon: Icon(Icons.photo_camera)
                  ), 
                ),  
              ),
              //Profile photon
              Container(
                width: 400,
                height: 200,
                child: Align(
                  alignment: Alignment.center,
                  child: ClipOval(
                    child: Image.asset(image==""?defaultProfile:image,
                      fit: BoxFit.fitWidth,
                      width: 150.0,
                      height: 150.0,
                    )
                  ),
                ),
              ),
            ],
          ),
          //Name
          Container(
            width: 300,
            height: 100,
            alignment: Alignment.center,
            child: TextFormField(
              initialValue: name,
              onSaved: (text) {
                name = text;
              },
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          //Interests and gender
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
                  icon: Icon(business == true ? Icons.check_circle : Icons.check_circle_outline),
                  onPressed: updateBusiness,
                ),
                title: Text('Business', style: TextStyle(decoration: TextDecoration.underline),),
              ),
            ],
          ),
        ],
      ),
    );
  }
}