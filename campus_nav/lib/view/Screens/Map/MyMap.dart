//Flutter widgets
import 'package:campus_nav/controller/Controller.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class MyMap extends StatefulWidget {
  @override
  State<MyMap> createState() => MyMapState();
}

class MyMapState extends State<MyMap> {
  Completer<GoogleMapController> _controller = Completer();
  final String title = 'Campus NAV';
  static final CameraPosition _feup = CameraPosition(
      target: LatLng(41.1777116, -8.5956333),
      zoom: 19.89,
    );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar( title: Text(title), ),
        body: GoogleMap(
          mapType: MapType.terrain,
          initialCameraPosition: _feup,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },        
        ),
        drawer: Controller.instance().getSideMenu()

    );
  }
}
