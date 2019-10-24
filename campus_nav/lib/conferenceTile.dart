import 'package:flutter/material.dart';

//Dart input/ouput operations
//import 'dart:io';

//Stores fav's after each change in isFavourited boolean value - without repeating info
//import 'storage.dart';

class MyCustomWidget extends StatefulWidget {
  final name, theme, starts, ends, room, image, speakers;
  MyCustomWidget({this.name, this.theme, this.starts, this.ends, this.room, this.image, this.speakers});

  @override
  _MyCustomWidgetState createState() => 
  _MyCustomWidgetState(
    name: name,
    theme: theme,
    starts: starts,
    ends: ends,
    room: room,
    image: image,
    speakers: speakers,
  );
}

class _MyCustomWidgetState extends State<MyCustomWidget> {
  bool isFavourited = false;

  var name, theme, starts, ends, room, image, speakers;
  _MyCustomWidgetState({this.name, this.theme, this.starts, this.ends, this.room, this.image, this.speakers});
  
  updateFav() {
    setState(() {
      if(isFavourited)
        isFavourited = false;
      else 
        isFavourited = true;       
    });
  }

  updateGo() {
    setState(() {
      print('GO GO GO\n');   
    });
  }

  String printSpeakers() {
    String speakersString="";

    for(var i=0; i<speakers.length; i++) {
      speakersString += speakers[i];
      if(i != (speakers.length -1)) {
        speakersString += " ; ";
      }
    }
    return speakersString;
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: 
      ClipOval(
        child: Image.asset(image,
          fit: BoxFit.fitWidth,
          width: 50.0,
          height: 50.0,
      )
      ),
      title: Text(name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
      initiallyExpanded: false,
      children: <Widget>[
        ListTile(
          leading: IconButton(
            color: Colors.yellow,
            tooltip: "Add to  Myfavourites",
            icon: (isFavourited ? Icon(Icons.star) : Icon(Icons.star_border)),
            onPressed: updateFav,
          ),
          trailing: IconButton(
            tooltip: "Go to conference room",
            icon: Icon(Icons.directions_run),
            onPressed: updateGo,
          ),
          title: Text('Theme: ' + theme + '\nStarts: ' + starts + '\nEnds: ' + ends + 
            '\nRoom: ' + room + '\nSpeakers: ' + printSpeakers(),
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20)),
        )
      ],
      trailing: Icon(Icons.arrow_drop_down_circle),
    );
  }
}

//Update everyday to display conferences on present day
List conferenceVector() {

  final String webSummitImg = 'assets/images/Web_Summit.png';
  final String icmlImg = 'assets/images/ICML.png';
  final String cesImg = 'assets/images/CES.png';
  final String dreamForceImg = 'assets/images/Dreamforce.png';
  final String inc5000Img = 'assets/images/inc-5000.png';



  List conferencesList = [
    ["Web Summit", "Tech", "10:30", "11:30", "B201", webSummitImg, ["John", "Lucas"]],
    ["ICML", "Science", "15:00", "17:30", "B314", icmlImg, ["Lucas"]],
    ["CES", "Tech",  "10:30", "12:30", "B112", cesImg, ["Lucas"]],
    ["Dreamforce", "Business", "16:30", "18:00", "B207", dreamForceImg, ["Lucas"]],
    ["Inc. 5000", "Business", "15:30", "17:00", "B003", inc5000Img, ["Lucas"]],
  ];

  return conferencesList;
}
  