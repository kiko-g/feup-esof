//Flutter widgets
import 'package:campus_nav/view/Router/RouterConstants.dart';
import 'package:flutter/material.dart';
//Controller
import 'package:campus_nav/controller/Controller.dart';


class MyCustomWidget extends StatefulWidget {
  final name, theme, starts, ends;
  final room, image, speakers;
  final num index;
  
  MyCustomWidget({
    @required this.name, 
    @required this.theme, 
    @required this.starts, 
    @required this.ends, 
    @required this.room, 
    @required this.image, 
    @required this.speakers, 
    @required this.index});

  @override
  _MyCustomWidgetState createState() => 
  _MyCustomWidgetState(
    name: name,
    theme: theme,
    starts: starts,
    ends: ends,
    room: room,
    image: image,
    speakers: speakers,
    index: '$index',
  );
}

class _MyCustomWidgetState extends State<MyCustomWidget> {
  var name, theme, starts, ends;
  var room, image, speakers, index;
  
  String value;

  _MyCustomWidgetState({@required var name, @required var theme, 
    @required var starts, @required var ends, 
    @required var room, @required var image, 
    @required var speakers, @required var index})  {

    this.name = name;
    this.theme = theme;
    this.starts = starts;
    this.ends = ends;
    this.room = room;
    this.image = image;
    this.speakers = speakers;
    this.index = index;
  }

  @override
  void initState() {
    super.initState();
  }

  
  isFavourited () => Controller.instance().checkFavourite(name);

  updateFav() {
    setState(() {
      if(isFavourited()) {
        Controller.instance().removeFavourite(name);
        Controller.instance().saveFavourites();
      }
      else {
        Controller.instance().addFavourite(name);
        Controller.instance().saveFavourites();
      }     
    });
  }

  String printSpeakers() {
    String speakersString='';

    for(var i=0; i<speakers.length; i++) {
      speakersString += speakers[i];
      if(i != (speakers.length -1)) {
        speakersString += ' ; ';
      }
    }
    return speakersString;
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
      title: Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
      initiallyExpanded: false,
      children: <Widget>[
        ListTile(
          leading: IconButton(
            color: Colors.yellow,
            tooltip: 'Add to  Myfavourites',
            icon: (isFavourited() ? Icon(Icons.star) : Icon(Icons.star_border)),
            onPressed: updateFav,
          ),
          trailing: IconButton(
            tooltip: 'Go to conference room',
            icon: Icon(Icons.directions_run),
            onPressed: () => Navigator.pushNamed(context, mapRoute, arguments: room),
          ),
          title: Text('Theme: ' + theme + '\nStarts: ' + starts + '\nEnds: ' + ends + 
            '\nRoom: ' + room + '\nSpeakers: ' + printSpeakers(),
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20)),
        )
      ],
      trailing: Icon(Icons.arrow_drop_down_circle),
    );
  }
}

