import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/controller/addBusinessController.dart';
import 'package:johukum/controller/divisionController.dart';
import 'package:johukum/controller/listWidgetController.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/screens/fullScreenAlertDialog/fullScreenCity.dart';
import 'package:johukum/screens/fullScreenAlertDialog/fullScreenDivision.dart';
import 'package:johukum/screens/fullScreenAlertDialog/fullScreenThana.dart';
import 'package:johukum/screens/welcomeScreen/welcomeButtonWidget.dart';
import 'package:johukum/widgets/addBusinessForm.dart';
import 'package:johukum/widgets/customToast.dart';
import 'package:johukum/widgets/textWidgets.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class StepOneScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  var divisionController = Get.put(DivisionController());

  var businessNameController = TextEditingController();
  var streetAddressController = TextEditingController();
  var landMarkController = TextEditingController();
  var buildingNameController = TextEditingController();
  var divisionNameController = TextEditingController();
  var cityNameController = TextEditingController();
  var thanaController = TextEditingController();
  var postalCodeController = TextEditingController();
  var areaNameController = TextEditingController();
  var plusCodeController = TextEditingController();

  var title = TextEditingController();
  var fullName = TextEditingController();
  var designation = TextEditingController();
  var phoneNumber = TextEditingController();
  var email = TextEditingController();
  var fax = TextEditingController();
  var facebook = TextEditingController();
  var website = TextEditingController();

  var businessController = Get.put(AddBusinessController());

  var controller = Get.put(ListWidgetController());
  var nameTitleList = ["Mr.", "Mrs.", "Miss.", "Dr."];
  var designationList = ["Owner", "Co-founder", "Propritor", "Managing Director","Chairman"];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: buildBusinessInfoBar("Step 1"),
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
                    WelcomeScreenButton(
                      height: 50,
                      borderRadiusGeometry: BorderRadius.circular(10.0),
                      edgeInsetsGeometry: EdgeInsets.symmetric(vertical: 10.0),
                      buttonText: "Fillup Business Info",
                      buttonColor: kPrimaryPurple,
                      textColor: kWhiteColor,
                      isIcon: false,
                    ),
                    textUbuntu("Business Name*", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                    AddBusinessForm(
                      controller: businessNameController,
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
                    ),
                    size10,
                    textUbuntu("Street Address*", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                    AddBusinessForm(
                      controller: streetAddressController,
                      hintText: "",
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
                    textUbuntu("Land Mark*", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                    AddBusinessForm(
                      controller: landMarkController,
                      hintText: "",
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
                    textUbuntu("Building*", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                    AddBusinessForm(
                      hintText: "",
                      controller: buildingNameController,
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
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textUbuntu("Division*", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                              size5,
                              GestureDetector(
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  openDivisionDialog(context);
                                },
                                child: Container(
                                  height: 50.0,
                                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                                  decoration: BoxDecoration(
                                      color: kPrimaryPurple.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(10.0)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Obx(() => textUbuntu(
                                          divisionController.selectDivision.value, kBlackColor.withOpacity(0.6),
                                          fontSize: 16)),
                                      Icon(Icons.arrow_drop_down_circle, color: kPrimaryPurple)
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        width10,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textUbuntu("City*", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                              size5,
                              GestureDetector(
                                onTap: () async {
                                  if (divisionController.isButtonClickable.value) {
                                    Duration time = Duration(seconds: 1);

                                    divisionController.isButtonClickable.value = false; //make the button disable to
                                    // making variable false.
                                    print("Clicked Once");
                                    Future.delayed(time, () async {
                                      await divisionController.fetchCity(divisionController.selectDivisionId.value, "");
                                      openCityDialog(context);
                                      divisionController.isButtonClickable.value = true; //future delayed to change
                                      // the button back to clickable
                                    });
                                  }
                                },
                                child: Container(
                                  height: 50.0,
                                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                                  decoration: BoxDecoration(
                                      color: kPrimaryPurple.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(10.0)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Obx(() => textUbuntu(
                                          divisionController.selectCity.value, kBlackColor.withOpacity(0.6),
                                          fontSize: 16)),
                                      Icon(Icons.arrow_drop_down_circle, color: kPrimaryPurple)
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    size10,
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: crossAxisAlignmentStart,
                            children: [
                              textUbuntu("Thana*", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                              size5,
                              GestureDetector(
                                onTap: () async {
                                  if (divisionController.isButtonClickable.value) {
                                    Duration time = Duration(seconds: 1);

                                    divisionController.isButtonClickable.value = false; //make the button disable to
                                    // making variable false.
                                    print("Clicked Once");
                                    Future.delayed(time, () async {
                                      await divisionController.fetchThana(divisionController.selectCityId.value, "");
                                      openThanaDialog(context);
                                      divisionController.isButtonClickable.value = true; //future delayed to change
                                      // the button back to clickable
                                    });
                                  }
                                },
                                child: Container(
                                  height: 50.0,
                                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                                  decoration: BoxDecoration(
                                      color: kPrimaryPurple.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(10.0)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Obx(() => textUbuntu(
                                          divisionController.selectThana.value, kBlackColor.withOpacity(0.6),
                                          fontSize: 16)),
                                      Icon(Icons.arrow_drop_down_circle, color: kPrimaryPurple)
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        width10,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textUbuntu("Postal Code*", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                              AddBusinessForm(
                                controller: postalCodeController,
                                hintText: "",
                                isSuffix: false,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "This Field is required";
                                  }
                                  _formKey.currentState.save();
                                  return null;
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    size10,
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textUbuntu("Title*", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                                size5,
                                GestureDetector(
                                  onTap: () {
                                    showBarModalBottomSheet(
                                        backgroundColor: kWhiteColor,
                                        context: context,
                                        expand: false,
                                        builder: (context) => Container(
                                              height: size.height * 0.3,
                                              child: ListView.builder(
                                                itemCount: nameTitleList.length,
                                                itemBuilder: (_, index) {
                                                  return ListTile(
                                                    onTap: () {
                                                      controller.nameTitle.value = nameTitleList[index];
                                                      Navigator.of(context).pop();
                                                    },
                                                    leading: Icon(
                                                      Icons.person,
                                                      color: kPrimaryPurple,
                                                    ),
                                                    title: textUbuntu(nameTitleList[index], kPrimaryPurple),
                                                  );
                                                },
                                              ),
                                            ));
                                  },
                                  child: Container(
                                    height: 50.0,
                                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                                    decoration: BoxDecoration(
                                        color: kPrimaryPurple.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(10.0)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Obx(
                                          () => textUbuntu(controller.nameTitle.value, kBlackColor.withOpacity(0.6),
                                              fontSize: 14),
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down_circle,
                                          color: kPrimaryPurple,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        width10,
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: crossAxisAlignmentStart,
                            children: [
                              textUbuntu("Full Name*", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                              AddBusinessForm(
                                controller: fullName,
                                hintText: "",
                                isSuffix: false,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "This Field is required";
                                  }
                                  _formKey.currentState.save();
                                  return null;
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    size10,
                    textUbuntu("Designation*", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                    size5,
                    GestureDetector(
                      onTap: () async {
                        showBarModalBottomSheet(
                            backgroundColor: kWhiteColor,
                            context: context,
                            expand: false,
                            builder: (context) => Container(
                              height: size.height * 0.35,
                              child: ListView.builder(
                                itemCount: designationList.length,
                                itemBuilder: (_, index) {
                                  return ListTile(
                                    onTap: () {
                                      controller.designationTitle.value = designationList[index];
                                      Navigator.of(context).pop();
                                    },
                                    leading: Icon(
                                      Icons.person,
                                      color: kPrimaryPurple,
                                    ),
                                    title: textUbuntu(designationList[index], kPrimaryPurple),
                                  );
                                },
                              ),
                            ));
                      },
                      child: Container(
                        height: 50.0,
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                            color: kPrimaryPurple.withOpacity(0.2), borderRadius: BorderRadius.circular(10.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(() => textUbuntu(controller.designationTitle.value, kBlackColor.withOpacity(0.6),
                                fontSize: 16)),
                            Icon(Icons.arrow_drop_down_circle, color: kPrimaryPurple)
                          ],
                        ),
                      ),
                    ),
                    size10,
                    textUbuntu("Website", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                    AddBusinessForm(
                      controller: website,
                      hintText: "",
                      isSuffix: false,

                    ),
                    textUbuntu("Facebook Page", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                    AddBusinessForm(
                      controller: facebook,
                      hintText: "",
                      isSuffix: false,

                    ),
                    size10,
                    GestureDetector(
                      onTap: () {


                        //Navigator.pushNamed(context, '/stepTwo');

                        if (_formKey.currentState.validate()) {
                          if (divisionController.selectDivision.value.isEmpty) {
                            showErrorToast("Select Division");
                            return;
                          } else if (divisionController.selectCity.value.isEmpty) {
                            showErrorToast("Select City");
                            return;
                          } else if (divisionController.selectThana.value.isEmpty) {
                            showErrorToast("Select Thana");
                            return;
                          } else {

                            Map<String,dynamic> map={
                              "business name":businessNameController.text,
                              "steert address":streetAddressController.text,
                              "land mark":streetAddressController.text,
                              "building":buildingNameController.text,
                              "thana id":divisionController.selectThanaId.value,
                              "postal code":postalCodeController.text,
                              "title":controller.nameTitle.value,
                              "full Name":fullName.text,
                              "designation":controller.designationTitle.value,
                              "website":website.text.isEmpty?"No Website Found":website.text,

                            };

                            log(map.toString());

                            boxStorage.write(KEY_USER_BUILDING, buildingNameController.text);
                            boxStorage.write(KEY_USER_BUSINESS_NAME, businessNameController.text);
                            boxStorage.write(KEY_USER_LANDMARK, landMarkController.text);
                            boxStorage.write(KEY_USER_STREET_ADDRESS, streetAddressController.text);
                            boxStorage.write(KEY_USER_THANA_ID, divisionController.selectThanaId.value);
                            //boxStorage.write(KEY_USER_PLUS_CODE, plusCodeController.text);
                            boxStorage.write(KEY_USER_POSTAL_CODE, postalCodeController.text);
                            boxStorage.write(KEY_BUSINESS_OWNER_NAME, fullName.text);
                            boxStorage.write(KEY_BUSINESS_OWNER_TITLE, controller.nameTitle.value);
                            boxStorage.write(KEY_BUSINESS_DESIGNATION, controller.designationTitle.value);
                            boxStorage.write(KEY_BUSINESS_WEBSITE, website.text??"NO WESBSITE FOUND");
                            boxStorage.write(KEY_BUSINESS_FACEBOOK, facebook.text??"NO FACEBOOK PAGE FOUND");
                            //boxStorage.write(KEY_USER_AREA, areaNameController.text);
                            Navigator.pushNamed(context, '/stepTwo');
                          }
                        }
                      },
                      child: Row(
                        children: [
                          Expanded(child: Container()),
                          Container(
                            height: 40.0,
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            decoration: containerBoxDecoration(
                              borderRadius: 10.0,
                              color: kPrimaryPurple
                            ),
                            child: Row(
                              children: [
                                textUbuntu("Go To Step 2 ", Colors.white, fontWeight: weightBold, fontSize: 16.0),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 18.0,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    size20
                  ],
                ),
              ),
            ),
          ),
          tablet: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WelcomeScreenButton(
                      height: 60,
                      borderRadiusGeometry: BorderRadius.circular(10.0),
                      edgeInsetsGeometry: EdgeInsets.symmetric(vertical: 10.0),
                      buttonText: "Fillup Business Info",
                      buttonColor: kPrimaryPurple,
                      textColor: kWhiteColor,
                      isIcon: false,
                    ),
                    textUbuntu("Business Name*", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                    AddBusinessForm(
                      controller: businessNameController,
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
                    ),
                    size10,
                    textUbuntu("Street Address*", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                    AddBusinessForm(
                      controller: streetAddressController,
                      hintText: "",
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
                    textUbuntu("Land Mark*", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                    AddBusinessForm(
                      controller: landMarkController,
                      hintText: "",
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
                    textUbuntu("Building*", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                    AddBusinessForm(
                      hintText: "",
                      controller: buildingNameController,
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
                    textUbuntu("Division*", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                    size5,
                    Container(
                      height: 50.0,
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                          color: kPrimaryPurple.withOpacity(0.2), borderRadius: BorderRadius.circular(10.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(() => textUbuntu(divisionController.selectDivision.value, kBlackColor.withOpacity(0.6),
                              fontSize: 16)),
                          GestureDetector(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                openDivisionDialog(context);
                              },
                              child: Icon(Icons.arrow_drop_down_circle, color: kPrimaryPurple))
                        ],
                      ),
                    ),
                    size10,
                    textUbuntu("City*", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                    size5,
                    Container(
                      height: 50.0,
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                          color: kPrimaryPurple.withOpacity(0.2), borderRadius: BorderRadius.circular(10.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(() => textUbuntu(divisionController.selectCity.value, kBlackColor.withOpacity(0.6),
                              fontSize: 16)),
                          GestureDetector(
                              onTap: () async {
                                await divisionController.fetchCity(divisionController.selectDivisionId.value, "");
                                openCityDialog(context);
                              },
                              child: Icon(Icons.arrow_drop_down_circle, color: kPrimaryPurple))
                        ],
                      ),
                    ),
                    size10,
                    textUbuntu("Area*", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                    size5,
                    Container(
                      height: 50.0,
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                          color: kPrimaryPurple.withOpacity(0.2), borderRadius: BorderRadius.circular(10.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(() => textUbuntu(divisionController.selectThana.value, kBlackColor.withOpacity(0.6),
                              fontSize: 16)),
                          GestureDetector(
                              onTap: () async {
                                await divisionController.fetchThana(divisionController.selectCityId.value, "");
                                openThanaDialog(context);
                              },
                              child: Icon(Icons.arrow_drop_down_circle, color: kPrimaryPurple))
                        ],
                      ),
                    ),
                    size10,
                    textUbuntu("Postal Code*", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                    AddBusinessForm(
                      controller: postalCodeController,
                      hintText: "",
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
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState.validate()) {
                          if (divisionController.selectDivision.value.isEmpty) {
                            showErrorToast("Select Division");
                            return;
                          } else if (divisionController.selectCity.value.isEmpty) {
                            showErrorToast("Select City");
                            return;
                          } else if (divisionController.selectThana.value.isEmpty) {
                            showErrorToast("Select Thana");
                            return;
                          } else {
                            boxStorage.write(KEY_USER_BUILDING, buildingNameController.text);
                            boxStorage.write(KEY_USER_BUSINESS_NAME, businessNameController.text);
                            boxStorage.write(KEY_USER_LANDMARK, landMarkController.text);
                            boxStorage.write(KEY_USER_STREET_ADDRESS, streetAddressController.text);
                            boxStorage.write(KEY_USER_THANA_ID, divisionController.selectThanaId.value);
                            boxStorage.write(KEY_USER_PLUS_CODE, plusCodeController.text);
                            boxStorage.write(KEY_USER_POSTAL_CODE, postalCodeController.text);
                            boxStorage.write(KEY_USER_AREA, areaNameController.text);
                            Navigator.pushNamed(context, '/stepTwo');
                          }
                        }
                      },
                      child: Row(
                        children: [
                          Expanded(child: Container()),
                          textUbuntu("Go To Step 2 ", kPrimaryPurple, fontWeight: weightBold, fontSize: 18.0),
                          Icon(
                            Icons.arrow_forward,
                            color: kPrimaryPurple,
                          )
                        ],
                      ),
                    ),
                    size20
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

//

AppBar buildBusinessInfoBar(String title, {List<Widget> actions}) {
  return AppBar(
    backgroundColor: kPrimaryPurple,
    title: textUbuntu(title, kWhiteColor, fontWeight: weight500),
    actions: actions,
    iconTheme: IconThemeData(color: kWhiteColor),
  );
}
