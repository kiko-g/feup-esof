//Flutter widgets
import 'package:flutter/material.dart';

import '../../../controller/Controller.dart';
import '../../Router/RouterConstants.dart';

class BottomNavigationMenu extends StatefulWidget{
  _BottomNavigationMenu createState() => _BottomNavigationMenu();
}
class _BottomNavigationMenu extends State<StatefulWidget> {

  void _onItemTapped(int index) {
    setState(() {
      switch (index) {
        case 0:
          Controller.instance().addHasDestination("wc");
          break;
        case 1:
          Controller.instance().addHasDestination("machine");
          break;
        case 2:
          Controller.instance().addHasDestination("coffee");
          break;
      }
      
      Navigator.pushNamed(context, mapRoute);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
        title: Text('WC\n'),
        icon: Image.asset('assets/images/toilets.png'),
        ),
        BottomNavigationBarItem(
          title: Text('Vending Machine\n'),
          icon: Image.asset('assets/images/machine.png'),
        ),
        BottomNavigationBarItem(
          title: Text('Coffee Machine\n'),
          icon: Image.asset('assets/images/coffee-machine.png'),
        ),
      ],
      onTap: _onItemTapped,
    );
  }
}
