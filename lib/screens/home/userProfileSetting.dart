import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/components/settingsDataSaveConfig.dart';
import 'package:johukum/controller/userProfileController.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/screens/addBusiness/stepOneScreen.dart';
import 'package:johukum/screens/welcomeScreen/welcomeButtonWidget.dart';
import 'package:johukum/widgets/addBusinessForm.dart';
import 'package:johukum/widgets/customToast.dart';
import 'package:johukum/widgets/textWidgets.dart';

class UserProfileSetting extends StatefulWidget {
  @override
  _UserProfileSettingState createState() => _UserProfileSettingState();
}

class _UserProfileSettingState extends State<UserProfileSetting> {
  final _formKey = GlobalKey<FormState>();

  var userName = TextEditingController();
  var userEmail = TextEditingController();
  var userPhone = TextEditingController();
  var userOldPass = TextEditingController();
  var userNewPass = TextEditingController();

  var c = Get.put(UserProfileController());

  @override
  void initState() {
    // TODO: implement initState
    userName.text = boxStorage.read(KEY_USER_NAME);
    userEmail.text = boxStorage.read(KEY_USER_EMAIL);
    //userPhone.text = boxStorage.read(KEY_USER_PHONE);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildBusinessInfoBar("Profile Setting"),
      body: Responsive(
        mobile: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: crossAxisAlignmentStart,
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  textUbuntu("User Name", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                  AddBusinessForm(
                    controller: userName,
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
                    onSave: (String value) {
                      userName.text = value;
                    },
                  ),
                  size10,
                  textUbuntu("User Email", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                  AddBusinessForm(
                    controller: userEmail,
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
                    onSave: (String value) {
                      userEmail.text = value;
                    },
                  ),

                  //Obx(() => c.tapToSee.value ? Text("OKKO") : Text("")),

                  size10,
                  Obx(()=>c.tapToSee.value?Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textUbuntu("Current Password", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                        AddBusinessForm(
                          controller: userOldPass,
                          //initialValue: businssName.text,
                          isSuffix: false,
                          hintText: "",
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Insert Your Old Password";
                            }
                            _formKey.currentState.save();
                            return null;
                          },
                          onSave: (String value) {
                            userOldPass.text = value;
                          },
                        ),
                        size10,
                        textUbuntu("New Password", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                        AddBusinessForm(
                          controller: userNewPass,
                          //initialValue: businssName.text,
                          isSuffix: false,
                          hintText: "",
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Insert Your New Password";
                            }else if(value.length<8){
                              return "Password length should be 8 or higher";
                            }
                            _formKey.currentState.save();
                            return null;
                          },
                          onSave: (String value) {
                            userNewPass.text = value;
                          },
                        ),
                      ],
                    ),
                  ):Container(),),


                  WelcomeScreenButton(
                    height: 40,
                    isIcon: false,
                    buttonColor: kPrimaryPurple,
                    buttonText: "Save",
                    textColor: kWhiteColor,
                    callback: () async {
                      if (_formKey.currentState.validate()) {
                        FocusScope.of(context).unfocus();
                       userOldPass.text.isEmpty?c.setProfileUpdate(context, boxNewStorage.read(KEY_USER_ID), userName.text, userEmail.text):c.getResetPass(userOldPass.text, userNewPass.text, context);
                      }
                    },
                    borderRadiusGeometry: BorderRadius.circular(15),
                    edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  ),
                  Obx(()=>c.tapToSee.value==false?Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          c.changeStatus();
                        },
                        child: Text(
                          "Change Password",
                          style: textStyleUbuntu(color: kPrimaryPurple, fontSize: 18.0, fontWeight: weight500, textDecoration: TextDecoration.underline),
                        ),
                      )):Text(""),),

                  Obx(()=>c.tapToSee.value==true?GestureDetector(onTap: (){
                    c.changeStatus();
                  },child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Cancel",
                      style: textStyleUbuntu(color: kPrimaryPurple, fontSize: 18.0, fontWeight: weight500, textDecoration: TextDecoration.underline),
                    ),
                  ),):Text(""))
                ],
              ),
            ),
          ),
        ),
        tablet: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              child: Column(
                crossAxisAlignment: crossAxisAlignmentStart,
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  textUbuntu("User Name", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                  AddBusinessForm(
                    controller: userName,
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
                    onSave: (String value) {
                      userName.text = value;
                    },
                  ),
                  size10,
                  textUbuntu("User Email", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                  AddBusinessForm(
                    controller: userEmail,
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
                    onSave: (String value) {
                      userEmail.text = value;
                    },
                  ),
                  //Obx(() => c.tapToSee.value ? Text("OKKO") : Text("")),

                  size10,
                  Obx(()=>c.tapToSee.value?Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textUbuntu("Current Password", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                        AddBusinessForm(
                          controller: userOldPass,
                          //initialValue: businssName.text,
                          isSuffix: false,
                          hintText: "",
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Insert Your Old Password";
                            }
                            _formKey.currentState.save();
                            return null;
                          },
                          onSave: (String value) {
                            userOldPass.text = value;
                          },
                        ),
                        size10,
                        textUbuntu("New Password", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                        AddBusinessForm(
                          controller: userNewPass,
                          //initialValue: businssName.text,
                          isSuffix: false,
                          hintText: "",
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Insert Your New Password";
                            }
                            else if(value.length<8){
                              return "Password length should be 8 or higher";
                            }
                            _formKey.currentState.save();
                            return null;
                          },
                          onSave: (String value) {
                            userNewPass.text = value;
                          },
                        ),
                      ],
                    ),
                  ):Container(),),


                  WelcomeScreenButton(
                    height: 50,
                    isIcon: false,
                    buttonColor: kPrimaryPurple,
                    buttonText: "Save",
                    textColor: kWhiteColor,
                    callback: () async {
                      if (_formKey.currentState.validate()) {
                        FocusScope.of(context).unfocus();
                        userOldPass.text.isEmpty?c.setProfileUpdate(context, boxNewStorage.read(KEY_USER_ID), userName.text, userEmail.text):c.getResetPass(userOldPass.text, userNewPass.text, context);

                      }
                    },
                    borderRadiusGeometry: BorderRadius.circular(15),
                    edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  ),
                  Obx(()=>c.tapToSee.value==false?Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          c.changeStatus();
                        },
                        child: Text(
                          "Change Password",
                          style: textStyleUbuntu(color: kPrimaryPurple, fontSize: 18.0, fontWeight: weight500, textDecoration: TextDecoration.underline),
                        ),
                      )):Text(""),),

                  Obx(()=>c.tapToSee.value==true?GestureDetector(onTap: (){
                    c.changeStatus();
                  },child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Cancel",
                      style: textStyleUbuntu(color: kPrimaryPurple, fontSize: 18.0, fontWeight: weight500, textDecoration: TextDecoration.underline),
                    ),
                  ),):Text(""))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
