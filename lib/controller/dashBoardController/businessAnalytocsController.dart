import 'dart:convert';

import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:johukum/components/apis.dart';
import 'package:johukum/modelClass/broweByDeviceModel.dart';
import 'package:johukum/modelClass/businessStayingTimeModel.dart';
import 'package:johukum/modelClass/ctaClickCountModel.dart';
import 'package:johukum/modelClass/lineChartModel.dart';
import 'package:johukum/modelClass/visitByRegion.dart';
import 'package:johukum/modelClass/visitorsCountModel.dart';

class BusinessAnalyticsController extends GetxController{

  var visitorCount=VisitorsCount().obs;
  var ctaCount=CtaClickCount().obs;
  var browseByDevice=BrowseByDevice().obs;
  var regionVisit=VisitByRegion().obs;
  var lineChartDataList=List<LineModel>().obs;

  var totalCount=0.obs;

  var dateList=[].obs;
  var countList=[].obs;

  var chartDataList=[].obs;

  var fromDesktop=0.0.obs;
  var fromMobile=0.0.obs;
  var fromTablet=0.0.obs;

  var activeStay=0.0.obs;
  var idleStay=0.0.obs;

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

    print("Visitor count body = " + response.body);
    print("Visitor count code = " + response.statusCode.toString());

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
    print("Count status code = " + response.statusCode.toString());

    if (response.statusCode == 200 || response.statusCode == 201) {

      var dataMap = jsonDecode(response.body);
      print("desktop count: ${dataMap["from_desktop"]}");
      CtaClickCount countData = CtaClickCount.fromJson(dataMap);
      ctaCount.value=countData;
      totalCount.value=(countData.fromDesktop==null?0:countData.fromDesktop)+
          (countData.fromMobile==null?0:countData.fromMobile);

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

    print("region business id $businessId");
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


  Future<void> getStayingData(businessId)async{

    print("my id for staying $businessId");

    var response = await get(Uri.parse(stayingTimeApi+"$businessId"));

    print("Response staying data= " + response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      var dataMap = jsonDecode(response.body);
      BusinessStayingTime stayingTime = BusinessStayingTime.fromJson(dataMap);
      activeStay.value=stayingTime.activeStay;
      idleStay.value=stayingTime.idleStay;

    } else {
      throw ("Error code " + response.statusCode.toString());
    }
  }


}