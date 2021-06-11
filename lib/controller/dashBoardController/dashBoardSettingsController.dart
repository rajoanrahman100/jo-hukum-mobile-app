import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:johukum/components/apis.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/modelClass/singleBusinessAllDataModel.dart';
import 'package:johukum/modelClass/thanaModel.dart';
import 'package:johukum/widgets/johukumLoader.dart';

class DashBoardSettingController extends GetxController {
  var singleBusinessValue = SingleBusinessAllData().obs;
  var thanaModelClass = ThanaModelClass().obs;

  var businessNameController = TextEditingController().obs;
  var streetAddressController = TextEditingController().obs;
  var buildingController = TextEditingController().obs;
  var landMarkController = TextEditingController().obs;
  var divisionController = TextEditingController().obs;
  var cityController = TextEditingController().obs;
  var areaController = TextEditingController().obs;

  ///Business Details Data
  var businessName = "".obs;
  var businessDivisionName = "".obs;
  var businessStreetAddressName = "".obs;
  var businessLandMarkName = "".obs;
  var businessCityName = "".obs;
  var businessAreaName = "".obs;
  var cityId = "".obs;
  var areaId = "".obs;

  ///Contact Details Data
  var ownerTitle = "".obs;
  var ownerFullName = "".obs;
  var designation = "".obs;
  var landPhoneNumber = "".obs;
  var mobileNumber = [].obs;
  var emailNumber = "".obs;
  var facebook = "".obs;
  var website = "".obs;

  ///Working hour Data
  var saturdayOpen = "".obs;
  var sundayOpen = "".obs;
  var mondayOpen = "".obs;
  var tuesdayOpen = "".obs;
  var wednesdayOpen = "".obs;
  var thursdayOpen = "".obs;
  var fridayOpen = "".obs;

  var saturdayClose = "".obs;
  var sundayClose = "".obs;
  var mondayClose = "".obs;
  var tuesdayClose = "".obs;
  var wednesdayClose = "".obs;
  var thursdayClose = "".obs;
  var fridayClose = "".obs;

  ///Category & Pay method
  var businessCategoryList = [].obs;
  var paymentMethodList = [].obs;

  ///Additional Info
  var yearsOfEstablishment = [].obs;
  var annualTurnOver = [].obs;
  var numberOfEmployee = [].obs;
  var description = "".obs;

  ///Gallery portion will cover after a while
  var keywords = [].obs;
  var businessTags = [].obs;
  var businessMetaDisc = "".obs;

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

  Future<void> getMyBusinessData(slug) async {
    // loaderShow.value = true;
    //paymentMethodList.clear();
    //keywords.clear();
    businessTags.clear();

    var response = await get(Uri.parse(singleBusinessApi + "$slug"), headers: {"agent": "jh_mobile_application"});
    print("Response= " + response.body);
    print("Response= " + response.statusCode.toString());
    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = jsonDecode(response.body);
      SingleBusinessAllData businessAllData = SingleBusinessAllData.fromJson(data);
      singleBusinessValue.value = businessAllData;

      ///Business Details Data Save
      businessNameController.value.text = businessAllData.location.businessName;
      streetAddressController.value.text = businessAllData.location.street;
      buildingController.value.text = businessAllData.location.building;
      landMarkController.value.text = businessAllData.location.landMark;
      businessName.value = businessAllData.location.businessName;
      businessLandMarkName.value = businessAllData.location.landMark;
      businessAreaName.value = businessAllData.location.location2.name;
      cityId.value = businessAllData.location.city.sId;
      areaId.value = businessAllData.location.location2.sId;

      ///Contact Details Data
      ownerTitle.value = businessAllData.contact.title;
      ownerFullName.value = businessAllData.contact.name;
      designation.value = businessAllData.contact.designation;
      landPhoneNumber.value=businessAllData.contact.landlineNo;
      mobileNumber.value=businessAllData.contact.mobileNumbers;
      website.value=businessAllData.contact.website;

      ///Working hour
      mondayOpen.value=businessAllData.hoursOfOperation.monday.openFrom;
      mondayClose.value=businessAllData.hoursOfOperation.monday.openTill;

      saturdayOpen.value=businessAllData.hoursOfOperation.saturday.openFrom;
      saturdayClose.value=businessAllData.hoursOfOperation.saturday.openTill;

      sundayOpen.value=businessAllData.hoursOfOperation.sunday.openFrom;
      sundayClose.value=businessAllData.hoursOfOperation.sunday.openTill;

      tuesdayOpen.value=businessAllData.hoursOfOperation.tuesday.openFrom;
      tuesdayClose.value=businessAllData.hoursOfOperation.tuesday.openTill;

      wednesdayOpen.value=businessAllData.hoursOfOperation.wednesday.openFrom;
      wednesdayClose.value=businessAllData.hoursOfOperation.wednesday.openTill;

      thursdayOpen.value=businessAllData.hoursOfOperation.thursday.openFrom;
      thursdayClose.value=businessAllData.hoursOfOperation.thursday.openTill;

      fridayOpen.value=businessAllData.hoursOfOperation.friday.openFrom;
      fridayClose.value=businessAllData.hoursOfOperation.friday.openTill;

      ///Category & Payment Method

      businessAllData.acceptedPaymentMethods.forEach((element) {

        var payList=[];
        payList.add(element.sId);
        paymentMethodList.value=payList.toSet().toList();
        print("payment list:$paymentMethodList");
      });
      ///Keywords & Tags
      //keywords.value=businessAllData.keywords;
      businessAllData.keywords.forEach((element) {

        keywords.add(element.sId);
        /*var keyword=[];
        keyword.add(element.sId);
        keywords.value=keyword.toSet().toList();
        //keywords.add(element.sId);
        print("keyword list $keywords");*/

      });

      businessAllData.tags.forEach((element) {

        var tags=[];
        tags.add(element);

        businessTags.value=tags.toSet().toList();

        print("business tags:$businessTags");

      });

      //businessTags.value=businessAllData.tags;
      description.value=businessAllData.description;
      businessMetaDisc.value=businessAllData.metaDescription;



    } else {
      // loaderShow.value = false;
      throw ("Error code:: " + response.statusCode.toString());
    }
  }

  Future<void> updateBusinessData(context,singleId) async {
    print("----business data update start----");

    JohukumLoaderAnimation.showLoaderAnimation(context: context, colorTextBottom: Colors.white);

    var json = {
      "accepted_payment_methods": paymentMethodList,
      "keywords": keywords,
      "tags": businessTags,
      "annual_turnover": annualTurnOver,
      "certifications": ["5c33253141533c141cc8b972"],
      "contact": {
        "designation": designation.value, //required
        "fax_no": "Tst FAX",
        "landline_no": "01794202010",
        "mobile_numbers": [
          {"mobile_number": "01521431798"},
          {"mobile_number": "01521431799"},
          {"mobile_number": "01521431797"}
        ],
        "name": ownerFullName.value,
        "title": "Mr.", //required
        "website": website.value ?? "www.google.com"
      },
      "description": description.value, //required
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
          "open_from": fridayOpen.value ?? "09:00",
          "open_till": fridayClose.value ?? "19:00",
        },
        "monday": {
          "close": false,
          "leisure_end": null,
          "leisure_start": null,
          "open_24h": false,
          "open_from": mondayOpen.value ?? "09:00",
          "open_till": mondayClose.value ?? "19:00",
        },
        "saturday": {
          "close": false,
          "leisure_end": null,
          "leisure_start": null,
          "open_24h": false,
          "open_from": saturdayOpen.value ?? "09:00",
          "open_till": saturdayClose.value ?? "19:00",
        },
        "sunday": {
          "close": false,
          "leisure_end": null,
          "leisure_start": null,
          "open_24h": false,
          "open_from": sundayOpen.value ?? "09:00",
          "open_till": sundayClose.value ?? "19:00",
        },
        "thursday": {
          "close": false,
          "leisure_end": null,
          "leisure_start": null,
          "open_24h": false,
          "open_from": thursdayOpen.value ?? "09:00",
          "open_till": thursdayClose.value ?? "19:00",
        },
        "tuesday": {
          "close": false,
          "leisure_end": null,
          "leisure_start": null,
          "open_24h": false,
          "open_from": tuesdayOpen.value ?? "09:00",
          "open_till": tuesdayClose.value ?? "19:00",
        },
        "wednesday": {
          "close": false,
          "leisure_end": null,
          "leisure_start": null,
          "open_24h": false,
          "open_from": wednesdayOpen.value ?? "09:00",
          "open_till": wednesdayClose.value ?? "19:00",
        }
      },


      "location": {
        "building": boxStorage.read(KEY_USER_BUILDING)??"new building",
        "business_name": businessName.value,
        "geo": {
          "coordinates": [boxStorage.read(LAT), boxStorage.read(LONG)],
          "type": "Point"
        },
        "land_mark": businessLandMarkName.value,
        "location": areaId.value,
        "plus_code": boxStorage.read(KEY_USER_PLUS_CODE)??"+880",
      },

      "meta_description": businessMetaDisc.value,
      "meta_title": boxStorage.read(SEO_TITLE),
      "no_of_employees": boxStorage.read(NUMBER_OF_EMPLOYEE) ?? "1-5",
      "professional_associations": ["5c33251441533c141cc8b96f"],

      "year_of_establishment": boxStorage.read(YEAR_ESTABLISH)??"2001",
      "business_type": boxStorage.read(TYPE_OF_BUSINESS)??"60530b5731f97d45f0634647"
    };

    print("json print: $json");

    var response = await put(Uri.parse(updateBusinessApi+"$singleId"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': boxStorage.read(KEY_TOKEN),
        },
        body: jsonEncode(<String, dynamic>{
          "accepted_payment_methods": paymentMethodList,
          "keywords": keywords,
          "tags": businessTags,
          "annual_turnover": "1-500000",
          "certifications": ["5c33253141533c141cc8b972"],
          "contact": {
            "designation": designation.value, //required
            "fax_no": "Tst FAX",
            "landline_no": "01794202010",
            "mobile_numbers": [
              {"mobile_number": "01521431798"},
              {"mobile_number": "01521431799"},
              {"mobile_number": "01521431797"}
            ],
            "name": ownerFullName.value,
            "title": "Mr.", //required
            "website": website.value ?? "www.google.com"
          },
          "description": description.value, //required
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
              "open_from": fridayOpen.value ?? "09:00",
              "open_till": fridayClose.value ?? "19:00",
            },
            "monday": {
              "close": false,
              "leisure_end": null,
              "leisure_start": null,
              "open_24h": false,
              "open_from": mondayOpen.value ?? "09:00",
              "open_till": mondayClose.value ?? "19:00",
            },
            "saturday": {
              "close": false,
              "leisure_end": null,
              "leisure_start": null,
              "open_24h": false,
              "open_from": saturdayOpen.value ?? "09:00",
              "open_till": saturdayClose.value ?? "19:00",
            },
            "sunday": {
              "close": false,
              "leisure_end": null,
              "leisure_start": null,
              "open_24h": false,
              "open_from": sundayOpen.value ?? "09:00",
              "open_till": sundayClose.value ?? "19:00",
            },
            "thursday": {
              "close": false,
              "leisure_end": null,
              "leisure_start": null,
              "open_24h": false,
              "open_from": thursdayOpen.value ?? "09:00",
              "open_till": thursdayClose.value ?? "19:00",
            },
            "tuesday": {
              "close": false,
              "leisure_end": null,
              "leisure_start": null,
              "open_24h": false,
              "open_from": tuesdayOpen.value ?? "09:00",
              "open_till": tuesdayClose.value ?? "19:00",
            },
            "wednesday": {
              "close": false,
              "leisure_end": null,
              "leisure_start": null,
              "open_24h": false,
              "open_from": wednesdayOpen.value ?? "09:00",
              "open_till": wednesdayClose.value ?? "19:00",
            }
          },


          "location": {
            "building": boxStorage.read(KEY_USER_BUILDING)??"new building",
            "business_name": businessName.value,
            "geo": {
              "coordinates": [boxStorage.read(LAT), boxStorage.read(LONG)],
              "type": "Point"
            },
            "land_mark": businessLandMarkName.value,
            "location": areaId.value,
            "plus_code": boxStorage.read(KEY_USER_PLUS_CODE)??"+880",
          },

          "meta_description": businessMetaDisc.value,
          "meta_title": boxStorage.read(SEO_TITLE),
          "no_of_employees": boxStorage.read(NUMBER_OF_EMPLOYEE) ?? "1-5",
          "professional_associations": ["5c33251441533c141cc8b96f"],

          "year_of_establishment": boxStorage.read(YEAR_ESTABLISH)??"2001",
          "business_type": boxStorage.read(TYPE_OF_BUSINESS)??"60530b5731f97d45f0634647"
        }));

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Data added successfully");

      JohukumLoaderAnimation.hideRokkhiLoaderAnimation(context);
      var dataMap = jsonDecode(response.body);
      // ResponseBusinessData responseBusiness=ResponseBusinessData.fromJson(dataMap);
      //responseBusinessData.value=responseBusiness;
      //businessID.value=responseBusiness.id;
      //await uploadImageData(logo,cover,context);
      //print("business id ${responseBusinessData.value.id}");
      //showSnackBar(context: context,message: "Business Data Addded Successfully",callBack: (){});
      //Navigator.pushNamed(context, '/lastSuccess');
    } else {
      JohukumLoaderAnimation.hideRokkhiLoaderAnimation(context);
      print("error: " + response.body);
      print("error code: " + response.statusCode.toString());
    }
  }
}
