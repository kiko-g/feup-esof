// ===============================================================================
import 'package:campus_nav/view/Router/RouterConstants.dart';
import 'package:flutter/material.dart';
import 'package:campus_nav/controller/Controller.dart';


class HelpScreen extends StatefulWidget {
  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  void initState() { super.initState(); }

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      appBar: AppBar( title: Text("Campus NAV Help", key: Key('Screen title')), ),
      drawer: Controller.instance().getSideMenu(),
      body: 
      Container(    
        child: Align(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
            Padding(padding: EdgeInsets.all(10.0),),
            Column(children: <Widget>[
                Padding(padding: EdgeInsets.all(5.0),),
                Text(" Francisco Gonçalves", style: TextStyle(fontSize: 13.0), textAlign: TextAlign.center),
                Text(" https://github.com/kiko-g", style: TextStyle(fontSize: 10.0), textAlign: TextAlign.center),
                Image.network( 'https://avatars1.githubusercontent.com/u/40745490?s=460&v=4', width: 100, height: 100,),
                Padding(padding: EdgeInsets.all(10.0)),
                Text("João Mota", style: TextStyle(fontSize: 13.0), textAlign: TextAlign.center),
                Text("https://github.com/jppm99", style: TextStyle(fontSize: 10.0), textAlign: TextAlign.center),
                Image.network( 'https://scontent.fopo2-1.fna.fbcdn.net/v/t1.0-1/p480x480/29067299_1828821300482680_7206999266361868288_o.jpg?_nc_cat=103&_nc_ohc=D6Osq1EhU-IAQkLShKBLzxcm2WCOCZxdEEHlKJhJ_RFVM3b8YOvkYpKZg&_nc_ht=scontent.fopo2-1.fna&oh=53615770784c49626e721f71ad27e7df&oe=5E7B73F1', width: 100, height: 100,),
                Padding(padding: EdgeInsets.all(10.0),),
                Text("Luís Ramos", style: TextStyle(fontSize: 13.0), textAlign: TextAlign.center),
                Text("https://github.com/LuisPRamos", style: TextStyle(fontSize: 10.0), textAlign: TextAlign.center),
                Image.network( 'https://scontent.fopo2-2.fna.fbcdn.net/v/t31.0-8/16177645_1249848905107392_1694052157281971592_o.jpg?_nc_cat=106&_nc_ohc=BXAmk0DWo9QAQkOGshgnoaINiFqN3CLyd5xbyYrDGytocG-siwcadgceg&_nc_ht=scontent.fopo2-2.fna&oh=45c3ef0b4de9c0208fe07294828a0490&oe=5E8CE868', width: 100, height: 100, ),
                Padding(padding: EdgeInsets.all(15.0),),
                IconButton(icon: Icon(Icons.home,color: Colors.red[200]),
                    onPressed: () { Navigator.of(context).pushNamed(homeRoute); },
                    iconSize: 50.0,
                    padding: new EdgeInsets.all(10.0),
                ), 
                Padding(padding: EdgeInsets.all(0.0),),
                Text("Return to Home Page", style: TextStyle(fontSize: 12.0, height: 0), textAlign: TextAlign.center,
              ),
             ],
            ),

            Padding(padding: EdgeInsets.all(5.0),),
            Column(children: <Widget>[
                Padding(padding: EdgeInsets.all(5.0), ),
                Text("Martim Silva", style: TextStyle(fontSize: 13.0), textAlign: TextAlign.center),
                Text("https://github.com/motapinto", style: TextStyle(fontSize: 10.0), textAlign: TextAlign.center),
                Image.network('https://avatars3.githubusercontent.com/u/41308685?s=460&v=4', width: 100, height: 100,),
                
                Padding(padding: EdgeInsets.all(10.0),),
                Text("Matheus Stiehler", style: TextStyle(fontSize: 13.0), textAlign: TextAlign.center),
                Text("https://github.com/matheusstiehler", style: TextStyle(fontSize: 10.0), textAlign: TextAlign.center),
                Image.network('https://avatars0.githubusercontent.com/u/35880087?s=460&v=4', width: 100, height: 100,),
                
                Padding(padding: EdgeInsets.all(10.0),),
                Text("Prof. Ademar Aguiar", style: TextStyle(fontSize: 13.0), textAlign: TextAlign.center),
                Text("https://github.com/aaguiar", style: TextStyle(fontSize: 10.0), textAlign: TextAlign.center),
                Image.network('https://avatars1.githubusercontent.com/u/120221?s=460&v=4', width: 100, height: 100,),
                Padding(padding: EdgeInsets.all(5.0),),
                Text("Follow the link below to get" , style: TextStyle(fontSize: 12.0), textAlign: TextAlign.center, ),
                Text("further information about the" , style: TextStyle(fontSize: 12.0), textAlign: TextAlign.center, ),
                Text(" development of this app" , style: TextStyle(fontSize: 12.0), textAlign: TextAlign.center, ),
                Padding(padding: EdgeInsets.all(10.0),),
                Text("https://github.com/" , style: TextStyle(fontSize: 12.0), textAlign: TextAlign.center, ),
                Text("softeng-feup/open-cx-nav-inc" , style: TextStyle(fontSize: 12.0), textAlign: TextAlign.center, ),
            ],
          ),
          // Column(children: <Widget>[
            
          // ],) 
          ],
         ),
        ),
       ),
      );
  }
}