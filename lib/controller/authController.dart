import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:johukum/components/apis.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/modelClass/logInResponse.dart';
import 'package:http/http.dart' as http;
import 'package:johukum/widgets/customToast.dart';
import 'package:johukum/widgets/johukumLoader.dart';

class AuthController extends GetxController{

  var loginResponse=LoginResponse().obs;

  var logInSuccess=false.obs;


  Future<void> getSignInUser(mobileNumber, password, context) async {
    JohukumLoaderAnimation.showLoaderAnimation(context: context, colorTextBottom: Colors.white);

    var res = await http.post(Uri.parse(signIn),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{"mobile_number": mobileNumber, "password": password}));

    if (res.statusCode == 200 || res.statusCode == 201) {
      logInSuccess.value=true;
      print("succes response " + res.body);
      var dataMap = jsonDecode(res.body);
      LoginResponse logInData = LoginResponse.fromJson(dataMap);
      loginResponse.value = logInData;
      boxStorage.write(KEY_TOKEN, loginResponse.value.token);
      boxStorage.write(KEY_USER_ID, loginResponse.value.user.sId);
      boxStorage.write(KEY_USER_NAME, loginResponse.value.user.firstName);
      boxStorage.write(KEY_USER_EMAIL, loginResponse.value.user.email);
      JohukumLoaderAnimation.hideRokkhiLoaderAnimation(context);
     // Navigator.pushNamed(context, '/bottomNav');
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/bottomNav', (Route<dynamic> route) => false);

      return;
    } else {
      print("error response " + res.body);
      showSnackBar(context: context,message: "Invalid mobile number or password",callBack: (){});
      JohukumLoaderAnimation.hideRokkhiLoaderAnimation(context);
      return;
    }
  }


}