//Flutter widgets
import 'package:campus_nav/controller/Controller.dart';
import 'package:campus_nav/view/Widgets/MyCostumeWidget.dart';
import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate<String> {

  @override
  List <Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        })
      ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      
      onPressed: () {
        close(context, null);
      } 
    );
  }
  
  @override
  Widget buildResults(BuildContext context) {
    List suggestionList = List.from(Controller.instance().getConferences());

    suggestionList.retainWhere((conference) => conference[0].contains(query));

    return ListView.builder(
      itemBuilder: 
        (context, index) => MyCustomWidget(
          index: index,
          name: suggestionList[index][0],
          theme: suggestionList[index][1],
          starts: suggestionList[index][2],
          ends: suggestionList[index][3],
          room: suggestionList[index][4],
          image: suggestionList[index][5],
          speakers: suggestionList[index][6]

        ),
        itemCount: suggestionList.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List suggestionList = List.from(Controller.instance().getConferences());

    suggestionList.retainWhere((conference) => conference[0].contains(query));

    
    return ListView.builder(
      itemBuilder: 
        (context, index) => MyCustomWidget(
          index: index,
          name: suggestionList[index][0],
          theme: suggestionList[index][1],
          starts: suggestionList[index][2],
          ends: suggestionList[index][3],
          room: suggestionList[index][4],
          image: suggestionList[index][5],
          speakers: suggestionList[index][6]
        ),
        itemCount: suggestionList.length,
    );
  }

}