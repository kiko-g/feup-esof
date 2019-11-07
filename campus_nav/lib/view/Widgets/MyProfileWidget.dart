//IO operations and variables
import 'dart:io';
//Flutter widgets 
import 'package:flutter/material.dart';
//Image picker to select photo from camera
import 'package:image_picker/image_picker.dart';
//Controller
import 'package:campus_nav/controller/Controller.dart';


class MyProfileWidget extends StatefulWidget {
  @override
  _MyProfileWidgetState createState() => 
  _MyProfileWidgetState();
}

class _MyProfileWidgetState extends State<MyProfileWidget> {
  File img;
  final defaultProfile = 'assets/images/profileDefault.png';
  bool isDark = Controller.instance().getSettings().darkMode;
  
  String name = Controller.instance().getProfile().name;
  String imagePath = Controller.instance().getProfile().image;
  bool sports = Controller.instance().getProfile().sports;
  bool science = Controller.instance().getProfile().science;
  bool tech = Controller.instance().getProfile().tech;
  bool softw = Controller.instance().getProfile().softw;
  bool business = Controller.instance().getProfile().business;


  @override
  void initState() {
    super.initState();
  }

  // Picks image from gallery
  updateImageGallery() async{
    img = await ImagePicker.pickImage(source: ImageSource.gallery);
    Controller.instance().getProfile().image = img.path;
    Controller.instance().saveProfile();
    imagePath = img.path;
  }

  // Picks image from phone camera
  updateImageCamera() async{
    img = await ImagePicker.pickImage(source: ImageSource.camera);
    Controller.instance().getProfile().image = img.path;
    Controller.instance().saveProfile();
    imagePath = img.path;
  }

  //Updates user name
  updateName(text) {
    setState(() {
      Controller.instance().getProfile().name = text;
      Controller.instance().saveProfile();
    });
  }

  //Updates user gender
  updateGender() {
    setState(() {
      Controller.instance().getProfile().isMale == false ? 
        Controller.instance().getProfile().isMale = true : 
        Controller.instance().getProfile().isMale = false;

      Controller.instance().saveProfile();
    });
  }

  //Updates specific interest of the user
  updateSports() {
    setState(() {
      Controller.instance().getProfile().sports == false ? 
        Controller.instance().getProfile().sports = true : 
        Controller.instance().getProfile().sports = false;
      
      sports = Controller.instance().getProfile().sports;
      Controller.instance().saveProfile();
    });
  }

  //Updates specific interest of the user
  updateScience() {
    setState(() {
      Controller.instance().getProfile().science == false ? 
        Controller.instance().getProfile().science = true : 
        Controller.instance().getProfile().science = false;
      
      science = Controller.instance().getProfile().science;
      Controller.instance().saveProfile();
    });
  }

  //Updates specific interest of the user
  updateTech() {
    setState(() {
      Controller.instance().getProfile().tech == false ? 
        Controller.instance().getProfile().tech = true : 
        Controller.instance().getProfile().tech = false;
      
      tech = Controller.instance().getProfile().tech;
      Controller.instance().saveProfile();
    });
  }

  //Updates specific interest of the user
  updateSoftw() {
    setState(() {
      Controller.instance().getProfile().softw == false ? 
        Controller.instance().getProfile().softw = true : 
        Controller.instance().getProfile().softw = false;
      
      softw = Controller.instance().getProfile().softw;
      Controller.instance().saveProfile();
    });
  }

  //Updates specific interest of the user
  updateBusiness() {
    setState(() {
      Controller.instance().getProfile().business == false ? 
        Controller.instance().getProfile().business = true : 
        Controller.instance().getProfile().business = false;
      
      business = Controller.instance().getProfile().business;
      Controller.instance().saveProfile();
    });
  }

  //Custom Profile Widget build method
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
                    onPressed: updateImageGallery,
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
                    onPressed: updateImageCamera,
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
                    child: Image.asset(imagePath==''?defaultProfile:imagePath,
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
              initialValue: Controller.instance().getProfile().name,
              onSaved: (text) {
                debugPrint("--->: " + text);
                Controller.instance().getProfile().name = text;
                Controller.instance().saveProfile();
              },
              onChanged: (text) {
                updateName(text);
              },
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          //Interests and gender
          ListTile(
            trailing: IconButton(
              tooltip: 'Edit attribute',
              icon: Icon(Icons.edit),
              onPressed: updateGender,
            ),
            title: Text(
              Controller.instance().getProfile().isMale == false ? 
                'Gender: Female' : 'Gender: Male'
            ),
          ),
          ExpansionTile(
            title: Text('My Interests'),
            children: <Widget>[
              ListTile(
                trailing: IconButton(
                  tooltip: 'Edit attribute',
                  icon: Icon(sports == true ? Icons.check_circle : Icons.check_circle_outline),
                  onPressed: updateSports,
                ),
                title: Text('Sports', style: TextStyle(decoration: TextDecoration.underline),),
              ),
              ListTile(
                trailing: IconButton(
                  tooltip: 'Edit attribute',
                  icon: Icon(science == true ? Icons.check_circle : Icons.check_circle_outline),
                  onPressed: updateScience,
                ),
                title: Text('Science', style: TextStyle(decoration: TextDecoration.underline),),
              ),
              ListTile(
                trailing: IconButton(
                  tooltip: 'Edit attribute',
                  icon: Icon(tech == true ? Icons.check_circle : Icons.check_circle_outline),
                  onPressed: updateTech,
                ),
                title: Text('Tech', style: TextStyle(decoration: TextDecoration.underline),),
              ),
              ListTile(
                trailing: IconButton(
                  tooltip: 'Edit attribute',
                  icon: Icon(softw == true ? Icons.check_circle : Icons.check_circle_outline),
                  onPressed: updateSoftw,
                ),
                title: Text('Software Engineering', style: TextStyle(decoration: TextDecoration.underline),),
              ),
              ListTile(
                trailing: IconButton(
                  tooltip: 'Edit attribute',
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