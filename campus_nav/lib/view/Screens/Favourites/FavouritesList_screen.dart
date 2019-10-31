//Flutter widgets
import 'package:flutter/material.dart';
//Controller
import 'package:campus_nav/controller/Controller.dart';
//My Costume Widget
import 'package:campus_nav/view/widgets/MyCostumeWidget.dart';


class FavouritesList extends StatefulWidget {
  final list;
  FavouritesList({@required this.list});
  
  @override
  State <StatefulWidget> createState() => FavouritesListState(list: list);
}

class FavouritesListState extends State<FavouritesList> {
  final list;
  FavouritesListState({@required this.list});

  final customWidgetList = <Widget>[];

  @override
  Widget build(BuildContext context) {
    
    for(var i=0; i<list.length; i++) {
      if(Controller.instance().checkFavourite("$i")) {
        customWidgetList.add(
          MyCustomWidget(
            index: i,
            name: list[i][0],
            theme: list[i][1],
            starts: list[i][2],
            ends: list[i][3],
            room: list[i][4],
            image: list[i][5],
            speakers: list[i][6]
          )
        );
      }
    }

    return ListView( children: customWidgetList, );
  }
}