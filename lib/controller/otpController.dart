import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:johukum/components/apis.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/widgets/customToast.dart';
import 'package:johukum/widgets/johukumLoader.dart';
import 'package:http/http.dart'  as http;

class OtpController extends GetxController{

  Future getOtpNumber(mobileNumber, context) async {

    JohukumLoaderAnimation.showLoaderAnimation(context: context);

    SharedConfig.pref.setString("phone", mobileNumber);

    boxStorage.write(KEY_USER_PHONE, mobileNumber);

    var res = await http.post(Uri.parse(requestOtp),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{"mobile_number": mobileNumber}));

    if (res.statusCode == 200 || res.statusCode == 201) {
      print("succes response " + res.body);
      JohukumLoaderAnimation.hideRokkhiLoaderAnimation(context);
      Get.snackbar("Otp Success!", "a 6 digit code has sent to your number",backgroundColor: kWhiteColor);
      Navigator.pushNamed(context,'/otpScreen');
      //showSuccessToast("a 6 digit code sent to your number");
      return;
    } else {
      print("error response " + res.body);
      showSnackBar(context: context,message: res.body,callBack: (){});
      //showErrorToast("Invalid number or password");
      JohukumLoaderAnimation.hideRokkhiLoaderAnimation(context);
      return;
    }
  }


  Future verifyOtpNumber(otpValue, context) async {

    JohukumLoaderAnimation.showLoaderAnimation(context: context);

    var res = await http.post(Uri.parse(verifyOtp),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{"otp": otpValue}));

    if (res.statusCode == 200 || res.statusCode == 201) {
      print("succes response " + res.body);
      JohukumLoaderAnimation.hideRokkhiLoaderAnimation(context);
      Navigator.pushNamed(context,'/userInfo');
      //showSuccessToast("a 6 digit code sent to your number");
      return;
    } else {
      print("error response " + res.body);
      showErrorToast("You have given a invalid OTP number");
      JohukumLoaderAnimation.hideRokkhiLoaderAnimation(context);
      return;
    }
  }

}