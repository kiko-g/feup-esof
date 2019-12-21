//Flutter widgets
import 'package:flutter/material.dart';

import '../../Router/RouterConstants.dart';

class BottomNavigationMenu extends StatefulWidget{
  _BottomNavigationMenu createState() => _BottomNavigationMenu();
}
class _BottomNavigationMenu extends State<StatefulWidget> {

  void _onItemTapped(int index) {
    setState(() {
      switch (index) {
        case 0:
          Navigator.pushNamed(context, mapRoute, arguments: "wc");
          break;
        case 1:
          Navigator.pushNamed(context, mapRoute, arguments: "machines");
          break;
        case 2:
          Navigator.pushNamed(context, mapRoute, arguments: "bar");
          break;
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
        title: Text('WC'),
        icon: Image.asset('assets/images/toilets.png'),
        ),
        BottomNavigationBarItem(
          title: Text('Coffee / Snack'),
          icon: Image.asset('assets/images/machine.png'),
        ),
        BottomNavigationBarItem(
          title: Text('Bar'),
          icon: Image.asset('assets/images/store.png'),
        ),
      ],
      onTap: _onItemTapped,
    );
  }
}
