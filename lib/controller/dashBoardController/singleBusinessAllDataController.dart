import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:johukum/components/apis.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/components/settingsDataSaveConfig.dart';
import 'package:johukum/modelClass/singleBusinessAllDataModel.dart';
import 'package:johukum/modelClass/thanaModel.dart';
import 'package:johukum/widgets/customToast.dart';
import 'package:johukum/widgets/johukumLoader.dart';

class SingleBusinessAllDataController extends GetxController {
  var singleBusinessValue = SingleBusinessAllData().obs;
  var thanaModelClass = ThanaModelClass().obs;
  var reviewList = [].obs;
  var totalReviewAvg = 0.0.obs;
  var totalReviewCount = 0.obs;
  var loaderShow = true.obs;

  var businessLocationId="".obs;
  var businessLocationName="".obs;

  var businessNameController=TextEditingController().obs;
  var streetAddressController=TextEditingController().obs;
  var landMarkController=TextEditingController().obs;
  var divisionController=TextEditingController().obs;
  var cityController=TextEditingController().obs;
  var areaController=TextEditingController().obs;

  var businessDivisionName="".obs;
  var paymentMethodList=[].obs;
  var paymentMethodNamesList=[].obs;
  List<String> tagsList=[];
  var keywordsList=[].obs;
  var keywordsNameList=[].obs;

  var map;

  var mobileNumbers=[].obs;

  Future<void> getSingleBusinessData(slug) async {
    loaderShow.value = true;
    paymentMethodList.clear();
    paymentMethodNamesList.clear();
    keywordsList.clear();
    keywordsNameList.clear();
    tagsList.clear();
    mobileNumbers.clear();


    var response = await get(Uri.parse(singleBusinessApi + "$slug"), headers: {"agent": "jh_mobile_application"});
    print("Response= " + response.body);
    print("Response= " + response.statusCode.toString());
    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = jsonDecode(response.body);
      SingleBusinessAllData businessAllData = SingleBusinessAllData.fromJson(data);

      print("owner name ${businessAllData.contact.name}");

      loaderShow.value = false;
      singleBusinessValue.value = businessAllData;
      reviewList.value = businessAllData.reviews;

      ///Save all business data to local
      boxNewStorage.write(Business_Building, businessAllData.location.building);
      boxNewStorage.write(Business_NAME, businessAllData.location.businessName);
      boxNewStorage.write(Business_LANDMARK, businessAllData.location.landMark);
      boxNewStorage.write(Business_LOCATION, businessAllData.location.location2.sId);
      boxNewStorage.write(Business_TYPE, businessAllData.businessType);

      businessLocationName.value=businessAllData.location.location2.name;
      businessLocationId.value=businessAllData.location.city.sId;

      boxNewStorage.write(BUSINESS_LAND_LINE, businessAllData.contact.landlineNo);

      businessAllData.contact.mobileNumbers.forEach((element) {
        map={"mobile_number": element.mobileNumber};
        mobileNumbers.add(map);
        boxNewStorage.write(BUSINESS_MOBILE_NUMBERS, mobileNumbers);
        print("----------------$mobileNumbers------------------}");
      });

      boxNewStorage.write(OWNER_NAME, businessAllData.contact.name);
      boxNewStorage.write(OWNER_TITLE, businessAllData.contact.title);
      boxNewStorage.write(OWNER_WEBSITE, businessAllData.contact.website);
      //boxNewStorage.write(OWNER_WEBSITE, businessAllData.contact.);
      boxNewStorage.write(BUSINESS_DESCRIPTION, businessAllData.description);
      boxNewStorage.write(BUSINESS_META_TITLE, businessAllData.metaTitle);
      boxNewStorage.write(BUSINESS_META_DESC, businessAllData.metaDescription);


      businessAllData.acceptedPaymentMethods.forEach((element) {
        paymentMethodList.add(element.sId);
        paymentMethodNamesList.add(element.name);
        print("payments ID $paymentMethodList ....................");
        print("payments Names $paymentMethodNamesList ....................");
        boxNewStorage.write(BUSINESS_PROFESSIONAL_PAYMENT_METHOD, paymentMethodList);
        boxNewStorage.write(BUSINESS_PROFESSIONAL_PAYMENT_METHOD_NAME, paymentMethodNamesList);
      });

      businessAllData.keywords.forEach((element) {
        keywordsList.add(element.sId);
        keywordsNameList.add(element.name);
        print("keywords $keywordsList");
        boxNewStorage.write(BUSINESS_KEYWORDS, keywordsList);
      });

      businessAllData.tags.forEach((element) {
        tagsList.add(element);
        print("Tags $tagsList");
        boxNewStorage.write(BUSINESS_TAGS, tagsList);
      });

      boxNewStorage.write(BUSINESS_MONDAY_START, businessAllData.hoursOfOperation.monday.openFrom);
      boxNewStorage.write(BUSINESS_SUNDAY_START, businessAllData.hoursOfOperation.sunday.openFrom);
      boxNewStorage.write(BUSINESS_TUESDAY_START, businessAllData.hoursOfOperation.tuesday.openFrom);
      boxNewStorage.write(BUSINESS_WEDNESDAY_START, businessAllData.hoursOfOperation.wednesday.openFrom);
      boxNewStorage.write(BUSINESS_THURSDAY_START, businessAllData.hoursOfOperation.thursday.openFrom);
      boxNewStorage.write(BUSINESS_FRIDAY_START, businessAllData.hoursOfOperation.friday.openFrom);
      boxNewStorage.write(BUSINESS_SATURDAY_START, businessAllData.hoursOfOperation.saturday.openFrom);

      boxNewStorage.write(BUSINESS_MONDAY_END, businessAllData.hoursOfOperation.monday.openTill);
      boxNewStorage.write(BUSINESS_SUNDAY_END, businessAllData.hoursOfOperation.sunday.openTill);
      boxNewStorage.write(BUSINESS_TUESDAY_END, businessAllData.hoursOfOperation.tuesday.openTill);
      boxNewStorage.write(BUSINESS_WEDNESDAY_END, businessAllData.hoursOfOperation.wednesday.openTill);
      boxNewStorage.write(BUSINESS_THURSDAY_END, businessAllData.hoursOfOperation.thursday.openTill);
      boxNewStorage.write(BUSINESS_FRIDAY_END, businessAllData.hoursOfOperation.friday.openTill);
      boxNewStorage.write(BUSINESS_SATURDAY_END, businessAllData.hoursOfOperation.saturday.openTill);


      totalReviewAvg.value = businessAllData.aggregateRating;
      totalReviewCount.value = businessAllData.totalReviews;

      //reviewList.add(businessAllData.reviews);
    } else {
      loaderShow.value = false;
      throw ("Error code:: " + response.statusCode.toString());
    }
  }

  Future<void> updateBusinessData(context,singleId,businessNem,buisnessLand,businessBuilding,businessOwner,businessDesc) async {
    print("----business data update start----");
    print("business Name: $businessNem");
    print("business Land: $buisnessLand");
    print("business Building: $businessBuilding");
    //print(boxNewStorage.read(BUSINESS_PROFESSIONAL_PAYMENT_METHOD));

    JohukumLoaderAnimation.showLoaderAnimation(context: context, colorTextBottom: Colors.white);


    print("json print: $json");

    var response = await put(Uri.parse(updateBusinessApi+"$singleId"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': boxStorage.read(KEY_TOKEN),
        },
        body: jsonEncode(<String, dynamic>{

          "accepted_payment_methods": boxNewStorage.read(BUSINESS_PROFESSIONAL_PAYMENT_METHOD),
          "keywords": boxNewStorage.read(BUSINESS_KEYWORDS),
          "tags": boxNewStorage.read(BUSINESS_TAGS),
          "annual_turnover": "1-500000",
          "certifications": ["5c33253141533c141cc8b972"],
          "contact": {
            "designation": "owner",
            "fax_no": "Tst FAX",
            "landline_no": boxNewStorage.read(BUSINESS_LAND_LINE),
            "mobile_numbers": boxNewStorage.read(BUSINESS_MOBILE_NUMBERS),
            "name":businessOwner??boxNewStorage.read(OWNER_NAME),
            "title": boxNewStorage.read(OWNER_TITLE),
            "website": boxNewStorage.read(OWNER_WEBSITE) ?? "www.google.com"
          },
          "description": businessDesc??boxNewStorage.read(BUSINESS_DESCRIPTION),
          "faqs": [
            {"question": "Question 1", "answer": "Answer 1"},
            {"question": "Question 2", "answer": "Answer 2"}
          ],
          "hours_of_operation": {
            "friday": {
              "close": true,
              "leisure_end": null,
              "leisure_start": null,
              "open_24h": false,
              "open_from": boxNewStorage.read(BUSINESS_FRIDAY_START) ?? "09:00",
              "open_till": boxNewStorage.read(BUSINESS_FRIDAY_END) ?? "19:00"
            },
            "monday": {
              "close": false,
              "leisure_end": null,
              "leisure_start": null,
              "open_24h": false,
              "open_from": boxNewStorage.read(BUSINESS_MONDAY_START) ?? "09:00",
              "open_till": boxNewStorage.read(BUSINESS_MONDAY_END) ?? "19:00"
            },
            "saturday": {
              "close": false,
              "leisure_end": null,
              "leisure_start": null,
              "open_24h": false,
              "open_from": boxNewStorage.read(BUSINESS_SATURDAY_START)?? "09:00",
              "open_till": boxNewStorage.read(BUSINESS_SATURDAY_END) ?? "19:00"
            },
            "sunday": {
              "close": false,
              "leisure_end": null,
              "leisure_start": null,
              "open_24h": false,
              "open_from": boxNewStorage.read(BUSINESS_SUNDAY_START)?? "09:00",
              "open_till": boxNewStorage.read(BUSINESS_SUNDAY_END)?? "19:00"
            },
            "thursday": {
              "close": false,
              "leisure_end": null,
              "leisure_start": null,
              "open_24h": false,
              "open_from": boxNewStorage.read(BUSINESS_THURSDAY_START) ?? "09:00",
              "open_till": boxNewStorage.read(BUSINESS_THURSDAY_END) ?? "19:00"
            },
            "tuesday": {
              "close": false,
              "leisure_end": null,
              "leisure_start": null,
              "open_24h": false,
              "open_from": boxNewStorage.read(BUSINESS_TUESDAY_START) ?? "09:00",
              "open_till": boxNewStorage.read(BUSINESS_TUESDAY_END) ?? "19:00"
            },
            "wednesday": {
              "close": false,
              "leisure_end": null,
              "leisure_start": null,
              "open_24h": false,
              "open_from": boxNewStorage.read(BUSINESS_WEDNESDAY_START) ?? "09:00",
              "open_till": boxNewStorage.read(BUSINESS_WEDNESDAY_END)?? "19:00"
            }
          },

          "location": {
            "building": businessBuilding??boxNewStorage.read(Business_Building),
            "business_name":businessNem??boxNewStorage.read(Business_NAME),
            "geo": {
              "coordinates": [boxStorage.read(LONG), boxStorage.read(LAT)],
              "type": "Point"
            },
            "land_mark": buisnessLand??boxNewStorage.read(Business_LANDMARK),
            "location": businessLocationId.value??boxNewStorage.read(Business_LOCATION),
            "plus_code": boxStorage.read(KEY_USER_PLUS_CODE)??"+880"
          },

          "meta_description": boxNewStorage.read(BUSINESS_META_DESC),
          "meta_title": boxNewStorage.read(BUSINESS_META_TITLE),
          "no_of_employees": "1-5",
          "professional_associations": ["5c33251441533c141cc8b96f"],
          "year_of_establishment": "2001",
          "business_type": boxNewStorage.read(Business_TYPE)
        }));

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Data updated successfully");
      JohukumLoaderAnimation.hideRokkhiLoaderAnimation(context);
      showToast("Data Updated Sucessfully");
      var dataMap = jsonDecode(response.body);

    } else {
      JohukumLoaderAnimation.hideRokkhiLoaderAnimation(context);
      print("error: " + response.body);
      print("error code: " + response.statusCode.toString());
    }
  }

  Future<void> fetchThana(cityId, queryTxt) async {
    // make GET request
    var response = await get(Uri.parse(allThana + cityId + "&search=" + queryTxt));

    print("Response = " + response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      var dataMap = jsonDecode(response.body);
      ThanaModelClass thanaDataClass = ThanaModelClass.fromJson(dataMap);
      thanaModelClass.value = thanaDataClass;
    } else {
      throw ("Error code " + response.statusCode.toString());
    }
  }

}
