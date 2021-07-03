import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:johukum/components/apis.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/widgets/customToast.dart';
import 'package:johukum/widgets/johukumLoader.dart';

class ReportBusinessController extends GetxController {
  var show = false.obs;

  var issueValue = "Select Issue".obs;

  var selectValue=0.obs;

  changeShowStatus() {
    show.value = !show.value;
  }

  changeIssueValue(valueOne,valueTwo) {
    issueValue.value = valueOne;
    selectValue.value = valueTwo;
  }

  Future<void> submitReport(issue, additionalInfo, businessID,context) async {

    print(issue);
    print(additionalInfo);
    print(businessID);


    JohukumLoaderAnimation.showLoaderAnimation(context: context);


    // make GET request
    var response = await post(
      Uri.parse(reportBusinessApi + "$businessID" + "/report/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': boxStorage.read(KEY_TOKEN),
      },
      body: jsonEncode(<String, dynamic>{"report_type": issue,"additional_info":additionalInfo})
    );

    print("" + response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {

      JohukumLoaderAnimation.hideRokkhiLoaderAnimation(context);
      Get.snackbar('Success!', 'Reposrt submitted successfully', snackPosition: SnackPosition.TOP, backgroundColor:
      kWhiteColor);
      Navigator.pop(context);
      print(response.statusCode);
      return;
    } else {
      JohukumLoaderAnimation.hideRokkhiLoaderAnimation(context);
      throw ("Error code " + response.statusCode.toString());
    }
  }
}
