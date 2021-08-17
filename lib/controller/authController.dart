import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:johukum/components/apis.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/modelClass/logInResponse.dart';
import 'package:johukum/screens/welcomeScreen/welcomeButtonWidget.dart';
import 'package:johukum/widgets/addBusinessForm.dart';
import 'package:johukum/widgets/customToast.dart';
import 'package:johukum/widgets/johukumLoader.dart';
import 'package:johukum/widgets/textWidgets.dart';

class AuthController extends GetxController {
  var loginResponse = LoginResponse().obs;

  var logInSuccess = false.obs;

  var numberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future<void> handleSignIn(GoogleSignIn googleSignIn, context) async {
    try {
      await googleSignIn.signIn().then((value) {
        print("display name:" + value.displayName);
        print("display email:" + value.email);
        print("ID:" + value.id);
        print("photo url:" + value.photoUrl);

        value.authentication.then((value) async {
          log("ID token:" + value.idToken);
          log("Access token:" + value.accessToken);
          socialDialog(value.idToken, context);
          //await socialLogin(value.idToken);
        });
      });
    } catch (error) {
      print(error);
    }
  }

  socialDialog(token, context) {

    return showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(15.0))),
      isScrollControlled: true,
      context: context,
      builder: (context) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.4,
          padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 15.0),
          decoration: containerBoxDecoration(
            color: kWhiteColor,borderRadius: 10.0
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: crossAxisAlignmentCenter,
                children: [
                  size5,
                  Container(height: 3,width: 50,decoration: containerBoxDecoration(borderRadius: 10.0,color: kPrimaryPurple),),
                  size20,
                  Align(
                    alignment: Alignment.topLeft,
                    child: textUbuntu("For Google Sign In", kPrimaryPurple,fontWeight: weight500,fontSize: 18.0),
                  ),
                  size10,
                  Align(
                    alignment: Alignment.topLeft,
                    child: textUbuntu("We do require your mobile number", kPrimaryPurple,fontWeight: weight500),
                  ),
                  size10,
                  AddBusinessForm(
                    controller: numberController,
                    hintText: "mobile number",
                    isSuffix: false,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Mobile number is required";
                      }

                      _formKey.currentState.save();
                      return null;
                    },
                  ),
                  size10,
                  WelcomeScreenButton(
                    height: 45.0,
                    buttonColor: kPrimaryPurple,
                    borderRadiusGeometry: BorderRadius.circular(10.0),
                    buttonText: "Tap to in",
                    textColor: kWhiteColor,
                    fontSize: 16.0,
                    isIcon: false,
                    callback: () {
                      if (_formKey.currentState.validate()) {
                        socialLogin(token, numberController.text, context);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

  }

  socialLogin(token, mobileNumber, context) async {
    print("token $token");
    print("mobile number $mobileNumber");
    JohukumLoaderAnimation.showLoaderAnimation(context: context, colorTextBottom: Colors.white);

    var res = await http.post(Uri.parse("https://api-login.jo-hukum.com/api/auth/social-login"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body:
            jsonEncode(<String, dynamic>{"token": token, "mobile_number": mobileNumber, "platform": "google", "client_id": "23550904515-krj4o3713k0drkkmrmojbpd8h0s02l7v.apps.googleusercontent.com"}));

    if (res.statusCode == 200 || res.statusCode == 201) {
      JohukumLoaderAnimation.hideRokkhiLoaderAnimation(context);
      print("succes response " + res.body);
      var dataMap = jsonDecode(res.body);
      LoginResponse logInData = LoginResponse.fromJson(dataMap);
      boxStorage.write(KEY_TOKEN, logInData.token);
      boxStorage.write(KEY_USER_ID, logInData.user.sId);
      boxStorage.write(KEY_USER_NAME, logInData.user.firstName);
      boxStorage.write(KEY_USER_EMAIL, logInData.user.email);
      boxStorage.write(KEY_USER_PHONE, logInData.user.mobileNumber);
      showSuccessToast("Google sign in successfully");

      Navigator.of(context).pushNamedAndRemoveUntil('/bottomNav', (Route<dynamic> route) => false);
      return;
    } else {
      print("stataus code ${res.statusCode}");
      print("error response " + res.body);
      JohukumLoaderAnimation.hideRokkhiLoaderAnimation(context);
      return;
    }
  }

  Future<void> getSignInUser(mobileNumber, password, context) async {
    JohukumLoaderAnimation.showLoaderAnimation(context: context, colorTextBottom: Colors.white);

    var res = await http.post(Uri.parse(signIn),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{"mobile_number": mobileNumber, "password": password}));

    if (res.statusCode == 200 || res.statusCode == 201) {
      logInSuccess.value = true;
      print("succes response " + res.body);
      var dataMap = jsonDecode(res.body);
      LoginResponse logInData = LoginResponse.fromJson(dataMap);
      loginResponse.value = logInData;
      boxStorage.write(KEY_TOKEN, loginResponse.value.token);
      boxStorage.write(KEY_USER_ID, loginResponse.value.user.sId);
      boxStorage.write(KEY_USER_NAME, loginResponse.value.user.firstName);
      boxStorage.write(KEY_USER_EMAIL, loginResponse.value.user.email);
      boxStorage.write(KEY_USER_PHONE, loginResponse.value.user.mobileNumber);
      JohukumLoaderAnimation.hideRokkhiLoaderAnimation(context);
      // Navigator.pushNamed(context, '/bottomNav');
      Navigator.of(context).pushNamedAndRemoveUntil('/bottomNav', (Route<dynamic> route) => false);

      return;
    } else {
      print("error response " + res.body);
      showSnackBar(context: context, message: res.body, callBack: () {});
      JohukumLoaderAnimation.hideRokkhiLoaderAnimation(context);
      return;
    }
  }
}
