//Flutter widgets
import 'dart:convert';

import 'package:campus_nav/controller/Controller.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission/permission.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

class MyMap extends StatefulWidget {
  final String destination;

  MyMap({this.destination});
  @override
  State<MyMap> createState() => MyMapState(destination: destination);
}

class MyMapState extends State<MyMap> {
  final String title = 'Campus NAV';
  static final CameraPosition _feup = CameraPosition(
    target: LatLng(41.1777116, -8.5956333),
    zoom: 19.89,
  );

  String destination;

  Set<Marker> markers = {};

  Set<Polyline> lines = {};

  getPermissions() async {
    await Permission.getPermissionsStatus(
        [PermissionName.Storage, PermissionName.Location]);

    await Permission.requestPermissions(
        [PermissionName.Storage, PermissionName.Location]);
  }

  Future<Post> getRoute(double destinationLat, double destinationLon) async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    if (position == null) return null;

    double posLatitude = position.latitude;
    double posLongitude = position.longitude;

    var response = await http.get(
        'https://maps.googleapis.com/maps/api/directions/json?origin=$posLatitude,$posLongitude&destination=$destinationLat,$destinationLon&key=AIzaSyADUbOWG6DGbd6-ugkm5vhm1Fvgmbz3SVA&mode=walking');

    if (response.statusCode != 200) return null;

    return Post.fromJson(jsonDecode(response.body));
  }

  Polyline getLine(Post route) {
    if (route == null) return null;

    List<LatLng> points;
    LatLng end;
    for (Map step in route.routes['legs']['steps']) {
      points.add(
          LatLng(step['start_location']['lat'], step['start_location']['lng']));
      end = LatLng(step['end_location']['lat'], step['end_location']['lng']);
    }

    points.add(end);

    return Polyline(
      points: points,
      polylineId: new PolylineId('path'),
    );
  }

  MyMapState({this.destination});

  @override
  void initState() {
    super.initState();

    getPermissions();

    var positions = Controller.instance().getDestiantions();

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
          if (destination == conf[4]) {
            icon =
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);

            Marker marker = new Marker(markerId: id, icon: icon, position: pos);

            markers.add(marker);

            var route = getRoute(pos.latitude, pos.longitude).then((route) {
              return getLine(route);
            });
            if (route != null) {
              route.then((route) {
                lines.add(route);
              });
            }
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
          Marker marker = new Marker(markerId: id, icon: icon, position: pos);

          markers.add(marker);
        }
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
          polylines: lines,
          indoorViewEnabled: true,
          myLocationEnabled: true,
        ),
        drawer: Controller.instance().getSideMenu());
  }
}

class Post {
  final Map<String, dynamic> geocodedWaypoints;
  final Map<String, dynamic> routes;
  final String status;

  Post({this.geocodedWaypoints, this.routes, this.status});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      geocodedWaypoints: json['geocoded_waypoints'],
      routes: json['routes'],
      status: json['status'],
    );
  }
}
