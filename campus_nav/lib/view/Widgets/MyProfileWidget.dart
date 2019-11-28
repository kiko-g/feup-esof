import 'package:flutter/material.dart';                   //Flutter widgets 
import 'package:image_picker/image_picker.dart';          //Image picker to select photo from camera
import 'package:campus_nav/controller/Controller.dart';   //Controller


class MyProfileWidget extends StatefulWidget {
  @override
  _MyProfileWidgetState createState() => 
  _MyProfileWidgetState();
}

class _MyProfileWidgetState extends State<MyProfileWidget> {
  Image image;

  @override
  void initState() {
    super.initState();
    image = Image.asset(Controller.instance().getProfile().image,
                      fit: BoxFit.fitWidth,
                      width: 150.0,
                      height: 150.0);
  }

  // Picks image from source
  updateImageSource(source) async{
    try{
      final img = await (ImagePicker.pickImage(source: source) ?? null);
      Controller.instance().getProfile().image = (img==null?Controller.instance().getProfile().image:img.path);
      Controller.instance().saveProfile(); 
      if(img != null)
        image = Image.file(img, fit: BoxFit.fitWidth, width: 150.0, height: 150.0); 
    }
    catch (_) {}
  }

  // Picks image
  updateImage(ImageSource source) async{
    await updateImageSource(source);
    setState(() {});
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
      Controller.instance().getProfile().isMale = !Controller.instance().getProfile().isMale;
      Controller.instance().saveProfile();
    });
  }

  //Updates specific interest of the user
  updateSports() {
    setState(() {
      Controller.instance().getProfile().sports = !Controller.instance().getProfile().sports;
      Controller.instance().saveProfile();
    });
  }

  //Updates specific interest of the user
  updateScience() {
    setState(() {
      Controller.instance().getProfile().science = !Controller.instance().getProfile().science;
      Controller.instance().saveProfile();
    });
  }

  //Updates specific interest of the user
  updateTech() {
    setState(() {
      Controller.instance().getProfile().tech = !Controller.instance().getProfile().tech;
      Controller.instance().saveProfile();
    });
  }

  //Updates specific interest of the user
  updateSoftw() {
    setState(() {
      Controller.instance().getProfile().softw = !Controller.instance().getProfile().softw;
      Controller.instance().saveProfile();
    });
  }

  //Updates specific interest of the user
  updateBusiness() {
    setState(() {
      Controller.instance().getProfile().business = !Controller.instance().getProfile().business;
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
                    onPressed: () async => await updateImage(ImageSource.gallery),
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
                    onPressed: () async => await updateImage(ImageSource.camera),
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
                    child: image
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
                  icon: Icon(Controller.instance().getProfile().sports == true ? Icons.check_circle : Icons.check_circle_outline),
                  onPressed: updateSports,
                ),
                title: Text('Sports', style: TextStyle(decoration: TextDecoration.underline),),
              ),
              ListTile(
                trailing: IconButton(
                  tooltip: 'Edit attribute',
                  icon: Icon(Controller.instance().getProfile().science == true ? Icons.check_circle : Icons.check_circle_outline),
                  onPressed: updateScience,
                ),
                title: Text('Science', style: TextStyle(decoration: TextDecoration.underline),),
              ),
              ListTile(
                trailing: IconButton(
                  tooltip: 'Edit attribute',
                  icon: Icon(Controller.instance().getProfile().tech == true ? Icons.check_circle : Icons.check_circle_outline),
                  onPressed: updateTech,
                ),
                title: Text('Tech', style: TextStyle(decoration: TextDecoration.underline),),
              ),
              ListTile(
                trailing: IconButton(
                  tooltip: 'Edit attribute',
                  icon: Icon(Controller.instance().getProfile().softw == true ? Icons.check_circle : Icons.check_circle_outline),
                  onPressed: updateSoftw,
                ),
                title: Text('Software Engineering', style: TextStyle(decoration: TextDecoration.underline),),
              ),
              ListTile(
                trailing: IconButton(
                  tooltip: 'Edit attribute',
                  icon: Icon(Controller.instance().getProfile().business == true ? Icons.check_circle : Icons.check_circle_outline),
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