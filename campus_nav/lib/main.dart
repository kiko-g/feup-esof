import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

//Acess to custom list tile widget
import 'conferenceTile.dart';
//App drawer used in all modules
import 'drawer.dart';

void main() => runApp(CampusNAV());

class CampusNAV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (defaultBrightness) => new ThemeData(
        // primarySwatch: Colors.indigo,
        brightness: defaultBrightness,
      ),
      themedWidgetBuilder: (context, theme) {
        return new MaterialApp(
          title: 'Campus NAV',
          theme: theme,
          home: MyHomePage(title: 'Campus NAV'),
        );
      }
    );
  }
}

class MyHomePage extends StatelessWidget {
  final title;
  MyHomePage({this.title});

  final conferencesList = conferenceVector();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.search),
              tooltip: 'search',
              onPressed: () {
                //showSearch(
                  //context: context,
                  //delegate: DataSearch(conferencesList)
                //);
              },
            )
          ],
        ),
        body: ConferenceList(conferencesList),
        drawer: AppDrawer(),
        bottomNavigationBar: BottomNavigationMenu(),
    );
  }

}

class ConferenceList extends StatelessWidget {
  
  final conferencesList;
  ConferenceList(this.conferencesList);
  
  final customWidgetList = <Widget>[];

  @override
  Widget build(BuildContext context) {
    
    for(var i=0; i<conferencesList.length; i++) {
      customWidgetList.add(
        MyCustomWidget(
          key: Key("$i"),
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

class BottomNavigationMenu extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
        title: Text("WC\n"),
        icon: Image.asset('assets/images/toilets.png'),
        ),
        BottomNavigationBarItem(
          title: Text("Vending Machine\n"),
          icon: Image.asset('assets/images/machine.png'),
        ),
        BottomNavigationBarItem(
          title: Text("Coffe Machine\n"),
          icon: Image.asset('assets/images/coffee-machine.png'),
        ),
       
      ],
    );
  }
}
