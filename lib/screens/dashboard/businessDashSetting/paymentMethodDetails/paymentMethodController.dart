import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:johukum/components/apis.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/components/settingsDataSaveConfig.dart';
import 'package:johukum/modelClass/paymentModel.dart';
import 'package:johukum/widgets/customToast.dart';
import 'package:johukum/widgets/johukumLoader.dart';

class PaymentMethodController extends GetxController{

  var paymentMethodID=[].obs;
  var paymentMethodNames=[].obs;
  var paymentModelClass=PaymentModelClass().obs;

  //var paymentList=[].obs;


  onSelect(item,bool value,id){
    print("select");
    paymentMethodNames.add(item);
    paymentMethodID.add(id);
    print("paymentMethodNames $paymentMethodNames");
    print("paymentMethodID $paymentMethodID");

  }

  onRemove(item,bool value,id){
    paymentMethodID.remove(id);
    paymentMethodNames.remove(item);
    print("paymentMethodNames $paymentMethodNames");
    print("paymentMethodID $paymentMethodID");

  }

  Future<void> updateBusinessData(context,singleId,paymentMethods) async {
    print("----business data update start----");
    //print(boxNewStorage.read(BUSINESS_PROFESSIONAL_PAYMENT_METHOD));

    JohukumLoaderAnimation.showLoaderAnimation(context: context, colorTextBottom: Colors.white);



    var response = await put(Uri.parse(updateBusinessApi+"$singleId"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': boxStorage.read(KEY_TOKEN),
        },
        body: jsonEncode(<String, dynamic>{

          "accepted_payment_methods":paymentMethods??boxNewStorage.read(BUSINESS_PROFESSIONAL_PAYMENT_METHOD),
          "keywords": boxNewStorage.read(BUSINESS_KEYWORDS),
          "tags": boxNewStorage.read(BUSINESS_TAGS)??["cloth","fashion"],
          "annual_turnover": "1-500000",
          "certifications": ["5c33253141533c141cc8b972"],
          "contact": {
            "designation": "owner",
            "fax_no": "Tst FAX",
            "landline_no": boxNewStorage.read(BUSINESS_LAND_LINE),
            "mobile_numbers": boxNewStorage.read(BUSINESS_MOBILE_NUMBERS),
            "name":boxNewStorage.read(OWNER_NAME),
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
            "building":boxNewStorage.read(Business_Building),
            "business_name":boxNewStorage.read(Business_NAME),
            "geo": {
              "coordinates": [boxStorage.read(LONG), boxStorage.read(LAT)],
              "type": "Point"
            },
            "land_mark": boxNewStorage.read(Business_LANDMARK),
            "location": boxNewStorage.read(Business_LOCATION),
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
     // paymentMethodNames.clear();
      JohukumLoaderAnimation.hideRokkhiLoaderAnimation(context);
      showToast("Data Updated Sucessfully");
      //Navigator.of(context).pushNamedAndRemoveUntil('/welcome', (Route<dynamic> route) => false);

    } else {
      JohukumLoaderAnimation.hideRokkhiLoaderAnimation(context);
      print("error: " + response.body);
      print("error code: " + response.statusCode.toString());
    }
  }



  Future<void> fetchPayment() async {
    // make GET request
    var response = await get(Uri.parse(paymentMethod));

    print("Response = " + response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      var dataMap = jsonDecode(response.body);
      PaymentModelClass paymentDataClass = PaymentModelClass.fromJson(dataMap);
      paymentModelClass.value = paymentDataClass;
    } else {
      throw ("Error code " + response.statusCode.toString());
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchPayment();
  }




}