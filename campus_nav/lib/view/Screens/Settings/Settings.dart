//Widgets
import 'package:flutter/material.dart';
//Themes
import 'package:dynamic_theme/dynamic_theme.dart';
//Controller
import 'package:campus_nav/controller/Controller.dart';

class MySettings extends StatefulWidget {
  @override
  State <StatefulWidget> createState() => MySettingsState();
}

class MySettingsState extends State<MySettings> {

  void onSelectedTheme(theme) => DynamicTheme.of(context).setBrightness(theme);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Campus NAV Settings', key: Key('Screen title'),),
      ),
      drawer: Controller.instance().getSideMenu(),
      body: Container(
        padding: new EdgeInsets.all(32.0),
        child: new Column(
          children: <Widget>[
            
            //seletor horizontal
            new SwitchListTile(
              title: Text('Dark Mode'),
              activeColor: Colors.white,
              value: DynamicTheme.of(context).brightness == Brightness.light ? false : true,
              onChanged: (bool value) { 
                setState(() {
                  value ? DynamicTheme.of(context).setBrightness(Brightness.dark) : DynamicTheme.of(context).setBrightness(Brightness.light);
                }); 
              },
            )
            
            
            //botoes verticais
            // Text(
            //   'Theme',
            //   textAlign: TextAlign.left,
            //   style: TextStyle(
            //     color: (Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white),
            //     fontWeight: FontWeight.bold,
            //     height: 1,
            //     fontSize: 24
            //   ),

            // ),
            // RadioListTile<Brightness>(
            //   value: Brightness.light,
            //   groupValue: Theme.of(context).brightness,
            //   onChanged: (Brightness value) {
            //     onSelectedTheme(Brightness.light);
            //   },
            //   title: const Text('Light'),
            // ),
            // RadioListTile<Brightness>(
            //   value: Brightness.dark,
            //   groupValue: Theme.of(context).brightness,
            //   onChanged: (Brightness value) {
            //     onSelectedTheme(Brightness.dark);
            //   },
            //   title: const Text('Dark'),
            // ),  
          ],
        ),
      ),
      //body: ,
    
    );
  }
}