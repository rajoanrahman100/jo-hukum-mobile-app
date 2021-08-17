import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/controller/locationController.dart';
import 'package:johukum/controller/proximitySearchController.dart';
import 'package:johukum/widgets/addBusinessForm.dart';
import 'package:johukum/widgets/textWidgets.dart';
import 'package:latlong2/latlong.dart';
class ProximityMapSearch extends StatelessWidget {

  var proximityController=Get.put(ProximitySearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryPurple,
        title: Column(
          crossAxisAlignment: crossAxisAlignmentStart,
          children: [
            textUbuntu("Location Search", kWhiteColor,fontSize: 16.0,fontWeight: weight500),
          ],
        ),
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: new MapOptions(
              center: new LatLng(Get.find<LocationController>().latitude.value,
                  Get.find<LocationController>().longitude.value),
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
                    point: new LatLng(Get.find<LocationController>().latitude.value,
                        Get.find<LocationController>().longitude.value),
                    builder: (ctx) =>
                    new Container(
                      child: new Icon(Icons.location_on,color: kPrimaryPurple,size: 40,),
                    ),
                  ),
                ],
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: AddBusinessForm(
              isSuffix: true,
              suffixIcon: Icon(Icons.search,color: kPrimaryPurple,),
              hintText: "search location",
              onChange: (String value){
                proximityController.searchText.value=value;
                print(proximityController.searchText.value);
                proximityController.getProximityResult(proximityController.searchText.value);
              },

            ),
          ),
        ],
      )
    );
  }
}

void openFullScreenProximityMap(BuildContext context) {
  Navigator.of(context).push(new MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return ProximityMapSearch();
      },
      fullscreenDialog: true));
}