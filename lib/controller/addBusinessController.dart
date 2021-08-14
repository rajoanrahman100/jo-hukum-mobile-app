import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:johukum/components/apis.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/modelClass/responseBusinessData.dart';
import 'package:johukum/screens/addBusiness/uploadMultipleImage.dart';
import 'package:johukum/widgets/johukumLoader.dart';

class AddBusinessController extends GetxController {


  var responseBusinessData=ResponseBusinessData().obs;

  var businessID="".obs;

  var up=UploadMultipleImage();

  Future<void> addBusinessData(context,logo, cover,gallery) async {

    print("----business data add start----");
    print(boxStorage.read(MOBILE_NUMBERS));

    JohukumLoaderAnimation.showLoaderAnimation(context: context, colorTextBottom: Colors.white);


    //print(json);

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
            "landline_no": boxStorage.read(KEY_BUSINESS_PHONE_NUMBER),
            "mobile_numbers": boxStorage.read(MOBILE_NUMBERS),
            "name": boxStorage.read(KEY_BUSINESS_OWNER_NAME), //required
            "title": boxStorage.read(KEY_BUSINESS_OWNER_TITLE), //required
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
      print("Data added successfully");

     // JohukumLoaderAnimation.hideRokkhiLoaderAnimation(context);
      var dataMap = jsonDecode(response.body);
      ResponseBusinessData responseBusiness=ResponseBusinessData.fromJson(dataMap);
      responseBusinessData.value=responseBusiness;
      businessID.value=responseBusiness.id;
      await uploadImageData(logo,cover,context,gallery,businessID.value);
      print("business id ${responseBusinessData.value.id}");
      //showSnackBar(context: context,message: "Business Data Addded Successfully",callBack: (){});
      Navigator.pushNamed(context, '/lastSuccess');
    } else {
      JohukumLoaderAnimation.hideRokkhiLoaderAnimation(context);

      print("error: " + response.body);
    }
  }



  uploadImageData(logoImage,coverPhoto,context,gallery,businessID)async{
    //print("business ID ${businessID.value}");

    print("----uploading images start----");
    //print("----cover photso ${boxStorage.read(MORE_PHOTOS)}----");


    var request = http.MultipartRequest('PATCH', Uri.parse('https://api-backend.jo-hukum'
        '.com/consumers_api/business_data/$businessID/uploads/'));

    request.files.add(await http.MultipartFile.fromPath('logo', logoImage,contentType:MediaType('image','jpeg')));
    request.files.add(await http.MultipartFile.fromPath('cover_photo', coverPhoto,contentType:MediaType('image','jpeg')));

    
    request.headers.addAll(<String, String>{
      'Authorization': boxStorage.read(KEY_TOKEN),
      'Content-Type': 'multipart/form-data; charset=UTF-8'
    },);

    request.fields.addAll({
      'photos': '$gallery',
      'videos': '[]'
    });

    var response = await request.send();

    if (response.statusCode == 200) {

      print("upload image successfully");
      print("Status Code: ${response.statusCode}");

      JohukumLoaderAnimation.hideRokkhiLoaderAnimation(context);

      print(await response.stream.bytesToString());
    }
    else {
      JohukumLoaderAnimation.hideRokkhiLoaderAnimation(context);
      print("Status Code: ${response.statusCode}");
      print(await response.stream.bytesToString());
    }

  }
}
