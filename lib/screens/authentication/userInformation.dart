import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:johukum/components/apis.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/controller/passController.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/widgets/customToast.dart';
import 'package:johukum/widgets/johukumLoader.dart';
import 'package:johukum/widgets/textWidgets.dart';

class UserAdditionalInformation extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  //Declare controller for TextFormField
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var confirmPassController = TextEditingController();

  var c = Get.put(PassWordController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Responsive(
            mobile: Container(
          height: size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/welcome.jpg")),
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: kWhiteColor,
                        size: 20,
                      ),
                    ),
                  ),
                  Image.asset(
                    "assets/images/johukuminfologo.png",
                    height: 250,
                  ),
                  Container(
                    margin: EdgeInsets.all(20.0),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(20.0)),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            "Additional Details",
                            style: textStyleUbuntu(
                                color: kBlackColor,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            controller: nameController,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Enter your phone name";
                              }
                              _formKey.currentState.save();
                              return null;
                            },
                            decoration: buildInputDecoration("Enter Name"),
                          ),
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Enter your email id";
                              }
                              _formKey.currentState.save();
                              return null;
                            },
                            decoration: buildInputDecoration("Enter Email"),
                          ),
                          Obx(
                            () => TextFormField(
                              controller: passController,
                              keyboardType: TextInputType.text,
                              obscureText: !c.showPass.value,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Enter your password";
                                }
                                _formKey.currentState.save();
                                return null;
                              },
                              decoration: buildInputDecoration(
                                "Enter Password",
                                icons: GestureDetector(
                                  onTap: () {
                                    c.showPassWord();
                                    FocusScope.of(context).unfocus();
                                  },
                                  child: Icon(
                                    c.showPass.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: confirmPassController,
                            keyboardType: TextInputType.text,
                            obscureText: !c.showConfirmPass.value,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Enter your password again";
                              }
                              _formKey.currentState.save();
                              return null;
                            },
                            decoration: buildInputDecoration(
                              "Confirm password",
                              icons: GestureDetector(
                                onTap: () {
                                  c.showConfirmPassWord();
                                  FocusScope.of(context)
                                      .unfocus(); //hide keyboard
                                },
                                child: Icon(
                                  c.showConfirmPass.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Skip",
                                style: textStyleUbuntu(
                                    color: kBlackColor,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    textDecoration: TextDecoration.underline),
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (_formKey.currentState.validate()) {
                                    if (passController.text !=
                                        confirmPassController.text) {
                                      showErrorToast("Password does not match");
                                      return;
                                    } else {
                                      sendUserInfo(
                                          nameController.text,
                                          emailController.text,
                                          passController.text,
                                          context);
                                    }
                                  }
                                },
                                child: Container(
                                  height: 40.0,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    color: kPrimaryPurple,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "submit",
                                      style: textStyleUbuntu(
                                          color: kWhiteColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }

  Future sendUserInfo(name, email, password, context) async {
    print("mobile Number ${SharedConfig.pref.get("phone")}");

    JohukumLoaderAnimation.showLoaderAnimation(context: context);
    var res = await http.post(Uri.parse(sendInfo),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "first_name": name,
          "email": email,
          "password": password,
          "mobile_number": SharedConfig.pref.get("phone")
        }));

    if (res.statusCode == 200 || res.statusCode == 201) {
      print("succes response " + res.body);
      JohukumLoaderAnimation.hideRokkhiLoaderAnimation(context);
      return;
    } else {
      print("error response " + res.body);
      //Map<String, dynamic> body = jsonDecode(res.body);
      //print(body["user"]);
      JohukumLoaderAnimation.hideRokkhiLoaderAnimation(context);
      showSnackBar(context: context,message: "User with this number alredy exist",label: "");
      return;
    }
  }
}
