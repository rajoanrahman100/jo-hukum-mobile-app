import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/components/settingsDataSaveConfig.dart';
import 'package:johukum/controller/dashBoardController/dashBoardSettingsController.dart';
import 'package:johukum/controller/dashBoardController/singleBusinessAllDataController.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/screens/addBusiness/stepOneScreen.dart';
import 'package:johukum/screens/dashboard/businessDashSetting/fullScreenAlert/cityAlert.dart';
import 'package:johukum/screens/dashboard/businessDashSetting/fullScreenAlert/divisonAlert.dart';
import 'package:johukum/screens/welcomeScreen/welcomeButtonWidget.dart';
import 'package:johukum/widgets/addBusinessForm.dart';
import 'package:johukum/widgets/textWidgets.dart';

import 'fullScreenAlert/areaAlert.dart';

class SettingBusinessDetails extends StatefulWidget {
  @override
  _SettingBusinessDetailsState createState() => _SettingBusinessDetailsState();
}

class _SettingBusinessDetailsState extends State<SettingBusinessDetails> {
  final _formKey = GlobalKey<FormState>();

  var settingController = Get.put(DashBoardSettingController());
  var c = Get.put(SingleBusinessAllDataController());

  var businessName=TextEditingController();
  var businessLandmark=TextEditingController();
  var businessBuilding=TextEditingController();
  var businessOwner=TextEditingController();
  var businessDescription=TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    c.fetchThana(c.businessLocationId.value, "");

    print("*****************${boxNewStorage.read(BUSINESS_MOBILE_NUMBERS)}***********");
    //print("*****************${boxNewStorage.read(BUSINESS_MOBILE_NUMBERS)}***********");

    businessName.text=boxNewStorage.read(Business_NAME);
    businessLandmark.text=boxNewStorage.read(Business_LANDMARK);
    businessBuilding.text=boxNewStorage.read(Business_Building);
    businessOwner.text=boxNewStorage.read(OWNER_NAME);
    businessDescription.text=boxNewStorage.read(BUSINESS_DESCRIPTION);
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: buildBusinessInfoBar("Business Details"),
      body: Responsive(
        mobile: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: crossAxisAlignmentStart,
                children: [
                  textUbuntu("Business Name*", kBlackColor, fontSize: 16.0, fontWeight: weight400),
                  size5,
                  AddBusinessForm(
                    controller: businessName,
                    //initialValue: businssName.text,
                    isSuffix: false,
                    hintText: "",
                    validator: (value) {
                      if (value.isEmpty) {
                        return "This Field is required";
                      }
                      if (value.toString().length < 8) {
                        return "Business name at least 8 character";
                      }
                      _formKey.currentState.save();
                      return null;
                    },
                    onSave: (String value){
                      businessName.text=value;
                    },
                  ),
                  size10,
                  textUbuntu("Landmark", kBlackColor, fontSize: 16.0, fontWeight: weight400),
                  size5,
                  AddBusinessForm(
                    controller: businessLandmark,
                    //initialValue: businssName.text,
                    isSuffix: false,
                    hintText: "",
                    validator: (value) {
                      if (value.isEmpty) {
                        return "This Field is required";
                      }

                      _formKey.currentState.save();
                      return null;
                    },
                    onSave: (String value){
                      businessLandmark.text=value;
                    },
                  ),
                  size10,
                  textUbuntu("Building", kBlackColor, fontSize: 16.0, fontWeight: weight400),
                  size5,
                  AddBusinessForm(
                    controller: businessBuilding,
                    //initialValue: businssName.text,
                    isSuffix: false,
                    hintText: "",
                    validator: (value) {
                      if (value.isEmpty) {
                        return "This Field is required";
                      }

                      _formKey.currentState.save();
                      return null;
                    },
                    onSave: (String value){
                      businessBuilding.text=value;
                    },
                  ),
                  textUbuntu("Area", kBlackColor, fontSize: 16.0, fontWeight: weight400),
                  size5,
                  GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      openAreaDialogSetting(context);
                    },
                    child: Container(
                      height: 50.0,
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(color: kPrimaryPurple.withOpacity(0.2), borderRadius: BorderRadius.circular(10.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(() => textUbuntu(c.businessLocationName.value, kBlackColor.withOpacity(0.6), fontSize: 16)),
                          Icon(Icons.arrow_drop_down_circle, color: kPrimaryPurple)
                        ],
                      ),
                    ),
                  ),
                  size10,
                  textUbuntu("Owner Name", kBlackColor, fontSize: 16.0, fontWeight: weight400),
                  size5,
                  AddBusinessForm(
                    controller: businessOwner,
                    //initialValue: businssName.text,
                    isSuffix: false,
                    hintText: "",
                    validator: (value) {
                      if (value.isEmpty) {
                        return "This Field is required";
                      }

                      _formKey.currentState.save();
                      return null;
                    },
                    onSave: (String value){
                      businessOwner.text=value;
                    },
                  ),
                  size10,
                  textUbuntu("Description", kBlackColor, fontSize: 16.0, fontWeight: weight400),
                  size5,
                  AddBusinessForm(
                    controller: businessDescription,
                    //initialValue: businssName.text,
                    isSuffix: false,
                    hintText: "",
                    maxLine: 4,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "This Field is required";
                      }

                      _formKey.currentState.save();
                      return null;
                    },
                    onSave: (String value){
                      businessDescription.text=value;
                    },
                  ),
                  size10,

                  WelcomeScreenButton(
                    height: 50,
                    isIcon: false,

                    buttonColor: kPrimaryPurple,
                    buttonText: "Save",
                    textColor: kWhiteColor,
                    callback: ()async{

                      if (_formKey.currentState.validate()){
                        FocusScope.of(context).unfocus();
                        print(boxStorage.read(MY_BUSINESS_ID));
                        print(businessName.text);
                        c.updateBusinessData(context, boxStorage.read(MY_BUSINESS_ID),businessName.text,
                            businessLandmark.text,businessBuilding.text,businessOwner.text,businessDescription.text);
                      }

                      //saveData(titleSeo,metaDesc,tagController.tagList,keywordController.keywordList);

                    },
                    borderRadiusGeometry: BorderRadius.circular(10),
                  ),

                ],
              ),
            ),
          ),
        ),
        tablet:SingleChildScrollView(
        child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: crossAxisAlignmentStart,
            children: [
              textUbuntu("Business Name*", kBlackColor, fontSize: 16.0, fontWeight: weight400),
              size5,
              AddBusinessForm(
                controller: businessName,
                //initialValue: businssName.text,
                isSuffix: false,
                hintText: "",
                validator: (value) {
                  if (value.isEmpty) {
                    return "This Field is required";
                  }
                  if (value.toString().length < 8) {
                    return "Business name at least 8 character";
                  }
                  _formKey.currentState.save();
                  return null;
                },
                onSave: (String value){
                  businessName.text=value;
                },
              ),
              size10,
              textUbuntu("Landmark", kBlackColor, fontSize: 16.0, fontWeight: weight400),
              size5,
              AddBusinessForm(
                controller: businessLandmark,
                //initialValue: businssName.text,
                isSuffix: false,
                hintText: "",
                validator: (value) {
                  if (value.isEmpty) {
                    return "This Field is required";
                  }

                  _formKey.currentState.save();
                  return null;
                },
                onSave: (String value){
                  businessLandmark.text=value;
                },
              ),
              size10,
              textUbuntu("Building", kBlackColor, fontSize: 16.0, fontWeight: weight400),
              size5,
              AddBusinessForm(
                controller: businessBuilding,
                //initialValue: businssName.text,
                isSuffix: false,
                hintText: "",
                validator: (value) {
                  if (value.isEmpty) {
                    return "This Field is required";
                  }

                  _formKey.currentState.save();
                  return null;
                },
                onSave: (String value){
                  businessBuilding.text=value;
                },
              ),
              textUbuntu("Area", kBlackColor, fontSize: 16.0, fontWeight: weight400),
              size5,
              GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  openAreaDialogSetting(context);
                },
                child: Container(
                  height: 50.0,
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(color: kPrimaryPurple.withOpacity(0.2), borderRadius: BorderRadius.circular(10.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() => textUbuntu(c.businessLocationName.value, kBlackColor.withOpacity(0.6), fontSize: 16)),
                      Icon(Icons.arrow_drop_down_circle, color: kPrimaryPurple)
                    ],
                  ),
                ),
              ),
              size10,
              textUbuntu("Owner Name", kBlackColor, fontSize: 16.0, fontWeight: weight400),
              size5,
              AddBusinessForm(
                controller: businessOwner,
                //initialValue: businssName.text,
                isSuffix: false,
                hintText: "",
                validator: (value) {
                  if (value.isEmpty) {
                    return "This Field is required";
                  }

                  _formKey.currentState.save();
                  return null;
                },
                onSave: (String value){
                  businessOwner.text=value;
                },
              ),
              size10,
              textUbuntu("Description", kBlackColor, fontSize: 16.0, fontWeight: weight400),
              size5,
              AddBusinessForm(
                controller: businessDescription,
                //initialValue: businssName.text,
                isSuffix: false,
                hintText: "",
                maxLine: 5,
                validator: (value) {
                  if (value.isEmpty) {
                    return "This Field is required";
                  }

                  _formKey.currentState.save();
                  return null;
                },
                onSave: (String value){
                  businessDescription.text=value;
                },
              ),

              size10,

              WelcomeScreenButton(
                height: 55,
                isIcon: false,
                buttonColor: kPrimaryPurple,
                buttonText: "Save",
                textColor: kWhiteColor,
                callback: ()async{

                  if (_formKey.currentState.validate()){
                    FocusScope.of(context).unfocus();
                    print(boxStorage.read(MY_BUSINESS_ID));
                    print(businessName.text);
                    c.updateBusinessData(context, boxStorage.read(MY_BUSINESS_ID),businessName.text,
                        businessLandmark.text,businessBuilding.text,businessOwner.text,businessDescription.text);
                  }

                  //saveData(titleSeo,metaDesc,tagController.tagList,keywordController.keywordList);

                },
                borderRadiusGeometry: BorderRadius.circular(10),
              ),

            ],
          ),
        ),
      ),
    ),
      ),
    );
  }
}
