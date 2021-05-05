import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/controller/listWidgetController.dart';
import 'package:johukum/modelClass/AddPhoneNumbers.dart';
import 'package:johukum/screens/addBusiness/stepOneScreen.dart';
import 'package:johukum/screens/welcomeScreen/welcomeButtonWidget.dart';
import 'package:johukum/widgets/addBusinessForm.dart';
import 'package:johukum/widgets/textWidgets.dart';

import '../../responsive.dart';

class StepTwoScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  List<Widget> children = [];
  int count = 1;

  var controller = Get.put(ListWidgetController());

  var myNumbers=[];
  final List<TextEditingController> mobileNumberControllerList = List();
  var numberController=TextEditingController();
  List<Map<String, dynamic>> send=[] ;

  ///Text editing controller
  var title=TextEditingController();
  var fullName=TextEditingController();
  var designation=TextEditingController();
  var phoneNumber=TextEditingController();
  var email=TextEditingController();
  var fax=TextEditingController();
  var facebook=TextEditingController();
  var website=TextEditingController();
  var instagram=TextEditingController();
  var twitter=TextEditingController();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: buildBusinessInfoBar("Step 2/10"),
      body: Container(
        height: size.height,
        child: Responsive(
          mobile: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    size10,
                    textUbuntu("Title*", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                    AddBusinessForm(
                      controller: title,
                      hintText: "Mr/Mrs",
                      suffixIcon: Icon(
                        Icons.arrow_drop_down_circle,
                        color: kPrimaryPurple,
                      ),
                      isSuffix: true,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "This Field is required";
                        }
                        _formKey.currentState.save();
                        return null;
                      },
                    ),
                    size10,
                    textUbuntu("Full Name*", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                    AddBusinessForm(
                      controller: fullName,
                      hintText: "full name",
                      isSuffix: false,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "This Field is required";
                        }
                        _formKey.currentState.save();
                        return null;
                      },
                    ),
                    size10,
                    textUbuntu("Designation*", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                    AddBusinessForm(
                      controller:designation ,
                      hintText: "designation",
                      isSuffix: false,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "This Field is required";
                        }
                        _formKey.currentState.save();
                        return null;
                      },
                    ),
                    size10,
                    textUbuntu("Phone Number", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                    AddBusinessForm(
                      controller: numberController,
                      textInputType: TextInputType.number,
                      hintText: "phone number",
                      onChange: (val){
                        send=[{'mobile':val}];

                      },
                      isSuffix: false,
                    ),
                    size10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textUbuntu("Mobile Number*", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                      ],
                    ),
                    AddBusinessForm(
                      textInputType: TextInputType.number,
                      hintText: "mobile number",
                      isSuffix: false,
                    ),
                    Obx(
                      () => controller.list.length == 0
                          ? Text("")
                          : ListView.builder(
                              itemCount: controller.list.length,
                              shrinkWrap: true,
                              itemBuilder: (_, index) {
                                return GestureDetector(
                                  onTap: () {
                                    //controller.list.removeAt(index);
                                  },
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Expanded(flex: 1, child: controller.list[index]),
                                        SizedBox(width: 10,),
                                        GestureDetector(onTap: () {
                                          controller.list.removeAt(index);
                                        }, child: Icon(Icons.cancel,color: kPrimaryPurple,))
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                    size5,
                    WelcomeScreenButton(
                      height: 40.0,
                      edgeInsetsGeometry: EdgeInsets.only(right: 140.0),
                      buttonText: "Add Phone Number",
                      textColor: kWhiteColor,
                      borderRadiusGeometry: BorderRadius.circular(10.0),
                      isIcon: false,
                      buttonColor: kPrimaryPurple,
                      callback: () {
                        controller.addWidget(
                          AddBusinessForm(
                            controller: numberController,
                            onChange: (value){
                              send=[{'mobile':value}];
                            },
                            textInputType: TextInputType.number,
                            hintText: "mobile number",
                            isSuffix: false,
                          ),
                        );
                      },
                    ),
                    size10,
                    textUbuntu("Email", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                    AddBusinessForm(
                      controller: email,
                      textInputType: TextInputType.emailAddress,
                      hintText: "email",
                      isSuffix: false,
                    ),
                    size10,
                    textUbuntu("Fax", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                    AddBusinessForm(
                      controller: fax,
                      textInputType: TextInputType.emailAddress,
                      hintText: "fax",
                      isSuffix: false,
                    ),
                    size10,
                    textUbuntu("Website", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                    AddBusinessForm(
                      controller: website,
                      textInputType: TextInputType.emailAddress,
                      hintText: "website",
                      isSuffix: false,
                    ),
                    size10,
                    textUbuntu("Facebook", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                    AddBusinessForm(
                      controller: facebook,
                      textInputType: TextInputType.emailAddress,
                      hintText: "facebook link",
                      isSuffix: false,
                    ),
                    size10,
                    textUbuntu("Instagram", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                    AddBusinessForm(
                      controller: instagram,
                      textInputType: TextInputType.emailAddress,
                      hintText: "instagram link",
                      isSuffix: false,
                    ),
                    size10,
                    textUbuntu("Twitter", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                    AddBusinessForm(
                      controller: twitter,
                      textInputType: TextInputType.emailAddress,
                      hintText: "twitter link",
                      isSuffix: false,
                    ),
                    size10,
                    GestureDetector(
                      onTap: (){
                       // print(send);
                        if (_formKey.currentState.validate()) {

                          boxStorage.write(KEY_BUSINESS_OWNER_NAME, fullName);
                          boxStorage.write(KEY_BUSINESS_OWNER_TITLE, title.text);
                          boxStorage.write(KEY_BUSINESS_DESIGNATION, designation.text);
                          boxStorage.write(KEY_BUSINESS_PHONE_NUMBER, numberController.text);
                          boxStorage.write(KEY_BUSINESS_FACEBOOK, facebook.text);
                          boxStorage.write(KEY_BUSINESS_FAX, fax.text);
                          boxStorage.write(KEY_BUSINESS_WEBSITE, website.text);
                          boxStorage.write(KEY_BUSINESS_TWITTER, twitter.text);
                          boxStorage.write(KEY_BUSINESS_EMAIL, email.text);

                          Navigator.pushNamed(context, '/stepThree');
                        }
                        //Navigator.pushNamed(context, '/stepThree');
                      },
                      child: Row(
                        children: [
                          Expanded(child: Container()),
                          textUbuntu("Go To Step 3 ", kPrimaryPurple, fontWeight: weightBold, fontSize: 18.0),
                          Icon(
                            Icons.arrow_forward,
                            color: kPrimaryPurple,
                          )
                        ],
                      ),
                    ),
                    size20,

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
