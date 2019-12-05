//Flutter widgets
import 'package:campus_nav/controller/Controller.dart';
import 'package:flutter/material.dart';
import 'dart:async';
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

  Set markers = <Marker>{};

  @override
  void initState() {
    
    super.initState();

    var positions = Controller.instance().getRooms();

    for(var conf in Controller.instance().getConferences()) {
      var room = conf[4];
      LatLng pos = new LatLng(positions[room][0], positions[room][1]);
      var id = new MarkerId(conf[0]);
      var icon;

      if(Controller.instance().getHasDestination() != 'false'){
        if(Controller.instance().getHasDestination() != conf[0]){
          icon = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure);
        }
        else{
          icon = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);
        }
      }
      else{
        if(!Controller.instance().checkFavourite(conf[0])){
          icon = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure);
        }
        else{
          icon = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);
        }
      }
      
      Marker marker = new Marker(
        markerId: id,
        icon: icon,
        position: pos
      );

      markers.add(marker);
    }

    Controller.instance().removeHasDestination();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar( title: Text(title), ),
        body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _feup,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          }, 
          markers: markers,
          indoorViewEnabled: true,
          myLocationEnabled: true,       
        ),
        drawer: Controller.instance().getSideMenu()

    );
  }
}
