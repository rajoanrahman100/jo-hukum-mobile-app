import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:johukum/components/apis.dart';
import 'package:johukum/modelClass/cityModel.dart';
import 'package:johukum/modelClass/divisionModel.dart';
import 'package:johukum/modelClass/thanaModel.dart';
import 'package:johukum/screens/home/fetch_api.dart';

 class DivisionController extends GetxController{
  var divisionModelClass = DivisionModelClass().obs;
  var cityModelClass = CityModelClass().obs;
  var thanaModelClass = ThanaModelClass().obs;

  var selectDivision="select divison".obs;
  var selectDivisionId="0".obs;
  var selectCity="select city".obs;
  var selectCityId="0".obs;
  var selectThana="select thana".obs;
  var selectThanaId="0".obs;


  setDivisionID(id){
    selectDivisionId.value=id;
  }

  setCityID(id){
    selectCityId.value=id;
    print(selectCityId.value);
  }

  setThanaID(id){
    selectThanaId.value=id;
  }

  setDivision(value){
    selectDivision.value=value;
  }

  setCity(value){
    selectCity.value=value;
  }

  setThana(value){
    selectThana.value=value;
  }


  Future<void> fetchCity(divId,queryTxt) async {
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


  Future<void> fetchThana(cityId,queryTxt) async {
    // make GET request
    var response = await get(Uri.parse(allThana+cityId+"&search="+queryTxt));

    print("Response = " + response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      var dataMap = jsonDecode(response.body);
      ThanaModelClass thanaDataClass = ThanaModelClass.fromJson(dataMap);
      thanaModelClass.value = thanaDataClass;
    } else {
      throw ("Error code " + response.statusCode.toString());
    }
  }

  //${this.city.id}&search=${query}

  @override
  void onInit() {
    super.onInit();
    fetchDivisions(divisionModelClass);
  }

}