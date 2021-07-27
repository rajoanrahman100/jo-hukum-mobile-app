import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/controller/listWidgetController.dart';
import 'package:johukum/screens/addBusiness/stepOneScreen.dart';
import 'package:johukum/widgets/addBusinessForm.dart';
import 'package:johukum/widgets/customToast.dart';
import 'package:johukum/widgets/textWidgets.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../responsive.dart';

class StepTwoScreen extends StatefulWidget {
  @override
  _StepTwoScreenState createState() => _StepTwoScreenState();
}

class _StepTwoScreenState extends State<StepTwoScreen> {
  final _formKey = GlobalKey<FormState>();

  List<Widget> children = [];

  int count = 1;

  var controller = Get.put(ListWidgetController());

  var numberController = TextEditingController();

  List<Map<String, dynamic>> send = [];

  Map<String, String> map1;

  ///Text editing controller
  var title = TextEditingController();

  var fullName = TextEditingController();

  var designation = TextEditingController();

  var phoneNumber = TextEditingController();

  var email = TextEditingController();

  var fax = TextEditingController();

  var facebook = TextEditingController();

  var website = TextEditingController();

  var instagram = TextEditingController();

  var twitter = TextEditingController();

  var number = TextEditingController();

  var mobileOne = TextEditingController();

  var mobileTwo = TextEditingController();

  var mobileThree = TextEditingController();

  var nameTitleList = ["Mr.", "Mrs.", "Miss.", "Dr."];

  Map<String, String> map;

  var json;

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
                    Row(
                      children: [
                        textUbuntu("Working Days", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                        textUbuntu(" (6 days autoselected, tap to change)", kBlackColor.withOpacity(0.6),
                            fontSize: 15.0, fontWeight: weight400),
                      ],
                    ),
                    size10,
                    Container(
                      height: 40.0,
                      child: Obx(() => ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.weekDaysList.length,
                            itemBuilder: (_, index) {
                              return GestureDetector(
                                  onTap: () {
                                    controller.changeStatus(index);
                                  },
                                  child: Obx(() => controller.weekDaysList[index].selected.value
                                      ? Container(
                                          width: 40.0,
                                          margin: EdgeInsets.symmetric(horizontal: 3.0),
                                          decoration: containerBoxDecoration(borderRadius: 5.0, color: kPrimaryPurple),
                                          height: 30.0,
                                          child: Center(
                                            child: textUbuntu("${controller.weekDaysList[index].title}", Colors.white,
                                                fontSize: 12.0, fontWeight: weight500),
                                          ))
                                      : Container(
                                          width: 40.0,
                                          margin: EdgeInsets.symmetric(horizontal: 3.0),
                                          decoration: containerBoxDecoration(
                                              borderRadius: 5.0, color: kBlackColor.withOpacity(0.3)),
                                          height: 30.0,
                                          child: Center(
                                            child: textUbuntu("${controller.weekDaysList[index].title}", kBlackColor,
                                                fontSize: 12.0, fontWeight: weight500),
                                          ))));
                            },
                          )),
                    ),
                    size10,
                    textUbuntu("Title*", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                    size5,
                    Container(
                      height: 50.0,
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                          color: kPrimaryPurple.withOpacity(0.2), borderRadius: BorderRadius.circular(10.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                            () => textUbuntu(controller.nameTitle.value, kBlackColor.withOpacity(0.6), fontSize: 14),
                          ),
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
                            child: Icon(
                              Icons.arrow_drop_down_circle,
                              color: kPrimaryPurple,
                            ),
                          )
                        ],
                      ),
                    ),
                    size10,
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
                    size10,
                    textUbuntu("Designation*", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                    AddBusinessForm(
                      controller: designation,
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
                    textUbuntu("Telephone Number", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                    AddBusinessForm(
                      controller: numberController,
                      textInputType: TextInputType.number,
                      hintText: "",
                      onChange: (val) {},
                      isSuffix: false,
                    ),
                    size10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textUbuntu("Mobile Number*", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                      ],
                    ),
                    size5,
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: AddBusinessForm(
                            controller: number,
                            hintText: "add mobile numbers",
                            textInputType: TextInputType.phone,
                            isSuffix: false,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (number.text.isEmpty) {
                              showToast("insert your number");
                              return;
                            } else if (number.text.length != 11) {
                              showToast("Mobile Number Format is not valid");
                            } else {
                              map = {"mobile_number": number.text};
                              controller.addNumbers(map);
                              //controller.mobileNumbers.add(MobileNumberModel(value:number.text));
                              //json = jsonEncode(controller.mobileNumbers);
                              number.clear();
                            }
                          },
                          child: Container(
                            height: 45,
                            width: 70,
                            decoration: BoxDecoration(color: kPrimaryPurple, borderRadius: BorderRadius.circular(10.0)),
                            child: Center(
                              child: Text(
                                "ADD",
                                style: textStyleUbuntu(color: kWhiteColor, fontWeight: weight500),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    size10,
                    Obx(() => controller.mobileNumbers.length == 0
                        ? Center(
                            child: textUbuntu("No mobile numbers added yet", kPrimaryPurple, fontWeight: weight500))
                        : SizedBox(
                            //width: size.width,
                            child: Container(
                              width: size.width,
                              margin: EdgeInsets.all(10.0),
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: controller.mobileNumbers.length,
                                itemBuilder: (_, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Row(
                                      children: [
                                        textUbuntu(
                                            "Mobile Number ${index + 1}:   ${controller.mobileNumbers[index]['mobile_number']}",
                                            kBlackColor.withOpacity(0.5),
                                            fontWeight: weight500),
                                        width5,
                                        GestureDetector(
                                            onTap: () {
                                              controller.mobileNumbers.removeAt(index);
                                            },
                                            child: Icon(
                                              Icons.cancel,
                                              color: kPrimaryPurple,
                                              size: 20.0,
                                            ))
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          )),
                    size10,
                    textUbuntu("Email", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                    AddBusinessForm(
                      controller: email,
                      textInputType: TextInputType.emailAddress,
                      hintText: "",
                      isSuffix: false,
                    ),
                    size10,
                    textUbuntu("Website", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                    AddBusinessForm(
                      controller: website,
                      textInputType: TextInputType.emailAddress,
                      hintText: "",
                      isSuffix: false,
                    ),
                    size10,
                    GestureDetector(
                      onTap: () {
                        print(controller.mobileNumbers.runtimeType);
                        Navigator.pushNamed(context, '/stepThree');
                        // print(send);
                        /*if (_formKey.currentState.validate()) {
                          boxStorage.write(KEY_BUSINESS_OWNER_NAME, fullName.text);
                          boxStorage.write(KEY_BUSINESS_OWNER_TITLE, controller.nameTitle.value);
                          boxStorage.write(KEY_BUSINESS_DESIGNATION, designation.text);
                          boxStorage.write(KEY_BUSINESS_PHONE_NUMBER, numberController.text ?? "No Number Found");
                          boxStorage.write(KEY_BUSINESS_FACEBOOK, facebook.text ?? "No Facebook ID Found");
                          boxStorage.write(KEY_BUSINESS_FAX, fax.text ?? "No FAX Found");
                          boxStorage.write(KEY_BUSINESS_WEBSITE, website.text ?? "No Website Found");
                          boxStorage.write(KEY_BUSINESS_TWITTER, twitter.text ?? "No Twitter Found");
                          boxStorage.write(KEY_BUSINESS_EMAIL, email.text ?? "No Email ID Found");
                          boxStorage.write(MOBILE_NUMBERS, controller.mobileNumbers);

                          //boxStorage.write(MOBILE_ONE, mobileOne.text);
                          //boxStorage.write(MOBILE_TWO, mobileTwo.text);
                          //boxStorage.write(MOBILE_THREE, mobileThree.text);

                          Navigator.pushNamed(context, '/stepThree');
                        }*/
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
          tablet: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    size10,
                    textUbuntu("Title*", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                    size5,
                    Container(
                      height: 50.0,
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                          color: kPrimaryPurple.withOpacity(0.2), borderRadius: BorderRadius.circular(10.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                            () => textUbuntu(controller.nameTitle.value, kBlackColor.withOpacity(0.6), fontSize: 14),
                          ),
                          GestureDetector(
                            onTap: () {
                              showBarModalBottomSheet(
                                  backgroundColor: kWhiteColor,
                                  context: context,
                                  expand: false,
                                  builder: (context) => Container(
                                        height: size.height * 0.25,
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
                            child: Icon(
                              Icons.arrow_drop_down_circle,
                              color: kPrimaryPurple,
                            ),
                          )
                        ],
                      ),
                    ),
                    /*AddBusinessForm(
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
                    ),*/
                    size10,
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
                    size10,
                    textUbuntu("Designation*", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                    AddBusinessForm(
                      controller: designation,
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
                    textUbuntu("Telephone Number", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                    AddBusinessForm(
                      controller: numberController,
                      textInputType: TextInputType.number,
                      hintText: "",
                      onChange: (val) {},
                      isSuffix: false,
                    ),
                    size10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textUbuntu("Mobile Number*", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                      ],
                    ),
                    size5,
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: AddBusinessForm(
                            controller: number,
                            hintText: "add mobile numbers",
                            textInputType: TextInputType.phone,
                            isSuffix: false,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (number.text.isEmpty) {
                              showToast("insert your number");
                              return;
                            } else if (number.text.length != 11) {
                              showToast("Mobile Number Format is not valid");
                            } else {
                              map = {"mobile_number": number.text};
                              controller.addNumbers(map);
                              //controller.mobileNumbers.add(MobileNumberModel(value:number.text));
                              //json = jsonEncode(controller.mobileNumbers);
                              number.clear();
                            }
                          },
                          child: Container(
                            height: 45,
                            width: 70,
                            decoration: BoxDecoration(color: kPrimaryPurple, borderRadius: BorderRadius.circular(10.0)),
                            child: Center(
                              child: Text(
                                "ADD",
                                style: textStyleUbuntu(color: kWhiteColor, fontWeight: weight500),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    size10,
                    Obx(() => controller.mobileNumbers.length == 0
                        ? Center(
                            child: textUbuntu("No mobile numbers added yet", kPrimaryPurple,
                                fontWeight: weight500, fontSize: 18.0))
                        : SizedBox(
                            //width: size.width,
                            child: Container(
                              width: size.width,
                              margin: EdgeInsets.all(10.0),
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: controller.mobileNumbers.length,
                                itemBuilder: (_, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Row(
                                      children: [
                                        textUbuntu(
                                            "Mobile Number ${index + 1}:   ${controller.mobileNumbers[index]['mobile_number']}",
                                            kBlackColor.withOpacity(0.5),
                                            fontWeight: weight500,
                                            fontSize: 18.0),
                                        width5,
                                        GestureDetector(
                                            onTap: () {
                                              controller.mobileNumbers.removeAt(index);
                                            },
                                            child: Icon(
                                              Icons.cancel,
                                              color: kPrimaryPurple,
                                              size: 20.0,
                                            ))
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          )),
                    size10,
                    textUbuntu("Email", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                    AddBusinessForm(
                      controller: email,
                      textInputType: TextInputType.emailAddress,
                      hintText: "",
                      isSuffix: false,
                    ),
                    size10,
                    textUbuntu("Website", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                    AddBusinessForm(
                      controller: website,
                      textInputType: TextInputType.emailAddress,
                      hintText: "",
                      isSuffix: false,
                    ),
                    size10,
                    GestureDetector(
                      onTap: () {
                        // print(send);
                        Navigator.pushNamed(context, '/stepThree');
                        /*if (_formKey.currentState.validate()) {
                          boxStorage.write(KEY_BUSINESS_OWNER_NAME, fullName.text);
                          boxStorage.write(KEY_BUSINESS_OWNER_TITLE, controller.nameTitle.value);
                          boxStorage.write(KEY_BUSINESS_DESIGNATION, designation.text);
                          boxStorage.write(KEY_BUSINESS_PHONE_NUMBER, numberController.text ?? "No Number Found");
                          boxStorage.write(KEY_BUSINESS_FACEBOOK, facebook.text ?? "No Facebook ID Found");
                          boxStorage.write(KEY_BUSINESS_FAX, fax.text ?? "No FAX Found");
                          boxStorage.write(KEY_BUSINESS_WEBSITE, website.text ?? "No Website Found");
                          boxStorage.write(KEY_BUSINESS_TWITTER, twitter.text ?? "No Twitter Found");
                          boxStorage.write(KEY_BUSINESS_EMAIL, email.text ?? "No Email ID Found");
                          boxStorage.write(MOBILE_NUMBERS, controller.mobileNumbers);

                          Navigator.pushNamed(context, '/stepThree');
                        }*/
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

  Future<void> _displayTextInputDialog(BuildContext context, textcontroller) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('TextField in Dialog'),
            content: Container(
              height: 300.0,
              child: Column(
                children: [
                  TextField(
                    onChanged: (value) {},
                    controller: textcontroller,
                    decoration: InputDecoration(hintText: "Text Field in Dialog"),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        controller.mobileNumbers.add(textcontroller.text);
                      },
                      child: textUbuntu("ADD", kPrimaryPurple))
                ],
              ),
            ),
          );
        });
  }
}

/*WelcomeScreenButton(
height: 40.0,
edgeInsetsGeometry: EdgeInsets.only(right: 140.0),
buttonText: "Add Phone Number",
textColor: kWhiteColor,
borderRadiusGeometry: BorderRadius.circular(10.0),
isIcon: false,
buttonColor: kPrimaryPurple,
callback: () {
// map1.addAll()
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
),*/
