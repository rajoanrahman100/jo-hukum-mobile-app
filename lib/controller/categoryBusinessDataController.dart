import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:johukum/components/apis.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/modelClass/categoryBusinessData.dart';

class CategoryBusinessDataController extends GetxController{


  var businessDataList=List<HitsChild>().obs;


  var searchListSize=10.obs;

  var pageNumber=0.obs;

  var businessCat="".obs;

  var totalValue=0.obs;

  setBusinessID(value){
    businessCat.value=value;
    print("value: "+value.toString());
  }

  setPaginateNumber(){
    pageNumber.value++;
    //elasticDataList.clear();
  }

  @override
  void onInit() {
    super.onInit();

    //fetchCategoryItems(pageNumber.value);
  }

  Future<void> getBusinessData({int startForm,int size,String catID})async{

    print("calling");
    print(catID);

    var data=await fetchBusinessData(startForm,size,catID);
    businessDataList.addAll(data);
    print(businessDataList.length);

  }

  Future<List<HitsChild>> fetchBusinessData(int startForm,int size,categoryId) async {

    print("start from $startForm");

    final json=jsonEncode({
      "query": {
        "bool": {
          "must": [{
            "query_string": {
              "fields": ["business_name"],
              "query": "* *",
              "analyzer": "simple",
              "default_operator": "AND"
            }
          }],
          "filter": {
            "term": {
              "categories": "$categoryId"
            }
          }
        }

      },
      "suggest": {
        "namesuggester": {
          "text": "* *",
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

    print("business data = " + response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      var dataMap = jsonDecode(response.body);
      CategoryBusinessData elasticSearchData = CategoryBusinessData.fromJson(dataMap);
      totalValue.value=elasticSearchData.hits.total.value;
      return elasticSearchData.hits.hits;
    } else {
      throw ("Error code " + response.statusCode.toString());
    }
  }


}