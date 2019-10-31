//Flutter widgets
import 'package:flutter/material.dart';
//Flutter Themes
import 'package:dynamic_theme/dynamic_theme.dart';
//Router
import 'package:campus_nav/view/router/Router.dart';
//Router constants
import 'package:campus_nav/view/router/RouterConstants.dart';


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
          theme: theme,
          onGenerateRoute: Router.generateRoute,
          initialRoute: homeRoute,
        );
      }
    );
  }
}
