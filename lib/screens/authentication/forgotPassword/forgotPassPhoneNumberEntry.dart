import 'package:flutter/material.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/controller/otpController.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/screens/welcomeScreen/welcomeButtonWidget.dart';
import 'package:johukum/widgets/textWidgets.dart';
import 'package:get/get.dart';

import 'forgatPassController.dart';

class ForgotPassNumberEntry extends StatelessWidget {

  var numberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  var c = Get.put(ForgotPassController());


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
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        print("OKOOK");
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: kWhiteColor,
                        size: 20.0,
                      ),
                    )
                  ],
                ),
              ),
              Center(
                child: Container(
                  height: size.height / 1,
                  width: size.width,
                  margin: EdgeInsets.only(top: 20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        //Spacer(),
                        SizedBox(height: 30.0,),

                        Image.asset(
                          "assets/images/johukuminfologo.png",
                          height: size.height / 3.0,
                        ),
                        SizedBox(height: 30.0,),
                        Container(
                          width: size.width,
                          decoration: BoxDecoration(color: kWhiteColor, borderRadius: BorderRadius.circular(20.0)),
                          margin: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Form(
                              key: _formKey,
                              child:  Column(
                                children: [
                                  SizedBox(
                                    height: 30.0,
                                  ),
                                  Text(
                                    "Forgot Password",
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
                                      }
                                      if (value.length > 11 || value.length < 11) {
                                        return "Number format is invalid";
                                      }
                                      _formKey.currentState.save();
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Enter Mobile Number",
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
                                    isIcon: false,
                                    //callback: ()=>Navigator.pushNamed(context, '/otpScreen'),
                                    callback: () {



                                      if (_formKey.currentState.validate()) {
                                        c.getOtpNumber(numberController.text, context);
                                      }
                                    },
                                  ),
                                  SizedBox(
                                    height: 20.0,
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
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 25.0,
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
                        //Spacer(),
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
                                child:  Column(
                                  children: [
                                    SizedBox(
                                      height: 30.0,
                                    ),
                                    Text(
                                      "SIGN UP",
                                      style: textStyleUbuntu(color: kBlackColor, fontSize: 20.0, fontWeight: FontWeight.w500),
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
                                        }
                                        if (value.length > 11 || value.length < 11) {
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
                                      height: 30.0,
                                    ),
                                    WelcomeScreenButton(
                                      height: 55.0,
                                      edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 90.0),
                                      buttonColor: kPrimaryPurple,
                                      buttonText: "Send OTP",
                                      textColor: kWhiteColor,
                                      fontSize: 16.0,
                                      isIcon: false,
                                      //callback: ()=>Navigator.pushNamed(context, '/otpScreen'),
                                      callback: () {
                                        if (_formKey.currentState.validate()) {
                                          c.getOtpNumber(numberController.text, context);
                                        }
                                      },
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
