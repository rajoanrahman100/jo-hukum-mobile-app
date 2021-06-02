import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:johukum/components/apis.dart';
import 'package:johukum/modelClass/ctaClickCountModel.dart';
import 'package:johukum/modelClass/visitorsCountModel.dart';

class BusinessAnalyticsController extends GetxController{

  var visitorCount=VisitorsCount().obs;
  var ctaCount=CtaClickCount().obs;


  Future<void> getVisitorCount(businessId,days)async{
    var response = await get(Uri.parse(visitorsApi+"$businessId&days=$days"));

    print("ResponsefetchCategory = " + response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      var dataMap = jsonDecode(response.body);
      VisitorsCount countData = VisitorsCount.fromJson(dataMap);
      visitorCount.value=countData;


    } else {
      throw ("Error code " + response.statusCode.toString());
    }
  }

  Future<void> getCtaCount(businessId,days)async{
    var response = await get(Uri.parse(ctaClickApi+"$businessId&days=$days"));

    print("ResponseCta Count = " + response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      var dataMap = jsonDecode(response.body);
      CtaClickCount countData = CtaClickCount.fromJson(dataMap);
      ctaCount.value=countData;


    } else {
      throw ("Error code " + response.statusCode.toString());
    }
  }

}