import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DataSearch extends SearchDelegate<String> {
  final conferences;
  DataSearch(this.conferences);

  @override
  List <Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear
        ),

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
    
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    
    final suggestionList = ["a"];
    
    return ListView.builder(
      itemBuilder: 
        (context, index) => ListTile(
          leading: Icon(Icons.help),
          title: Text(suggestionList[index]),
        ),
        itemCount: suggestionList.length,
    );
  }

}
