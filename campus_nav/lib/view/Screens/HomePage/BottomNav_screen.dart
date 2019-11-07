//Flutter widgets
import 'package:flutter/material.dart';

class BottomNavigationMenu extends StatelessWidget {
  
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
          title: Text('Coffe Machine\n'),
          icon: Image.asset('assets/images/coffee-machine.png'),
        ),
       
      ],
    );
  }
}
