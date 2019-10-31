//Flutter widgets
import 'package:flutter/material.dart';
//MyCostumeWidget class
import 'package:campus_nav/view/widgets/MyCostumeWidget.dart';

class ConferenceList extends StatelessWidget {
  
  final conferencesList;
  ConferenceList(this.conferencesList);
  
  final customWidgetList = <Widget>[];

  @override
  Widget build(BuildContext context) {
    
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
