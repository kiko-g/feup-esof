//Flutter widgets
import 'package:campus_nav/controller/Controller.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission/permission.dart';

class MyMap extends StatefulWidget {
  @override
  State<MyMap> createState() => MyMapState();
}

class MyMapState extends State<MyMap> {
  final String title = 'Campus NAV';
  static final CameraPosition _feup = CameraPosition(
    target: LatLng(41.1777116, -8.5956333),
    zoom: 19.89,
  );

  Set markers = <Marker>{};

  getPermissions() async {
    var permissions = await Permission.getPermissionsStatus(
        [PermissionName.Storage, PermissionName.Location]);

    var permissionsNames = await Permission.requestPermissions(
        [PermissionName.Storage, PermissionName.Location]);
  }

  @override
  void initState() {
    super.initState();

    getPermissions();

    var positions = Controller.instance().getDestiantions();
    var destination = Controller.instance().getHasDestination();

    // Executes when user opens map through lower homepage destination shortcuts
    if (destination == 'wc' ||
        destination == 'machine' ||
        destination == 'coffee') {
      var coordList = positions[destination];

      for (var coords in coordList) {
        LatLng pos = new LatLng(coords[0], coords[1]);
        var id = new MarkerId(destination);
        var icon =
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);

        Marker marker = new Marker(markerId: id, icon: icon, position: pos);

        markers.add(marker);
      }
    } else {
      for (var conf in Controller.instance().getConferences()) {
        var room = conf[4];
        LatLng pos = new LatLng(positions[room][0][0], positions[room][0][1]);
        var id = new MarkerId(conf[0]);
        var icon;

        // Executes when map destination is a conference
        if (destination != 'false') {
          if (destination != conf[0]) {
            icon = BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueAzure);
          } else {
            icon =
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);
          }
        }
        // Executes when map is opened by router aka no destination set
        else {
          if (!Controller.instance().checkFavourite(conf[0])) {
            icon = BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueAzure);
          } else {
            icon =
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);
          }
        }

        Marker marker = new Marker(markerId: id, icon: icon, position: pos);

        markers.add(marker);
      }
    }

    Controller.instance().removeHasDestination();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _feup,
          onMapCreated: (GoogleMapController controller) {
            Completer().complete(controller);
          },
          markers: markers,
          indoorViewEnabled: true,
          myLocationEnabled: true,
        ),
        drawer: Controller.instance().getSideMenu());
  }
}
