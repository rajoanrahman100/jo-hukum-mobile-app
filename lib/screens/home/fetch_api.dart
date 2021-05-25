import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart';
import 'package:johukum/components/apis.dart';
import 'package:johukum/modelClass/categoryClass.dart';
import 'package:johukum/modelClass/cityModel.dart';
import 'package:johukum/modelClass/divisionModel.dart';

Future<void> fetchCategory(Rx<CategoryClass> categoryDataClass,pageNumber,RxList<Results2> result) async {
  // make GET request
  var response = await get(Uri.parse(categoryApi+"?"+"page=$pageNumber"));

  print("ResponsefetchCategory = " + response.body);

  if (response.statusCode == 200 || response.statusCode == 201) {
    var dataMap = jsonDecode(response.body);
    CategoryClass homeProductDataClass = CategoryClass.fromJson(dataMap);
    categoryDataClass.value = homeProductDataClass;

    //result.add(homeProductDataClass.results);

  } else {
    throw ("Error code " + response.statusCode.toString());
  }
}



Future<void> fetchDivisions(Rx<DivisionModelClass> divisionModelClass) async {
  // make GET request
  var response = await get(Uri.parse(allDivisions));

  print("Response = " + response.body);

  if (response.statusCode == 200 || response.statusCode == 201) {
    var dataMap = jsonDecode(response.body);
    DivisionModelClass divisionDataClass = DivisionModelClass.fromJson(dataMap);
    divisionModelClass.value = divisionDataClass;
  } else {
    throw ("Error code " + response.statusCode.toString());
  }
}


Future<void> fetchCity(Rx<CityModelClass> cityModelClass,divId,queryTxt) async {
  // make GET request
  var response = await get(Uri.parse(allCity+divId+"&search="+queryTxt));

  print("Response = " + response.body);

  if (response.statusCode == 200 || response.statusCode == 201) {
    var dataMap = jsonDecode(response.body);
    CityModelClass cityDataClass = CityModelClass.fromJson(dataMap);
    cityModelClass.value = cityDataClass;
  } else {
    throw ("Error code " + response.statusCode.toString());
  }
}





