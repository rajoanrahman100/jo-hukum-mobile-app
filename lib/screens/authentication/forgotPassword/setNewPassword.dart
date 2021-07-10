import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/screens/authentication/forgotPassword/forgatPassController.dart';
import 'package:johukum/screens/welcomeScreen/welcomeButtonWidget.dart';
import 'package:johukum/widgets/customToast.dart';
import 'package:johukum/widgets/textWidgets.dart';
import 'package:get/get.dart';

class NewPasswordScreen extends StatelessWidget {

  var passController = TextEditingController();

  var c=Get.put(ForgotPassController());


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;


    return SafeArea(
      child: Scaffold(
        body: Responsive(
          mobile: Stack(
            children: [
              Image.asset(
                "assets/images/welcome.jpg",
                height: size.height,
                width: size.width,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap:()=>Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: kWhiteColor,
                        size: 18.0,
                      ),
                    )
                  ],
                ),
              ),
              Center(
                child: Container(
                  height: size.height / 1.2,
                  width: size.width,
                  margin: EdgeInsets.only(top: 20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Spacer(),
                        size20,
                        Image.asset(
                          "assets/images/newjohukum.png",
                          height: size.height / 4.0,
                        ),
                        size20,
                        Container(
                          width: size.width,
                          decoration: BoxDecoration(
                              color: kWhiteColor,
                              borderRadius: BorderRadius.circular(20.0)),
                          margin: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 30.0,
                                  ),
                                  Text(
                                    "Set a new password",
                                    style: textStyleUbuntu(
                                        color: kBlackColor,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  TextFormField(
                                    controller: passController,
                                    decoration: InputDecoration(
                                      hintText: "password",
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: kPrimaryPurple)),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: kPrimaryPurple)),
                                      errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.red)),
                                      border: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: kPrimaryPurple)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  WelcomeScreenButton(
                                      height: 40.0,
                                      edgeInsetsGeometry:
                                      EdgeInsets.symmetric(
                                          horizontal: 90.0),
                                      buttonColor: kPrimaryPurple,
                                      buttonText: "Save",
                                      textColor: kWhiteColor,
                                      fontSize: 16.0,
                                      isIcon: false,
                                      callback: () {

                                        if(passController.text.isEmpty){
                                          showErrorToast("Create Your New Password");
                                          return;
                                        }if(passController.text.length<8){
                                          showErrorToast("Passwors length must be 8 or above");
                                          return;
                                        }if(!passController.text.contains(RegExp('[A-Za-z]'))){
                                          showErrorToast("Passwors must contains at least one character A-Z or a-z");
                                          return;
                                        }else{
                                          c.setNewPass(passController.text, context);
                                        }
                                        // print("phone ${SharedConfig.pref.get("phone")}");
                                        // Navigator.pushNamed(context, '/userInfo');
                                      }),

                                  SizedBox(
                                    height: 30.0,
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
          tablet: Stack(
            children: [
              Image.asset(
                "assets/images/welcome.jpg",
                height: size.height,
                width: size.width,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap:()=>Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 22.0,
                      ),
                    )
                  ],
                ),
              ),
              Center(
                child: Container(
                  height: size.height / 1.2,
                  width: size.width,
                  margin: EdgeInsets.only(top: 20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Spacer(),
                        Image.asset(
                          "assets/images/newjohukum.png",
                          height: size.height / 3.5,
                        ),
                        size20,
                        Container(
                          width: size.width,
                          decoration: BoxDecoration(
                              color: kWhiteColor,
                              borderRadius: BorderRadius.circular(20.0)),
                          margin: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 30.0,
                                  ),
                                  Text(
                                    "Set a new password",
                                    style: textStyleUbuntu(
                                        color: kBlackColor,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 40.0,
                                  ),
                                  TextFormField(
                                    controller: passController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      hintText: "password",
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: kPrimaryPurple)),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: kPrimaryPurple)),
                                      errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.red)),
                                      border: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: kPrimaryPurple)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  WelcomeScreenButton(
                                      height: 55.0,
                                      edgeInsetsGeometry:
                                      EdgeInsets.symmetric(
                                          horizontal: 90.0),
                                      buttonColor: kPrimaryPurple,
                                      buttonText: "Save",
                                      textColor: kWhiteColor,
                                      fontSize: 16.0,
                                      isIcon: false,
                                      callback: () {

                                        if(passController.text.isEmpty){
                                          showErrorToast("Insert Your Password");
                                          return;
                                        }else{
                                          c.setNewPass(passController.text, context);
                                        }
                                        // print("phone ${SharedConfig.pref.get("phone")}");
                                        // Navigator.pushNamed(context, '/userInfo');
                                      }),
                                  SizedBox(
                                    height: 70.0,
                                  ),
                                  Text(
                                    "Want to change mobile number?",
                                    style: textStyleUbuntu(
                                      color: kPrimaryPurple,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    "Get back",
                                    style: textStyleUbuntu(
                                        color: kBlackColor,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        textDecoration:
                                        TextDecoration.underline),
                                  ),
                                  SizedBox(
                                    height: 30.0,
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
    );
  }
}
