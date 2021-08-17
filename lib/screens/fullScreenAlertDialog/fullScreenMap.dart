

import 'dart:ffi';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/widgets/textWidgets.dart';

class FullScreenMap extends StatelessWidget {

  double lat;
  double long;
  String businessName;

  FullScreenMap({this.lat,this.long,this.businessName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryPurple,
        title: Column(
          crossAxisAlignment: crossAxisAlignmentStart,
          children: [
            textUbuntu("$businessName", kWhiteColor,fontSize: 16.0,fontWeight: weight500),
          ],
        ),
      ),
      body: FlutterMap(
        options: new MapOptions(
          center: new LatLng(lat, long),
          zoom: 13.0,
        ),
        layers: [
          new TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c']
          ),
          new MarkerLayerOptions(
            markers: [
              new Marker(
                width: 80.0,
                height: 80.0,
                point: new LatLng(lat, long),
                builder: (ctx) =>
                new Container(
                  child: new Icon(Icons.location_on,color: kPrimaryPurple,size: 40,),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}



void openFullScreenMap(BuildContext context,lat,long,businessName) {
  Navigator.of(context).push(new MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return FullScreenMap(lat: lat,long: long,businessName: businessName,);
      },
      fullscreenDialog: true));
}