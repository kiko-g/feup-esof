//Flutter widgets
import 'package:flutter/material.dart';
//Change between dark and light mode
import 'package:dynamic_theme/dynamic_theme.dart';
//Homepage screen
import 'homepage_screen.dart';

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
            title: 'Campus NAV',
            theme: theme,
            home: MyHomePage(title: 'Campus NAV'),
          );
        }
    );
  }
}
