import 'package:campus_nav/view/Router/RouterConstants.dart';
import 'package:flutter/material.dart';
import 'package:campus_nav/controller/Controller.dart';

class Help extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("Help & About Page"), ),
      drawer: Controller.instance().getSideMenu(),
      body: Container(
        // Center the content
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center content in the column
            children: <Widget>[ // add children to the column
              Text("Follow the link below to get further information\nabout the development of this app\n\n"
                   "https://github.com/softeng-feup/open-cx-nav-inc"
                   "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
                    style: TextStyle(fontSize: 16.0),
                    textAlign: TextAlign.left,
              ),
              Text("Tap the icon below to return to Home Page",
                    style: TextStyle(fontSize: 20.0),
                    textAlign: TextAlign.center,
              ),
              IconButton(icon: Icon(Icons.home,color: Colors.red[200]),
                onPressed: () { Navigator.of(context).pushNamed(homeRoute); },
                iconSize: 80.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
