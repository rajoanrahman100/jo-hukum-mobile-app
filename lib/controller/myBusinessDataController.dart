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
        "Authorization":boxStorage.read(KEY_TOKEN),
        "agent": "jh_mobile_application"
    });
    print("Response my business= " + response.body);
    print("Response my business= " + response.statusCode.toString());
    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = jsonDecode(response.body);
      MyBusinessListModel businessAllData = MyBusinessListModel.fromJson(data);
      businessData.value=businessAllData;
      boxStorage.write(MY_BUSINESS_ID, businessAllData.results[0].sId);
      myBusinessName.value=businessAllData.results[0].location.businessName;
      boxStorage.write(MY_BUSINESS_SLUG, businessAllData.results[0].slug);
      print("business Name ${businessAllData.results[0].location.businessName}");

    } else {
      throw ("Error code:: " + response.statusCode.toString());
    }
  }
}
