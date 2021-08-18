import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/controller/locationController.dart';
import 'package:johukum/controller/proximitySearchController.dart';
import 'package:johukum/widgets/textWidgets.dart';
import 'package:latlong2/latlong.dart';

class ProximityMapSearch extends StatelessWidget {
  var proximityController = Get.put(ProximitySearchController());
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryPurple,
          title: Obx(
            () => proximityController.openTextField.value == false
                ? textUbuntu("${proximityController.searchText.value}", kWhiteColor, fontSize: 16.0, fontWeight: weight500)
                : TextField(
                    controller: controller,
                    style: textStyleUbuntu(color: Colors.white),
                    onChanged: (String value) {
                      proximityController.areaWithGeoList.clear();
                      proximityController.locationPicked.value = false;
                      print(proximityController.searchText.value);
                      proximityController.getProximityResult(value.capitalizeFirst);
                    },
                    autofocus: false,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: "serach location",
                      hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                    ),
                  ),
          ),
          actions: [
            Obx(() => IconButton(
                onPressed: () {
                  proximityController.openTextField.value = !proximityController.openTextField.value;
                },
                icon: proximityController.openTextField.value == false
                    ? Icon(
                        Icons.search,
                        size: 20,
                      )
                    : Icon(
                        Icons.arrow_forward,
                        size: 20,
                      )))
          ],
        ),
        body: Obx(() => Stack(
              children: [
                FlutterMap(
                  options: new MapOptions(
                    center: new LatLng(Get.find<LocationController>().latitude.value, Get.find<LocationController>().longitude.value),
                    zoom: 12.0,
                  ),
                  layers: [
                    new TileLayerOptions(urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", subdomains: ['a', 'b', 'c']),
                    new MarkerLayerOptions(
                      markers: [
                        new Marker(
                          width: 80.0,
                          height: 80.0,
                          point: new LatLng(Get.find<LocationController>().latitude.value, Get.find<LocationController>().longitude.value),
                          builder: (ctx) => new Container(
                            child: new Icon(
                              Icons.location_on,
                              color: kPrimaryPurple,
                              size: 40,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                proximityController.locationPicked.value == false
                    ? SizedBox(
                        child: ListView.builder(
                          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                          itemCount: proximityController.areaWithGeoList.length,
                          itemBuilder: (_, index) {
                            return GestureDetector(
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  proximityController.searchText.value = proximityController.areaWithGeoList[index].areaName;
                                  Get.find<LocationController>().latitude.value = proximityController.areaWithGeoList[index].geo[1];
                                  Get.find<LocationController>().longitude.value = proximityController.areaWithGeoList[index].geo[0];
                                  proximityController.locationPicked.value = true;
                                  // print(proximityController.areaWithGeoList[index].geo);
                                },
                                child: Container(
                                    color: Colors.white,
                                    padding: EdgeInsets.all(10.0),
                                    child: Row(
                                      children: [
                                        Icon(Icons.location_on, color: kPrimaryPurple),
                                        width10,
                                        Expanded(child: textUbuntu("${proximityController.areaWithGeoList[index].areaName}", kPrimaryPurple, maxLine: 2)),
                                      ],
                                    )));
                          },
                        ),
                      )
                    : Container(
                        height: 40.0,
                        margin: EdgeInsets.all(20.0),
                        padding: EdgeInsets.all(5.0),
                        decoration: containerBoxDecoration(color: kPrimaryPurple, borderRadius: 5.0),
                        child: Center(child: Row(
                          children: [
                            Icon(Icons.location_on,color: Colors.white,size: 18.0,),
                            width5,
                            Expanded(child: textUbuntu("${proximityController.searchText.value}", Colors.white,maxLine: 2)),
                          ],
                        )),
                      )
              ],
            )));
  }
}

void openFullScreenProximityMap(BuildContext context) {
  Navigator.of(context).push(new MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return ProximityMapSearch();
      },
      fullscreenDialog: true));
}
