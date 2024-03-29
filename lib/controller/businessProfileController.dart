import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:johukum/components/apis.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/modelClass/businessInfoDataModel.dart';
import 'package:johukum/widgets/customToast.dart';
import 'package:johukum/widgets/johukumLoader.dart';

class BusinessProfileController extends GetxController {
  var businessDataModel = BusinessInfoDataModel().obs;
  var loaderShow = true.obs;

  var ratingValue = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getBusinessData(businessID) async {
    loaderShow.value = true;

    print("slug $businessID");

    var response = await get(Uri.parse(individualBusiness + businessID),
        headers: {
      "agent": "jh_mobile_application",
          "session_id":boxStorage.read(SESSION_ID),
          "url":"https://jo-hukum.com/thana-name/business-type/$businessID",
          "referer":"self"
    });

    print("Response = " + response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      loaderShow.value = false;
      var dataMap = jsonDecode(response.body);
      BusinessInfoDataModel businessData = BusinessInfoDataModel.fromJson(dataMap);
      businessDataModel.value = businessData;
      ratingValue.value = businessData.aggregateRating.toDouble();
    } else {
      loaderShow.value = false;
      //showSnackBar(context: context,message: "Oops!Something went wrong",callBack: (){});

      throw ("Error code:: " + response.statusCode.toString());
    }
  }

  Future<void> postUserReview(businessID, addedById, userName, userRating, comment, context,slug) async {
    JohukumLoaderAnimation.showLoaderAnimation(context: context);


    var map=jsonEncode(<String, dynamic>{
      "added_by_id": addedById,
      "added_by": userName,
      "rating": userRating,
      "comment": comment,
    });

    log(map);

    var response = await post(Uri.parse(postReview + businessID + "/review"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "added_by_id": addedById,
          "added_by": userName,
          "rating": userRating,
          "comment": comment,
        }));

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("succes response " + response.body);
      JohukumLoaderAnimation.hideRokkhiLoaderAnimation(context);
      await getBusinessData(slug);
      Get.snackbar('Success!', 'review added successfully', snackPosition: SnackPosition.TOP, backgroundColor:
      kWhiteColor,);
      return;
    } else {
      print("error response " + response.body);
      JohukumLoaderAnimation.hideRokkhiLoaderAnimation(context);
      return;
    }
  }
}
