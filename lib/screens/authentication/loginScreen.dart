import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:johukum/components/apis.dart';
import 'package:johukum/screens/welcomeScreen/welcomeButtonWidget.dart';
import 'package:johukum/widgets/circularButtonProgress.dart';
import 'package:johukum/widgets/customToast.dart';
import 'package:johukum/widgets/johukumLoader.dart';
import 'package:johukum/widgets/textWidgets.dart';
import 'package:http/http.dart' as http;
import '../../components/components.dart';
import '../../responsive.dart';

class SignInScreen extends StatelessWidget {
  var numberController = TextEditingController();
  var passWordController = TextEditingController();
  var confirmPassWordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Responsive(
                mobile: Container(
                  height: size.height,
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/images/welcome.jpg",
                        height: size.height,
                        width: size.width,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              color: kWhiteColor,
                              size: 18.0,
                            )
                          ],
                        ),
                      ),
                      Center(
                        child: Container(
                          height: size.height / 1,
                          width: size.width,
                          margin: EdgeInsets.only(top: 20.0),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/images/johukuminfologo.png",
                                  height: size.height / 2.7,
                                ),
                                Container(
                                  width: size.width,
                                  decoration: BoxDecoration(color: kWhiteColor, borderRadius: BorderRadius.circular(20.0)),
                                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Text(
                                            "SIGN IN",
                                            style: textStyleUbuntu(color: kBlackColor, fontSize: 18.0, fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          TextFormField(
                                            controller: numberController,
                                            keyboardType: TextInputType.number,
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return "Enter your phone number";
                                              }if(value.length>11 || value.length<11){
                                                return "Number format is invalid";
                                              }
                                              _formKey.currentState.save();
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              hintText: "Mobile Number",
                                              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: kPrimaryPurple)),
                                              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: kPrimaryPurple)),
                                              errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                                              border: UnderlineInputBorder(borderSide: BorderSide(color: kPrimaryPurple)),
                                            ),
                                          ),
                                          TextFormField(
                                            controller: passWordController,
                                            keyboardType: TextInputType.text,
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return "Enter your password";
                                              }
                                              _formKey.currentState.save();
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              hintText: "Enter Password",
                                              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: kPrimaryPurple)),
                                              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: kPrimaryPurple)),
                                              errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                                              border: UnderlineInputBorder(borderSide: BorderSide(color: kPrimaryPurple)),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              "Forgot Password?",
                                              style: textStyleUbuntu(color: kPrimaryPurple, fontSize: 16.0, fontWeight: FontWeight.w500, textDecoration: TextDecoration.underline),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          WelcomeScreenButton(
                                            height: 40.0,
                                            edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 90.0),
                                            buttonColor: kPrimaryPurple,
                                            buttonText: "Tap to in",
                                            textColor: kWhiteColor,
                                            fontSize: 16.0,
                                            callback: () {
                                              if (_formKey.currentState.validate()) {
                                                getSignInUser(numberController.text, passWordController.text, context);
                                              }
                                            },
                                          ),
                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          Text(
                                            "Or use your account",
                                            style: textStyleUbuntu(color: kPrimaryPurple, fontSize: 16.0, fontWeight: FontWeight.w500, textDecoration: TextDecoration.underline),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Image.asset("assets/images/fb.png"),
                                              SizedBox(
                                                width: 5.0,
                                              ),
                                              Image.asset("assets/images/google.png"),
                                              SizedBox(
                                                width: 5.0,
                                              ),
                                              Image.asset("assets/images/apple.png"),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          Text(
                                            "Don't have an account?",
                                            style: textStyleUbuntu(
                                              color: kPrimaryPurple,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Text(
                                            "Sign Up",
                                            style: textStyleUbuntu(color: kBlackColor, fontSize: 18.0, fontWeight: FontWeight.bold, textDecoration: TextDecoration.underline),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Future getSignInUser(mobileNumber, password, context) async {

    JohukumLoaderAnimation.showLoaderAnimation(context: context, colorTextBottom: Colors.white);

    var res = await http.post(signIn,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{"mobile_number": mobileNumber, "password": password}));

    if (res.statusCode == 200 || res.statusCode == 201) {
      print("succes response " + res.body);
      JohukumLoaderAnimation.hideRokkhiLoaderAnimation(context);
      return;

    } else {

      print("error response " + res.body);
      showErrorToast("Invalid number or password");
      JohukumLoaderAnimation.hideRokkhiLoaderAnimation(context);
      return;
    }
  }
}
