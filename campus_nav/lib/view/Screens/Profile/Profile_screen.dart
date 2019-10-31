//Flutter Widgets
import 'package:flutter/material.dart';

import 'package:campus_nav/view/screens/SideMenu_screen.dart';

class MyProfile extends StatefulWidget {
  @override
  State <StatefulWidget> createState() => MyProfileState();
}

class MyProfileState extends State<MyProfile>
{
 @override
  Widget build(BuildContext context)
  {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    final String imgUrl = 'https://avatars1.githubusercontent.com/u/12510902?s=200&v=4';

    return new Stack(children: <Widget>[
      new Container(),
      // new Image.network(imgUrl, fit: BoxFit.contain),
      // new BackdropFilter(
      //   filter: new ui.ImageFilter.blur(
      //   sigmaX: 0.0,
      //   sigmaY: 0.0,
      // ),
      // child: new Container(
      //   decoration: BoxDecoration(
      //   color:  Color(0x999999),
      //   borderRadius: BorderRadius.all(Radius.circular(0.0)),
      // ),)),
      new Scaffold(
          appBar: new AppBar(
            title: new Text(
              "Profile", style: 
              new TextStyle()
              ),
            centerTitle: false,
            elevation: 0.0,
          ),
          drawer: SideMenu(),
          body: new Center(
            child: new Column(
              children: <Widget>[
                new SizedBox(height: 20,),
                new CircleAvatar(radius:_width<_height? _width/4:_height/4,backgroundImage: NetworkImage(imgUrl),),
                new SizedBox(height: _height/25.0,),
                new Text(
                  'Softeng FEUP NAV Team',
                  style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: _width/15),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: _height/30, left: _width/8, right: _width/8),
                  child: new Text('Developping Campus NAV\n',
                   style:  
                    new TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15),
                      textAlign: TextAlign.center)
                ),
                new Divider(height: 30),
                new Row(
                  
                  children: <Widget>[ 
                    rowCell(1, 'Attended'),
                    rowCell(1, 'Connections'),
                    rowCell(5, 'Topics of Interest')]
                ),
                new Divider(height: 60),
                new Padding(
                  padding: new EdgeInsets.only(left: _width/8, right: _width/8), 
                  child: new FlatButton(color: Color(0xFF002040),
                    onPressed: (){},
                    child: new Container(
                      child:
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Icon(Icons.person, color: Color(0xFFFFFFFF),),
                            new SizedBox(width: _width/30,),
                            new Text('Account Settings', style: new TextStyle(color: Color(0xFFFFFFFF)))]
                        ),
                    ),
                  ),
                ),
              ],
            ),
          )
      )
    ],
  );
}

  Widget rowCell(int count, String type) => new Expanded(
    child: new Column(
      children: <Widget>[
        new Text('$count', textAlign: TextAlign.center, textScaleFactor: 2,
          style: new TextStyle(fontSize: 13, height: 2)),
        new Text(
          type, 
          textAlign: TextAlign.center,
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 15)
          )
      ],
    ),
  );
}