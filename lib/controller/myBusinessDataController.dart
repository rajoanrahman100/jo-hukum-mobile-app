import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:johukum/components/apis.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/modelClass/myBusinessModel.dart';

class MyBusinessController extends GetxController {

  var businessData = MyBusinessListModel().obs;

  var myBusinessSlug="".obs;
  var myBusinessId="".obs;
  var myBusinessName="SELECT YOUR BUSINESS".obs;

  setMyBusinessSlug(value){
    myBusinessSlug.value=value;
    boxStorage.write(MY_BUSINESS_SLUG, value);
    print(value);
  }

  setMyBusinessID(value){
    myBusinessId.value=value;
    boxStorage.write(MY_BUSINESS_ID, value);
    print(value);
  }

  setMyBusinessName(value){
    myBusinessName.value=value;
    boxStorage.write(MY_BUSINESS_NAME, value);
    print(value);
  }

  Future<void> getMyBusinessData() async {
    var response = await get(Uri.parse(myBusinessApi), headers: {
      "Authorization":
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI1ZmYwNzNjOTI2NGVmNTU3ZjEwNzkxYzciLCJlbWFpbCI6InJhZmFlYXR1bDJAZ21haWwuY29tIiwibW9iaWxlX251bWJlciI6IjAxOTU2MzIwNTY3IiwiaXNfYWN0aXZlIjp0cnVlLCJkYXRlX2pvaW5lZCI6IjIwMjEtMDEtMDJUMTM6MjM6MjEuMDk0WiIsInNob3BfdWlkIjoxOSwiYm9va2luZ191aWQiOm51bGwsImlhdCI6MTYxODgyMTEzMn0.01J0SBCPPQpc9rc-MN2cMEf2gdGWX0z-c09MCHhrv9g",
      "agent": "jh_mobile_application"
    });
    print("Response my business= " + response.body);
    print("Response my business= " + response.statusCode.toString());
    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = jsonDecode(response.body);
      MyBusinessListModel businessAllData = MyBusinessListModel.fromJson(data);
      businessData.value=businessAllData;
    } else {
      throw ("Error code:: " + response.statusCode.toString());
    }
  }
}
