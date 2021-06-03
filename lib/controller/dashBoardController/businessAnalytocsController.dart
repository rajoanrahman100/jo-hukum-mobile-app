import 'dart:convert';

import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:johukum/components/apis.dart';
import 'package:johukum/modelClass/broweByDeviceModel.dart';
import 'package:johukum/modelClass/ctaClickCountModel.dart';
import 'package:johukum/modelClass/lineChartModel.dart';
import 'package:johukum/modelClass/visitByRegion.dart';
import 'package:johukum/modelClass/visitorsCountModel.dart';

class BusinessAnalyticsController extends GetxController{

  var visitorCount=VisitorsCount().obs;
  var ctaCount=CtaClickCount().obs;
  var browseByDevice=BrowseByDevice().obs;
  var regionVisit=VisitByRegion().obs;
  var elasticDataList=List<LineModel>().obs;

  var dateList=[].obs;
  var countList=[].obs;

  var chartDataList=[].obs;

  var fromDesktop=0.0.obs;
  var fromMobile=0.0.obs;
  var fromTablet=0.0.obs;

  setDateList(value){
    dateList.add(value);
    print("date length ${dateList.length}");
  }

  setCountListI(value){
    countList.add(value);
    print("count length ${dateList.length}");
  }

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
    var response = await get(Uri.parse(ctaClickApi+"$businessId?days=$days"));

    print("ResponseCta Count = " + response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      var dataMap = jsonDecode(response.body);
      CtaClickCount countData = CtaClickCount.fromJson(dataMap);
      ctaCount.value=countData;


    } else {
      throw ("Error code " + response.statusCode.toString());
    }
  }

  Future<void> getBrowseByDevice(businessId)async{
    var response = await get(Uri.parse(browseByDeviceApi+"$businessId"));

    print("Response devices= " + response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      var dataMap = jsonDecode(response.body);
      BrowseByDevice deviceData = BrowseByDevice.fromJson(dataMap);
      browseByDevice.value=deviceData;
      fromDesktop.value=deviceData.fromDesktop.toDouble();
      fromMobile.value=deviceData.fromMobile.toDouble();
      fromTablet.value=deviceData.fromTablet.toDouble();
    } else {
      throw ("Error code " + response.statusCode.toString());
    }
  }

  Future<void> getRegionVisit(businessId)async{
    var response = await get(Uri.parse(regionsVisitApi+"$businessId"));

    print("Response region= " + response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      var dataMap = jsonDecode(response.body);
      VisitByRegion regionData = VisitByRegion.fromJson(dataMap);
      regionVisit.value=regionData;

    } else {
      throw ("Error code " + response.statusCode.toString());
    }
  }

  Future<void> getSearchLineData(businessId)async{
    var response = await get(Uri.parse(searchLineChartApi+"$businessId&year=2021&month=5"));

    print("Response pie chart= " + response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String,dynamic> dataMap = jsonDecode(response.body);

      dataMap.forEach((key, value) {
        if(key!="url"){
          elasticDataList.add(LineModel(date: key,count: value));

          print(elasticDataList);
          //setDateList(key);
          //setCountListI(value);
        }
      });

    } else {
      throw ("Error code " + response.statusCode.toString());
    }
  }


}