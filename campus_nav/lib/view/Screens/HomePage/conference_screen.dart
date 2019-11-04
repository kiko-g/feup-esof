//Flutter widgets
import 'package:flutter/material.dart';
//MyCostumeWidget class
import 'package:campus_nav/view/widgets/MyCostumeWidget.dart';
//Controller
import 'package:campus_nav/controller/Controller.dart';

class ConferenceList extends StatelessWidget {
  
  
  final customWidgetList = <Widget>[];

  @override
  Widget build(BuildContext context) {
  List conferencesList = Controller.instance().getConferences();
    
    for(var i=0; i<conferencesList.length; i++) {
      customWidgetList.add(
        MyCustomWidget(
          index: i,
          name: conferencesList[i][0],
          theme: conferencesList[i][1],
          starts: conferencesList[i][2],
          ends: conferencesList[i][3],
          room: conferencesList[i][4],
          image: conferencesList[i][5],
          speakers: conferencesList[i][6]
        )
      );
    }

    return ListView( children: customWidgetList, );
  }
}
