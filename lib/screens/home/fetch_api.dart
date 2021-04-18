import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart';
import 'package:johukum/components/apis.dart';
import 'package:johukum/modelClass/categoryClass.dart';
import 'package:johukum/modelClass/elasticSearchModel.dart';

Future<void> fetchCategory(Rx<CategoryClass> categoryDataClass) async {
  // make GET request
  var response = await get(Uri.parse(categoryApi));

  print("Response = " + response.body);

  if (response.statusCode == 200 || response.statusCode == 201) {
    var dataMap = jsonDecode(response.body);
    CategoryClass homeProductDataClass = CategoryClass.fromJson(dataMap);
    categoryDataClass.value = homeProductDataClass;
  } else {
    throw ("Error code " + response.statusCode.toString());
  }
}

