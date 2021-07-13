import 'dart:convert';

import 'package:get/get.dart';
import 'package:johukum/components/apis.dart';
import 'package:http/http.dart' as http;

class OtpControllerBusinessClaim extends GetxController{

  Future getOtpNumber(mobileNumber, context) async {


    var res = await http.post(Uri.parse(requestOtp),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{"mobile_number": mobileNumber}));

    if (res.statusCode == 200 || res.statusCode == 201) {
      print("succes response " + res.body);
      return;
    } else {
      print("error response " + res.body);
     // JohukumLoaderAnimation.hideRokkhiLoaderAnimation(context);
      return;
    }
  }


  Future verifyOtpNumber(otpValue, context) async {

    print("CALL");

    var res = await http.post(Uri.parse(verifyOtp),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{"otp": otpValue}));

    print(res.statusCode);

    return res.statusCode;

    /*if (res.statusCode == 200 || res.statusCode == 201) {
      print("succes response " + res.body);
      //showSuccessToast("a 6 digit code sent to your number");
      return;
    } else {
      print("error response " + res.body);
      return;
    }*/
  }
}