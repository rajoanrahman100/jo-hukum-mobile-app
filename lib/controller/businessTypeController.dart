import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:johukum/components/apis.dart';
import 'package:johukum/modelClass/businessTypeModel.dart';

class BusinessTypeController extends GetxController{
  var businessClass = BusinessTypeModel().obs;

  var businessTypeName="".obs;
  var businessTypeId="0".obs;

  setBusinessIdName(businessType,businessId){
    businessTypeId.value=businessId;
    businessTypeName.value=businessType;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchBusinessType();
  }

  Future<void> fetchBusinessType() async {
    // make GET request
    var response = await get(Uri.parse(businessType));

    print("Response = " + response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      var dataMap = jsonDecode(response.body);
      BusinessTypeModel buinsessdDataClass = BusinessTypeModel.fromJson(dataMap);
      businessClass.value = buinsessdDataClass;
    } else {
      throw ("Error code " + response.statusCode.toString());
    }
  }

}