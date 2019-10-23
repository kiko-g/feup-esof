import 'package:flutter/material.dart';
import 'dart:async';
import 'favourites.dart';
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

class CampusNAV extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: 'Campus NAV',
      theme: ThemeData(
        primaryColor: Colors.blue,
        secondaryHeaderColor: Colors.white60,
        brightness: Brightness.dark),

      home: MyHomePage(
        title: 'Campus NAV'),);
  }
}

class MyHomePage extends StatelessWidget 
{
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
  
  final customWidgetList = <Widget>[];

  @override
  Widget build(BuildContext context) {
    
    for(var i=0; i<conferencesList.length; i++) {
      customWidgetList.add(
        MyCustomWidget(
          name: conferencesList[i][0],
          theme: conferencesList[i][1],
          starts: conferencesList[i][2],
          ends: conferencesList[i][3],
          room: conferencesList[i][4],
          image: conferencesList[i][5],
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

class MyCustomWidget extends StatefulWidget {
  final name, theme, starts, ends, room, image;
  MyCustomWidget({this.name, this.theme, this.starts, this.ends, this.room, this.image});

  @override
  _MyCustomWidgetState createState() => 
  _MyCustomWidgetState(
    name: name,
    theme: theme,
    starts: starts,
    ends: ends,
    room: room,
    image: image,
  );
}

class _MyCustomWidgetState extends State<MyCustomWidget> {
  bool isFavourited = false;

  var name, theme, starts, ends, room, image;
  _MyCustomWidgetState({this.name, this.theme, this.starts, this.ends, this.room, this.image});
  
  updateFav() {
    setState(() {
      if(isFavourited)
        isFavourited = false;
      else 
        isFavourited = true;       
    });
  }

  updateGo() {
    setState(() {
      print('GO GO GO\n');   
    });
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: 
      ClipOval(
        child: Image.asset(image,
          fit: BoxFit.fitWidth,
          width: 50.0,
          height: 50.0,
      )
      ),
      title: Text(name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
      initiallyExpanded: false,
      children: <Widget>[
        ListTile(
          leading: IconButton(
            color: Colors.yellow,
            tooltip: "Add to  Myfavourites",
            icon: (isFavourited ? Icon(Icons.star) : Icon(Icons.star_border)),
            onPressed: updateFav,
          ),
          trailing: IconButton(
            tooltip: "Go to conference room",
            icon: Icon(Icons.directions_run),
            onPressed: updateGo,
          ),
          title: Text('Theme: ' + theme + '\nStarts: ' + starts + '\nEnds: ' + ends + '\nRoom: ' + room,
            style: TextStyle(fontWeight: FontWeight.w200, fontSize: 20, color: Colors.white)),
        )
      ],
      trailing: Icon(Icons.arrow_drop_down_circle),
    );
  }
}


//Update everyday to display conferences on present day
List conferenceVector() {

  final String webSummitImg = 'assets/images/Web_Summit.png';
  final String icmlImg = 'assets/images/ICML.png';
  final String cesImg = 'assets/images/CES.png';
  final String dreamForceImg = 'assets/images/Dreamforce.png';
  final String inc5000Img = 'assets/images/inc-5000.png';

  List conferencesList = [
    ["Web Summit", "Tech", "10:30", "11:30", "B201", webSummitImg],
    ["ICML", "Science", "15:00", "17:30", "B314", icmlImg],
    ["CES", "Tech",  "10:30", "12:30", "B112", cesImg],
    ["Dreamforce", "Business", "16:30", "18:00", "B207", dreamForceImg],
    ["Inc. 5000", "Business", "15:30", "17:00", "B003", inc5000Img],
  ];

  return conferencesList;
}