//Constants used in Route
import 'package:campus_nav/view/Router/RouterConstants.dart';
//Widgets
import 'package:flutter/material.dart';
//Home Page
import 'package:campus_nav/view/screens/HomePage/homepage_screen.dart';
//Help Page
import 'package:campus_nav/view/Screens/Help/help_screen.dart';
//Settings Page
import 'package:campus_nav/view/screens/Settings/Settings.dart';
//Favourites Page
import 'package:campus_nav/view/screens/Favourites/Favourites_screen.dart';
//Profile Page
import 'package:campus_nav/view/screens/Profile/Profile_screen.dart';
//Map Page
import 'package:campus_nav/view/Screens/Map/MyMap.dart';

class Router {
    static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => MyHomePage(title: 'Campus NAV',));
      case settingsRoute:
        return MaterialPageRoute(builder: (_) => MySettings());
      case favouritesRoute:
        return MaterialPageRoute(builder: (_) => MyFavourites());
      case mapRoute:
        return MaterialPageRoute(builder: (_) => MyMap());
      case profileRoute:
        return MaterialPageRoute(builder: (_) => MyProfile());
      case helpRoute:
        return MaterialPageRoute(builder: (_) => HelpScreen());
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