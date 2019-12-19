//Constants used in Route
import 'package:campus_nav/view/Router/RouterConstants.dart';
//Widgets
import 'package:flutter/material.dart';
//Home Page
import 'package:campus_nav/view/Screens/HomePage/homepage_screen.dart';
//Help Page
import 'package:campus_nav/view/Screens/Help/help_screen.dart';
//Settings Page
import 'package:campus_nav/view/Screens/Settings/Settings.dart';
//Favourites Page
import 'package:campus_nav/view/Screens/Favourites/Favourites_screen.dart';
//Profile Page
import 'package:campus_nav/view/Screens/Profile/Profile_screen.dart';
//Map Page
import 'package:campus_nav/view/Screens/Map/MyMap.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (context) => MyHomePage());
      case settingsRoute:
        return MaterialPageRoute(builder: (context) => MySettings());
      case favouritesRoute:
        return MaterialPageRoute(builder: (context) => MyFavourites());
      case mapRoute:
        return MaterialPageRoute(builder: (context) => MyMap(destination: settings.arguments));
      case profileRoute:
        return MaterialPageRoute(builder: (context) => MyProfile());
      case helpRoute:
        return MaterialPageRoute(builder: (context) => HelpScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}')),
              
          )
        );
    }
  }
}