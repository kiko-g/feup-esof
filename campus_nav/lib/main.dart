import 'package:flutter/material.dart';
import 'dart:async';
import 'drawer.dart';
import 'search.dart';

/*
é preciso passar context para o appDrawer?
profile - Francisco Gonçalves
settings - Joao Mota
search conference - Martim
Bluetooth - Luis/Matheus
material_design_icons_flutter ? 
*/

void main() => runApp(CampusNAV());

class CampusNAV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus NAV', 
      theme: ThemeData(
        primaryColor: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: MyHomePage(title: 'Campus NAV'),
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
                showSearch(
                  context: context,
                  delegate: DataSearch(conferencesList)
                );
              },
            )
          ],
        ),
        body: ConferenceList(conferencesList),
        drawer: AppDrawer(context),
        bottomNavigationBar: BottomNavigationMenu(),
    );
  }

}

class ConferenceList extends StatelessWidget {
  
  final conferencesList;
  ConferenceList(this.conferencesList);
  
  final children = <Widget>[];

  @override
  Widget build(BuildContext context) {
    
    for(var i=0; i<conferencesList.length; i++) {
      children.add(new ExpansionTile(
            leading: CircleAvatar(backgroundImage: conferencesList[i][5],),
            title: Text(conferencesList[i][0],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
            initiallyExpanded: false,
            children: <Widget>[
              ListTile(
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

    return ListView(
        children: children,
    );
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

//Update everyday to display conferences on present day
List conferenceVector() {

  final webSummitImg = AssetImage('assets/images/conferencesLogos/Web_Summit.png');
  final icmlImg = AssetImage('assets/images/conferencesLogos/ICML.png');
  final cesImg = AssetImage('assets/images/conferencesLogos/CES.png');
  final dreamForceImg = AssetImage('assets/images/conferencesLogos/Dreamforce.png');
  final inc5000Img = AssetImage('assets/images/conferencesLogos/inc-5000.png');

  List conferencesList = [
    ["Web Summit", "Tech", "10:30", "11:30", "B201", webSummitImg],
    ["ICML", "Science", "15:00", "17:30", "B314", icmlImg],
    ["CES", "Tech",  "10:30", "12:30", "B112", cesImg],
    ["Dreamforce", "Business", "16:30", "18:00", "B207", dreamForceImg],
    ["Inc. 5000", "Business", "15:30", "17:00", "B003", inc5000Img],
  ];

  return conferencesList;
}