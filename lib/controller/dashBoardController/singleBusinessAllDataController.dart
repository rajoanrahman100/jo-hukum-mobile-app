import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:johukum/components/apis.dart';
import 'package:johukum/modelClass/singleBusinessAllDataModel.dart';

class SingleBusinessAllDataController extends GetxController {
  var singleBusinessValue = SingleBusinessAllData().obs;
  var reviewList = [].obs;
  var totalReviewAvg = 0.0.obs;
  var totalReviewCount = 0.obs;
  var loaderShow = true.obs;

  var businessNameController=TextEditingController().obs;
  var streetAddressController=TextEditingController().obs;
  var landMarkController=TextEditingController().obs;
  var divisionController=TextEditingController().obs;
  var cityController=TextEditingController().obs;
  var areaController=TextEditingController().obs;

  var businessDivisionName="".obs;

  Future<void> getSingleBusinessData(slug) async {
    loaderShow.value = true;

    var response = await get(Uri.parse(singleBusinessApi + "$slug"), headers: {"agent": "jh_mobile_application"});
    print("Response= " + response.body);
    print("Response= " + response.statusCode.toString());
    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = jsonDecode(response.body);
      SingleBusinessAllData businessAllData = SingleBusinessAllData.fromJson(data);
      loaderShow.value = false;
      singleBusinessValue.value = businessAllData;
      reviewList.value = businessAllData.reviews;
      totalReviewAvg.value = businessAllData.aggregateRating;
      totalReviewCount.value = businessAllData.totalReviews;
      //reviewList.add(businessAllData.reviews);
    } else {
      loaderShow.value = false;
      throw ("Error code:: " + response.statusCode.toString());
    }
  }
}
