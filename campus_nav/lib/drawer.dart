import 'package:flutter/material.dart';
import 'main.dart';
import 'profile.dart';
import 'favourites.dart';
import 'settings.dart';
import 'help.dart';

class AppDrawer extends StatelessWidget {

  final context1; //é preciso passar o msm context para build?
  AppDrawer(this.context1);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
              children: <Widget>[
                DrawerHeader(
                  child: Text(''),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/logo.png'),
                      fit: BoxFit.cover,
                    )
                  ),
                ),            
                
                ListTile(
                  title: Text('Home Page'),
                  leading: Icon(Icons.home),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => MyHomePage(title: 'Campus NAV')));
                  },
                ),
                Divider(thickness: 5,),
                
                ListTile(
                  title: Text('Profile'),
                  leading: Icon(Icons.person),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => MyProfile()));
                  },            
                ),
                Divider(thickness: 5,),
                
                ListTile(
                  title: Text('Favorites'),
                  leading: Icon(Icons.star),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => MyFavourites()));
                  },       
                ),
                Divider(thickness: 5,),
                
                ListTile(
                  title: Text('Settings'),
                  leading: Icon(Icons.settings),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) =>MySettings()),
                    );
                  },
                ),
                Divider(thickness: 5,),

                ListTile(
                  title: Text('Help'),
                  leading: Icon(Icons.help),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Divider(thickness: 5,),
              ],
      ),
    );
  }
}



