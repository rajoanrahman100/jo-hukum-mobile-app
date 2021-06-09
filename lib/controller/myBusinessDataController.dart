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
/*      "Authorization":
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MDg5MWI1ZmEyZGZiNDFmYWU4MWQ2Y2UiLCJlbWFpbCI6InJhdHVsQGdtYWlsLmNvbSIsIm1v"
              "YmlsZV9udW1iZXIiOiIwMTkzMDIxMjIxMyIsImlzX2FjdGl2ZSI6dHJ1ZSwiZGF0ZV9qb2luZWQiOiIyMDIxLTA0LTI4VDA4OjIyOjU1LjU4OVoiL"
              "CJzaG9wX3VpZCI6NTIsImJvb2tpbmdfdWlkIjozMywiaWF0IjoxNjIzMjMxMjA1fQ.4CimIZ2RHubhBaRzVX7SdzxmY7LK6kJD-C0Nhj-EUjM",*/
        "Authorization":boxStorage.read(KEY_TOKEN),
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
