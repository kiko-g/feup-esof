import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'drawer.dart';

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
      new Container(color: Color(0xFF002840),),
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
              "PROFILE", style: 
              new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: _width/15,
                color: new Color(0xFFFFFFFF))
              ),
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: Color(0xFF70baf6),
          ),
          drawer: AppDrawer(),
          backgroundColor: Color(0x999999),
          body: new Center(
            child: new Column(
              children: <Widget>[
                new SizedBox(height: _height/12,),
                new CircleAvatar(radius:_width<_height? _width/4:_height/4,backgroundImage: NetworkImage(imgUrl),),
                new SizedBox(height: _height/25.0,),
                new Text(
                  'Softeng FEUP NAV Team',
                  style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: _width/15,
                    color: new Color(0xFFFFFFFF)),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: _height/30, left: _width/8, right: _width/8),
                  child: new Text('Developping Campus NAV\n',
                   style:  
                    new TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15, 
                      color: Color(0xFFFFFFFF)),
                      textAlign: TextAlign.center)
                ),
                new Divider(height: 30, color: Color(0xFFFFFFFF),),
                new Row(
                  
                  children: <Widget>[ 
                    rowCell(1, 'Conferences Attended'),
                    rowCell(1, 'Connections'),
                    rowCell(5, 'Topics of Interest')]
                ),
                new Divider(height: 90, color: Color(0xFFFFFFFF)),
                new Padding(
                  padding: new EdgeInsets.only(left: _width/8, right: _width/8), 
                  child: new FlatButton(
                    onPressed: (){},
                    child: new Container(
                      child: 
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Icon(Icons.person),
                            new SizedBox(width: _width/30,),
                            new Text('Account Settings')]
                        ),
                    ),
                    color: Color(0xFF70baf6),
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
        new Text('$count',
          textAlign: TextAlign.center,
          style: 
            new TextStyle(color: Color(0xFFFFFFFF))),
        new Text(
          type, 
          textAlign: TextAlign.center,
          style: 
            new TextStyle(
              color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.normal)
          )
      ],
    ),
  );
}