import 'package:flutter/material.dart';
import 'drawer.dart';
import 'main.dart';

//Reordable list view with option to delete and option to reset

class MyFavourites extends StatefulWidget {
  @override
  State <StatefulWidget> createState() => MyFavouritesState();
}

class MyFavouritesState extends State<MyFavourites> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('Favourites'),),
      drawer: AppDrawer(context),
      body: FavouritesList(),
    );
  }
}

class FavouritesList extends StatefulWidget {
  @override
  State <StatefulWidget> createState() => FavouritesListState();
}

//Favourites List - Reordable list with option to delete and reset to default
class FavouritesListState extends State<FavouritesList> {
  
  final conferencesList = conferenceVector();  
  final children = <Widget>[];
  var index;

  void onReorder(int oldIndex, int newIndex) {
    print(oldIndex);
    print(": oldldIndex\n");
    print(oldIndex);
   print(": newIndex\n");
    setState(() {
      if(newIndex > oldIndex) {
        newIndex -= 1;
      }

        var x = conferencesList.removeAt(oldIndex);
        conferencesList.insert(newIndex, x);
    });
  }

  @override
  Widget build(BuildContext context) {
    
    for(var i=0; i<conferencesList.length; i++) {
      children.add(new ExpansionTile(
            key: ValueKey(i),
            leading: CircleAvatar(backgroundImage: conferencesList[i][5],),
            title: Text(conferencesList[i][0],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
            initiallyExpanded: false,
            children: <Widget>[
              ListTile(
                key: ObjectKey(i),
                leading: Icon(Icons.star_border), 
                title: Text('Theme: ' + conferencesList[i][1] + '\nStarts: ' + conferencesList[i][2] + '\nEnds: ' + conferencesList[i][3] + '\nRoom: ' + conferencesList[i][4],
                  style: TextStyle(fontWeight: FontWeight.w200, fontSize: 20, color: Colors.white)),
                onTap: () => {},
                trailing: Icon(Icons.directions_walk),
              )
            ],
            trailing: Icon(Icons.arrow_drop_down_circle),
        )
      );
    }

    return ReorderableListView(
        children: children,
        header: Text('My Favourites'),
        onReorder: onReorder(oldIndex, newIndex),

    ); 
  }
}

