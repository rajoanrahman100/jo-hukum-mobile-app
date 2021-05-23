import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:johukum/components/apis.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/widgets/johukumLoader.dart';

class AddBusinessController extends GetxController {

  Future<void> addBusinessData(context) async {

    JohukumLoaderAnimation.showLoaderAnimation(context: context, colorTextBottom: Colors.white);

    var json={
      "accepted_payment_methods": boxStorage.read(PAYMENT_ID_LIST),
      "annual_turnover": boxStorage.read(ANNUAL_TURNOVER),
      "certifications": ["5c33253141533c141cc8b972"],
      "contact": {
        "designation": boxStorage.read(KEY_BUSINESS_DESIGNATION), //required
        "fax_no": "Tst FAX",
        "landline_no": "01794202010",
        "mobile_numbers": [
          {"mobile_number": boxStorage.read(MOBILE_ONE)},{"mobile_number": boxStorage.read(MOBILE_TWO)},
          {"mobile_number": boxStorage.read(MOBILE_THREE)}
        ], //atleast one required
        "name": boxStorage.read(KEY_BUSINESS_OWNER_NAME), //required
        "title": "Mr.", //required
        "website": boxStorage.read(KEY_BUSINESS_WEBSITE)??"www.google.com"
      },
      "description": boxStorage.read(DESCRIPTION), //required
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
          "open_from": boxStorage.read(FRI_START)??"09:00",
          "open_till": boxStorage.read(FRI_END)??"19:00",
        },
        "monday": {
          "close": false,
          "leisure_end": null,
          "leisure_start": null,
          "open_24h": false,
          "open_from": boxStorage.read(MON_START)??"09:00",
          "open_till": boxStorage.read(MON_END)??"19:00",
        },
        "saturday": {
          "close": false,
          "leisure_end": null,
          "leisure_start": null,
          "open_24h": false,
          "open_from": boxStorage.read(SAT_START)??"09:00",
          "open_till": boxStorage.read(SAT_END)??"19:00",
        },
        "sunday": {
          "close": false,
          "leisure_end": null,
          "leisure_start": null,
          "open_24h": false,
          "open_from": boxStorage.read(SUN_START)??"09:00",
          "open_till": boxStorage.read(SUN_END)??"19:00",
        },
        "thursday": {
          "close": false,
          "leisure_end": null,
          "leisure_start": null,
          "open_24h": false,
          "open_from": boxStorage.read(THURS_START)??"09:00",
          "open_till": boxStorage.read(THURS_END)??"19:00",
        },
        "tuesday": {
          "close": false,
          "leisure_end": null,
          "leisure_start": null,
          "open_24h": false,
          "open_from": boxStorage.read(TUE_START)??"09:00",
          "open_till": boxStorage.read(TUE_END)??"19:00",
        },
        "wednesday": {
          "close": false,
          "leisure_end": null,
          "leisure_start": null,
          "open_24h": false,
          "open_from": boxStorage.read(WED_START)??"09:00",
          "open_till": boxStorage.read(WED_END)??"19:00",
        }
      },

      "keywords": boxStorage.read(KEYWORDS),
      "location": {
        "building": boxStorage.read(KEY_USER_BUILDING),
        "business_name": boxStorage.read(KEY_USER_BUSINESS_NAME),
        "geo": {
          "coordinates": [boxStorage.read(LAT), boxStorage.read(LONG)],
          "type": "Point"
        },
        "land_mark": boxStorage.read(KEY_USER_LANDMARK),
        "location": boxStorage.read(KEY_USER_THANA_ID),
        "plus_code": boxStorage.read(KEY_USER_PLUS_CODE),
      },

      "meta_description":boxStorage.read(META_DESCRIPTION),
      "meta_title": boxStorage.read(SEO_TITLE),
      "no_of_employees": boxStorage.read(NUMBER_OF_EMPLOYEE)??"1-5",
      "professional_associations": ["5c33251441533c141cc8b96f"],
      "tags": boxStorage.read(TAG_LIST),
      "year_of_establishment": boxStorage.read(YEAR_ESTABLISH),
      "business_type": boxStorage.read(TYPE_OF_BUSINESS)
    };


    var response = await post(Uri.parse(addBusiness),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': boxStorage.read(KEY_TOKEN),
        },
        body: jsonEncode(<String, dynamic>{
          "accepted_payment_methods": boxStorage.read(PAYMENT_ID_LIST),
          "annual_turnover": boxStorage.read(ANNUAL_TURNOVER),
          "certifications": ["5c33253141533c141cc8b972"],
          "contact": {
            "designation": boxStorage.read(KEY_BUSINESS_DESIGNATION), //required
            "fax_no": "Tst FAX",
            "landline_no": "01794202010",
            "mobile_numbers": [
              {"mobile_number": boxStorage.read(MOBILE_ONE)}
            ], //atleast one required
            "name": boxStorage.read(KEY_BUSINESS_OWNER_NAME), //required
            "title": "Mr.", //required
            "website": boxStorage.read(KEY_BUSINESS_WEBSITE)??"www.google.com"
          },
          "description": boxStorage.read(DESCRIPTION), //required
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
              "open_from": boxStorage.read(FRI_START)??"09:00",
              "open_till": boxStorage.read(FRI_END)??"19:00",
            },
            "monday": {
              "close": false,
              "leisure_end": null,
              "leisure_start": null,
              "open_24h": false,
              "open_from": boxStorage.read(MON_START)??"09:00",
              "open_till": boxStorage.read(MON_END)??"19:00",
            },
            "saturday": {
              "close": false,
              "leisure_end": null,
              "leisure_start": null,
              "open_24h": false,
              "open_from": boxStorage.read(SAT_START)??"09:00",
              "open_till": boxStorage.read(SAT_END)??"19:00",
            },
            "sunday": {
              "close": false,
              "leisure_end": null,
              "leisure_start": null,
              "open_24h": false,
              "open_from": boxStorage.read(SUN_START)??"09:00",
              "open_till": boxStorage.read(SUN_END)??"19:00",
            },
            "thursday": {
              "close": false,
              "leisure_end": null,
              "leisure_start": null,
              "open_24h": false,
              "open_from": boxStorage.read(THURS_START)??"09:00",
              "open_till": boxStorage.read(THURS_END)??"19:00",
            },
            "tuesday": {
              "close": false,
              "leisure_end": null,
              "leisure_start": null,
              "open_24h": false,
              "open_from": boxStorage.read(TUE_START)??"09:00",
              "open_till": boxStorage.read(TUE_END)??"19:00",
            },
            "wednesday": {
              "close": false,
              "leisure_end": null,
              "leisure_start": null,
              "open_24h": false,
              "open_from": boxStorage.read(WED_START)??"09:00",
              "open_till": boxStorage.read(WED_END)??"19:00",
            }
          },

          "keywords": boxStorage.read(KEYWORDS),
          "location": {
            "building": boxStorage.read(KEY_USER_BUILDING),
            "business_name": boxStorage.read(KEY_USER_BUSINESS_NAME),
            "geo": {
              "coordinates": [boxStorage.read(LONG), boxStorage.read(LAT)],
              "type": "Point"
            },
            "land_mark": boxStorage.read(KEY_USER_LANDMARK),
            "location": boxStorage.read(KEY_USER_THANA_ID),
            "plus_code": boxStorage.read(KEY_USER_PLUS_CODE),
          },

          "meta_description":boxStorage.read(META_DESCRIPTION),
          "meta_title": boxStorage.read(SEO_TITLE),
          "no_of_employees": boxStorage.read(NUMBER_OF_EMPLOYEE)??"1-5",
          "professional_associations": ["5c33251441533c141cc8b96f"],
          "tags": boxStorage.read(TAG_LIST),
          "year_of_establishment": boxStorage.read(YEAR_ESTABLISH),
          "business_type": boxStorage.read(TYPE_OF_BUSINESS)
        }));

    if (response.statusCode == 200 || response.statusCode == 201) {
      JohukumLoaderAnimation.hideRokkhiLoaderAnimation(context);
      //showSnackBar(context: context,message: "Business Data Addded Successfully",callBack: (){});
      Navigator.pushNamed(context, '/lastSuccess');
      print("Data added successfully" + response.body);
    } else {
      JohukumLoaderAnimation.hideRokkhiLoaderAnimation(context);

      print("error: " + response.body);
    }
  }
}
