import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:johukum/components/apis.dart';
import 'package:johukum/modelClass/ratingCountModel.dart';

class BusinessRatingController extends GetxController {
  //var ratingCount=BusinessRatingCount().obs;
  //var ratingValue = BusinessRatingCount().obs;

  var ratingValue=List<BusinessRatingCount>().obs;

  Future<void> getRatingData(businessId) async {
    var response = await get(Uri.parse(reviewCountApi + "$businessId" + "/ratings-count/"), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI1ZmYwNzNjOTI2NGVmNTU3ZjEwNzkxYzciLCJlbWFpbCI6InJhZmFlYXR1bDJAZ21haWwuY29tIiwibW9iaWxlX251bWJlciI6IjAxOTU2MzIwNTY3IiwiaXNfYWN0aXZlIjp0cnVlLCJkYXRlX2pvaW5lZCI6IjIwMjEtMDEtMDJUMTM6MjM6MjEuMDk0WiIsInNob3BfdWlkIjoxOSwiYm9va2luZ191aWQiOm51bGwsImlhdCI6MTYxODgyMTEzMn0.01J0SBCPPQpc9rc-MN2cMEf2gdGWX0z-c09MCHhrv9g',
    });

    print("Response rating value= " + response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      var dataMap = jsonDecode(response.body) as List;
     // BusinessRatingCount stayingTime = BusinessRatingCount.fromJson(dataMap);
      //ratingValue.add(stayingTime);

      ratingValue.value = dataMap.map((tagJson) => BusinessRatingCount.fromJson(tagJson)).toList();

      print(ratingValue);

    } else {
      throw ("Error code " + response.statusCode.toString());
    }
  }
}
