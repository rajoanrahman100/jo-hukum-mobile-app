import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:johukum/components/apis.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/modelClass/logInResponse.dart';
import 'package:johukum/modelClass/updateProfileModel.dart';
import 'package:johukum/widgets/customToast.dart';
import 'package:johukum/widgets/johukumLoader.dart';

class UserProfileController extends GetxController {

  var tapToSee = false.obs;

  changeStatus() {
    tapToSee.value = !tapToSee.value;
  }

  Future<void> getResetPass(oldPass,newPass,context) async {

    JohukumLoaderAnimation.showLoaderAnimation(context: context, colorTextBottom: Colors.white);

    var res = await http.post(Uri.parse(resetPass),
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8', 'Authorization': boxStorage.read(KEY_TOKEN)},
        body: jsonEncode(<String, dynamic>{"old_password": oldPass, "new_password": newPass}));

    if (res.statusCode == 200 || res.statusCode == 201) {
      print("succes response " + res.body);
      JohukumLoaderAnimation.hideRokkhiLoaderAnimation(context);
      showSnackBar(context: context,message: "Password Reset Successfully",callBack: (){});

      //showToast("Password Reset Successfully");
      return;

    } else {
      print("error response " + res.body);
      JohukumLoaderAnimation.hideRokkhiLoaderAnimation(context);
      return;
    }
  }

  Future<void> setProfileUpdate(context,userID,firstName,email) async {

    JohukumLoaderAnimation.showLoaderAnimation(context: context, colorTextBottom: Colors.white);

    var res = await http.patch(Uri.parse(updateProfile+userID),
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8', 'Authorization': boxStorage.read(KEY_TOKEN)},
        body: jsonEncode(<String, dynamic>{"first_name": firstName,"email":email}));

    if (res.statusCode == 200 || res.statusCode == 201) {
      print("succes response " + res.body);
      var dataMap = jsonDecode(res.body);
      UpdateProfileModel logInData = UpdateProfileModel.fromJson(dataMap);
      boxStorage.write(KEY_USER_NAME, logInData.firstName);
      boxStorage.write(KEY_USER_EMAIL, logInData.email);
      JohukumLoaderAnimation.hideRokkhiLoaderAnimation(context);
      showToast("Profile Update Successfully");
      Navigator.of(context).pushNamedAndRemoveUntil('/welcome', (Route<dynamic> route) => false);
      //showToast("Password Reset Successfully");
      return;

    } else {
      print("error response " + res.body);
      JohukumLoaderAnimation.hideRokkhiLoaderAnimation(context);
      return;
    }
  }
}
