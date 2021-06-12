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
  List<String> paymentMethodList=[];
  List<String> tagsList=[];
  List<String> keywordsList=[];

  Future<void> getSingleBusinessData(slug) async {
    loaderShow.value = true;

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

      businessLocationName.value=businessAllData.location.location2.name;
      businessLocationId.value=businessAllData.location.city.sId;

      boxNewStorage.write(BUSINESS_LAND_LINE, businessAllData.contact.landlineNo);
      boxNewStorage.write(BUSINESS_MOBILE_NUMBERS, businessAllData.contact.mobileNumbers);
      boxNewStorage.write(OWNER_NAME, businessAllData.contact.name);
      boxNewStorage.write(OWNER_TITLE, businessAllData.contact.title);
      boxNewStorage.write(OWNER_WEBSITE, businessAllData.contact.website);
      boxNewStorage.write(BUSINESS_DESCRIPTION, businessAllData.description);

     // businessAllData.acceptedPaymentMethods.singleWhere((element) => print())

//      for(var i in businessAllData.acceptedPaymentMethods){
//        print("lists of payments ${i.sId}");
//      }

      businessAllData.acceptedPaymentMethods.forEach((element) {
        paymentMethodList.add(element.sId);
        print("payments $paymentMethodList");
        boxNewStorage.write(BUSINESS_PROFESSIONAL_PAYMENT_METHOD, paymentMethodList);
      });

      businessAllData.keywords.forEach((element) {
        keywordsList.add(element.sId);
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

  Future<void> updateBusinessData(context,singleId,businessNem,buisnessLand,businessBuilding) async {
    print("----business data update start----");
    print("business Name: $businessNem");
    print("business Land: $buisnessLand");
    print("business Building: $businessBuilding");
    print(boxNewStorage.read(BUSINESS_PROFESSIONAL_PAYMENT_METHOD));

    JohukumLoaderAnimation.showLoaderAnimation(context: context, colorTextBottom: Colors.white);

    /*var json = {
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
    };*/

    print("json print: $json");

    var response = await put(Uri.parse(updateBusinessApi+"$singleId"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': boxStorage.read(KEY_TOKEN),
        },
        body: jsonEncode(<String, dynamic>{


          "accepted_payment_methods": boxNewStorage.read(BUSINESS_PROFESSIONAL_PAYMENT_METHOD)??["5d32d598b86023282aa4cde6"],
          "keywords": boxNewStorage.read(BUSINESS_KEYWORDS)??["5baca5cd41533c08759778bd"],
          "tags": boxNewStorage.read(BUSINESS_TAGS)??["cloth","fashion"],
          "annual_turnover": "1-500000",
          "certifications": ["5c33253141533c141cc8b972"],
          "contact": {
            "designation": "owner",
            "fax_no": "Tst FAX",
            "landline_no": "01794202010",
            "mobile_numbers": [
              {"mobile_number": "01521431798"},
              {"mobile_number": "01521431799"},
              {"mobile_number": "01521431797"}
            ],
            "name": boxNewStorage.read(OWNER_NAME),
            "title": boxNewStorage.read(OWNER_TITLE),
            "website": boxNewStorage.read(OWNER_WEBSITE) ?? "www.google.com"
          },
          "description": boxNewStorage.read(BUSINESS_DESCRIPTION),
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

          "meta_description": "okokokokoookok",
          "meta_title": boxNewStorage.read(BUSINESS_META_TITLE)??"Fashion House",
          "no_of_employees": "1-5",
          "professional_associations": ["5c33251441533c141cc8b96f"],
          "year_of_establishment": "2001",
          "business_type": boxStorage.read(TYPE_OF_BUSINESS)??"60530b5731f97d45f0634647"
        }));

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Data updated successfully");
      showToast("Data Updated Sucessfully");

      JohukumLoaderAnimation.hideRokkhiLoaderAnimation(context);
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
