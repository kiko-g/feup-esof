//Flutter widgets
import 'package:flutter/material.dart';
//Controller
import 'package:campus_nav/controller/Controller.dart';
//My Costume Widget
import 'package:campus_nav/view/Widgets/MyCostumeWidget.dart';


class FavouritesList extends StatefulWidget {  
  @override
  State <StatefulWidget> createState() => FavouritesListState();
}

class FavouritesListState extends State<FavouritesList> {
  final customWidgetList = <Widget>[];
  final conferences = Controller.instance().getConferences();

  @override
  Widget build(BuildContext context) {
    
    for(var i=0; i<conferences.length; i++) {
      if(Controller.instance().checkFavourite(conferences[i][0])) {
        customWidgetList.add(
          MyCustomWidget(
            index: i,
            name: conferences[i][0],
            theme: conferences[i][1],
            starts: conferences[i][2],
            ends: conferences[i][3],
            room: conferences[i][4],
            image: conferences[i][5],
            speakers: conferences[i][6]
          )
        );
      }
    }

    return ListView( children: customWidgetList, );
  }
}