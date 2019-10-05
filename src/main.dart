import 'package:flutter/material.dart';

void main() => runApp(CampusNAV());

class CampusNAV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus NAV',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Campus NAV'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ConferenceList(),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            ListTile(
              title: Text('Home Page'),
              leading: Icon(Icons.home),
            ),
            ListTile(
              title: Text('Favorites'),
              leading: Icon(Icons.star),
            ),
            ListTile(
              title: Text('Search'),
              leading: Icon(Icons.search),
            ),
          ],
        ),
      ),
    );
  }
}

class ConferenceList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
          ),
          title: Text('Conference A'),
          subtitle: Text('theme: A \nStarts: 10:30'),
          isThreeLine: true,
          dense: true,
          //onTap: function...,
          trailing: Icon(Icons.menu),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
          ),
          title: Text('Conference A'),
          subtitle: Text('theme: A \nStarts: 10:30'),
          isThreeLine: true,
          dense: true,
          //onTap: function...,
          trailing: Icon(Icons.menu),
          //onTap: function...,
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
          ),
          title: Text('Conference A'),
          subtitle: Text('theme: A \nStarts: 10:30'),
          isThreeLine: true,
          dense: true,
          //onTap: function...,
          trailing: Icon(Icons.menu),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
          ),
          title: Text('Conference A'),
          subtitle: Text('theme: A \nStarts: 10:30'),
          isThreeLine: true,
          dense: true,
          //onTap: function...,
          trailing: Icon(Icons.menu),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
          ),
          title: Text('Conference A'),
          subtitle: Text('theme: A \nStarts: 10:30'),
          isThreeLine: true,
          dense: true,
          //onTap: function...,
          trailing: Icon(Icons.menu),
        )
      ],
    );
  }
}
