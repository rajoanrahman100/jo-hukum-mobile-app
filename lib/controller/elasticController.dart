import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:johukum/components/apis.dart';
import 'package:johukum/modelClass/elasticSearchModel.dart';

class ElasticController extends GetxController{

  var elasticData = TestClass().obs;

  var categoryText="Choose Category".obs;

  var scrollController=ScrollController().obs;

  @override
  void onInit() {
    super.onInit();

  }

  chooseCategory(categoryItems){
    categoryText.value=categoryItems;
  }

  Future<void> fetchElasticeData(String text,int startForm) async {

    final json=jsonEncode({
      "query": {
        "bool": {
          "must": [{
            "query_string": {
              "fields": ["business_name"],
              "query": "*$text*",
              "analyzer": "simple",
              "default_operator": "AND"
            }
          }]
        }

      },
      "suggest": {
        "namesuggester": {
          "text": "*$text*",
          "term": {
            "field": "business_name"
          }
        }
      },
      "from": startForm,
      "size": 10,
      "sort": [{
        "_geo_distance": {
          "geo": {
            "lat": 23.7138199,
            "lon": 90.4297414
          },
          "order": "asc",
          "unit": "km"
        }
      }]
    });
    // make GET request
    var response = await post(
        elasticSearch, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Basic ZWxhc3RpYzpKcnM5NTU3aGNTanNOMkJKZkpsTg==',
    },body: json);

    print("elastic response = " + response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      var dataMap = jsonDecode(response.body);
      TestClass elasticSearchData = TestClass.fromJson(dataMap);
      elasticData.value = elasticSearchData;
    } else {
      throw ("Error code " + response.statusCode.toString());
    }
  }


  fetchTen(txt){
    var i;
    for(i=0;i<10;i++){
      fetchElasticeData(txt,i);
    }
  }

}