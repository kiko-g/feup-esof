import 'package:flutter/material.dart';

//Acess to Home Page module
import 'main.dart';
//Acess to Profile module
import 'profile.dart';
//Acess to Favourites module
import 'favourites.dart';
//Acess to Settings module
import 'settings.dart';
//Acess to Help module
import 'help.dart';


class AppDrawer extends StatelessWidget {
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
                      builder: (BuildContext context) => MyHomePage(title: "Campus NAV",)));
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
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => MySettings()));
                  },
                ),
                Divider(thickness: 5,),

                ListTile(
                  title: Text('Help'),
                  leading: Icon(Icons.help),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Help()));
                  },
                ),
                Divider(thickness: 5,),
              ],
      ),
    );
  }

}