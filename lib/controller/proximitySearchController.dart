import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:johukum/components/apis.dart';
import 'package:johukum/modelClass/proximityDataModel.dart';

class ProximitySearchController extends GetxController {
  var searchText = "".obs;
  var proximityData = ProximityDataModel().obs;
  var areaList = [].obs;

  List<AreaWithGeo> areaWithGeoList = List<AreaWithGeo>().obs;

  var openTextField = false.obs;

  var locationPicked=false.obs;

  setValues(bool picked){
    locationPicked.value=picked;
  }

  getProximityResult(searchText) async {
    final json = jsonEncode({
      "query": {
        "multi_match": {
          "query": "$searchText",
          "type": "phrase_prefix",
          "fields": ["building", "street", "land_mark", "area", "division", "city", "thana"],
          "operator": "and"
        }
      },
      "from": 0,
      "size": 10,
      "sort": [],
      "aggs": {}
    });

    var response = await post(Uri.parse(proximitySearch),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Basic ZWxhc3RpYzpKcnM5NTU3aGNTanNOMkJKZkpsTg==',
        },
        body: json);

    // print("proximity response = " + response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      var dataMap = jsonDecode(response.body);
      ProximityDataModel dataModel = ProximityDataModel.fromJson(dataMap);
      proximityData.value = dataModel;

      dataModel.hits.hits.forEach((element) {
        if (element.sSource.street.contains(searchText)) {
          areaWithGeoList.add(AreaWithGeo(areaName: element.sSource.street, geo: element.sSource.geo));
          print("$areaWithGeoList");
        } else if (element.sSource.street.contains(searchText) || element.sSource.landMark.contains(searchText)) {
          areaWithGeoList.add(AreaWithGeo(areaName: "${element.sSource.street+element.sSource.landMark}", geo: element.sSource.geo));
          print("$areaWithGeoList");
        } else if (element.sSource.street.contains(searchText) || element.sSource.landMark.contains(searchText) || element.sSource.area.contains(searchText)) {
          areaWithGeoList.add(AreaWithGeo(areaName: "${element.sSource.street+element.sSource.landMark+element.sSource.area}", geo: element.sSource.geo));
          print("$areaWithGeoList");
        }
      });
    } else {
      throw ("Error code " + response.statusCode.toString());
    }
  }

  getLocationName(double lat, double long, RxList areaList) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
    Placemark place = placemarks[0];
    var _currentAddress = "${place.street}, ${place.subLocality}, ${place.locality}";
    areaList.add(_currentAddress);
    print(_currentAddress);
  }
}
