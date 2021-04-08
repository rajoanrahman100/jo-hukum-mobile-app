import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:johukum/components/apis.dart';
import 'file:///C:/Users/Rifat/AndroidStudioProjects/johukum/lib/components/components.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/screens/welcomeScreen/welcomeButtonWidget.dart';
import 'package:johukum/widgets/customToast.dart';
import 'package:johukum/widgets/johukumLoader.dart';
import 'package:johukum/widgets/textWidgets.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatelessWidget {
  var numberController = TextEditingController();
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
                mobile: Stack(
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
                        height: size.height / 1.2,
                        width: size.width,
                        margin: EdgeInsets.only(top: 20.0),
                        child: Column(
                          children: [
                            Spacer(),
                            Image.asset(
                              "assets/images/johukuminfologo.png",
                              height: size.height / 2.5,
                            ),
                            Container(
                              width: size.width,
                              decoration: BoxDecoration(color: kWhiteColor, borderRadius: BorderRadius.circular(20.0)),
                              margin: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: SingleChildScrollView(
                                  child: Form(
                                    key: _formKey,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 30.0,
                                        ),
                                        Text(
                                          "SIGN UP",
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
                                        SizedBox(
                                          height: 20.0,
                                        ),
                                        WelcomeScreenButton(
                                          height: 40.0,
                                          edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 90.0),
                                          buttonColor: kPrimaryPurple,
                                          buttonText: "Send OTP",
                                          textColor: kWhiteColor,
                                          fontSize: 16.0,
                                          //callback: ()=>Navigator.pushNamed(context, '/otpScreen'),
                                          callback: () {
                                            if (_formKey.currentState.validate()) {
                                              getOtpNumber(numberController.text, context);
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
                                          "Alreday have an account?",
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
                                          "Sign in",
                                          style: textStyleUbuntu(color: kBlackColor, fontSize: 18.0, fontWeight: FontWeight.bold, textDecoration: TextDecoration.underline),
                                        ),
                                        SizedBox(
                                          height: 30.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future getOtpNumber(mobileNumber, context) async {

    JohukumLoaderAnimation.showLoaderAnimation(context: context);

    var res = await http.post(requestOtp,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{"mobile_number": mobileNumber}));

    if (res.statusCode == 200 || res.statusCode == 201) {
      print("succes response " + res.body);
      showSuccessToast("a 6 digit code sent to your number");
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
