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
          query = '';
          showSuggestions(context);
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
    final resultWidgetList = <Widget>[];
    List resultList = List.from(Controller.instance().getConferences());

    resultList.retainWhere((conference) => conference[0].contains(query));

    for(var i=0; i<resultList.length; i++) {
      resultWidgetList.add(
        MyCustomWidget(
          index: i,
          name: resultList[i][0],
          theme: resultList[i][1],
          starts: resultList[i][2],
          ends: resultList[i][3],
          room: resultList[i][4],
          image: resultList[i][5],
          speakers: resultList[i][6]
        )
      );
    }

    return ListView(children: resultWidgetList);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionWidgetList = <Widget>[];
    List suggestionList = List.from(Controller.instance().getConferences());

    suggestionList.retainWhere((conference) => conference[0].contains(query));

    for(var i=0; i<suggestionList.length; i++) {
      suggestionWidgetList.add(
        GestureDetector(
          onTap: () {
              query = suggestionList[i][0]; 
              showResults(context);
          },
          
          child: Container(
            padding: EdgeInsets.all(10),
            child: Text(suggestionList[i][0], style: TextStyle(fontSize: 20, fontFamily: 'Montserrat'))
          ),
        )
      );
    }

    return ListView(children: suggestionWidgetList);
  }
}