//Flutter widgets
import 'package:flutter/material.dart';
//Router Constants
import 'package:campus_nav/view/router/RouterConstants.dart';

class SideMenu extends StatelessWidget {
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
                    Navigator.pushNamed(context, homeRoute);
                  },  
                ),
                Divider(thickness: 5,),
                
                ListTile(
                  title: Text('Profile'),
                  leading: Icon(Icons.person),
                  onTap: () {
                    Navigator.pushNamed(context, profileRoute);
                  },            
                ),
                Divider(thickness: 5,),
                
                ListTile(
                  title: Text('Favorites'),
                  leading: Icon(Icons.star),
                  onTap: () {
                    Navigator.pushNamed(context, favouritesRoute);
                  },       
                ),
                Divider(thickness: 5,),
                
                ListTile(
                  title: Text('Settings'),
                  leading: Icon(Icons.settings),
                  onTap: () {
                    Navigator.pushNamed(context, settingsRoute);
                  },
                ),
                Divider(thickness: 5,),

                ListTile(
                  title: Text('Help'),
                  leading: Icon(Icons.help),
                  onTap: () {
                    Navigator.pushNamed(context, helpRoute);
                  },
                ),
                Divider(thickness: 5,),
              ],
      ),
    );
  }

}