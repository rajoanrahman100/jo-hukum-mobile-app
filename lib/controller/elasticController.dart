import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:johukum/components/apis.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/modelClass/elasticSearchModel.dart';

class ElasticController extends GetxController{

  var elasticData = TestClass().obs;

  var categoryText="Choose Category".obs;

  var searchListSize=10.obs;

  var pageNumber=1.obs;

  var searchText="".obs;

  setListSize(){
    searchListSize.value++;
  }

  setPageNumber(){
    pageNumber.value=pageNumber.value+5;
  }

  setPageNumberWhileSearch(){
    pageNumber.value=0;

  }

  setSearchText(value){
    searchText.value=value;
    print(searchText.value);
  }

  @override
  void onInit() {
    super.onInit();
  }

  chooseCategory(categoryItems){
    categoryText.value=categoryItems;
  }



  /*Future<void> fetchElasticePost({int startFrom=0,String text})async{
    try{
      fetchElasticeData(text,startFrom);
    }catch(e){

    }
  }*/

  Future<void> fetchElasticeData({String text,int startForm,int size}) async {

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
      "size": size,
      "sort": [{
        "_geo_distance": {
          "geo": {
            "lat": boxStorage.read(LAT),
            "lon": boxStorage.read(LONG)
          },
          "order": "asc",
          "unit": "km"
        }
      }]
    });
    // make GET request
    var response = await post(
        Uri.parse(elasticSearch), headers: <String, String>{
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

  

}
