import 'dart:convert';
import 'package:http/http.dart';
import 'package:get/get.dart';
import 'package:johukum/components/apis.dart';
import 'package:johukum/modelClass/keywordClass.dart';

class KeywordController extends GetxController{


  var keywordClass = KeywordClass().obs;

  var keywordList=[].obs;


  onSelect(item,bool value){
    print("select");
    keywordList.add(item);
    print("add length${keywordList.length}");

  }

  onRemove(item,bool value){
    keywordList.remove(item);
    print("remove length${keywordList.length}");

  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchKeyword();
  }


  Future<void> fetchKeyword() async {
    // make GET request
    var response = await get(Uri.parse(keyword));

    print("Response = " + response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      var dataMap = jsonDecode(response.body);
      KeywordClass keywordDataClass = KeywordClass.fromJson(dataMap);
      keywordClass.value = keywordDataClass;
    } else {
      throw ("Error code " + response.statusCode.toString());
    }
  }

}