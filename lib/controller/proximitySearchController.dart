import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:johukum/components/apis.dart';
import 'package:johukum/modelClass/proximityDataModel.dart';

class ProximitySearchController extends GetxController{

  var searchText="".obs;
  var proximityData=ProximityDataModel().obs;
  var areaList=[].obs;

  getProximityResult(searchText)async{

    final json=jsonEncode({
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

    var response = await post(
        Uri.parse(proximitySearch), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Basic ZWxhc3RpYzpKcnM5NTU3aGNTanNOMkJKZkpsTg==',
    },body: json);

   // print("proximity response = " + response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      var dataMap = jsonDecode(response.body);
      ProximityDataModel dataModel=ProximityDataModel.fromJson(dataMap);
      proximityData.value=dataModel;
      proximityData.value.hits.hits.forEach((element) {
        if(element.sSource.building.contains(searchText)){
          areaList.add(element.sSource.building);
          print("$areaList");
        }else if(element.sSource.street.contains(searchText)){
          areaList.add(element.sSource.street);
          print("$areaList");
        }else if(element.sSource.landMark.contains(searchText)){
          areaList.add(element.sSource.landMark);
          print("$areaList");
        }else if(element.sSource.area.contains(searchText)){
          areaList.add(element.sSource.area);
          print("$areaList");
        }else if(element.sSource.division.contains(searchText)){
          areaList.add(element.sSource.division);
          print("$areaList");
        }else if(element.sSource.city.contains(searchText)){
          areaList.add(element.sSource.city);
          print("$areaList");
        }
      });

    } else {
      throw ("Error code " + response.statusCode.toString());
    }

  }

}