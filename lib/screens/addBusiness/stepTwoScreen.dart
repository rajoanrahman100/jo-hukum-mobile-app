import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/components/settingsDataSaveConfig.dart';
import 'package:johukum/controller/businessDataController.dart';
import 'package:johukum/controller/businessTypeController.dart';
import 'package:johukum/controller/listWidgetController.dart';
import 'package:johukum/controller/paymentController.dart';
import 'package:johukum/screens/addBusiness/stepOneScreen.dart';
import 'package:johukum/screens/fullScreenAlertDialog/fullScreenBusinessType.dart';
import 'package:johukum/screens/welcomeScreen/welcomeButtonWidget.dart';
import 'package:johukum/widgets/addBusinessForm.dart';
import 'package:johukum/widgets/customToast.dart';
import 'package:johukum/widgets/textWidgets.dart';
import 'package:johukum/widgets/timseSetWidget.dart';
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
  var paymentController = Get.put(PaymentController());
  var dataController=Get.put(BusinessDataController());
  var businessTyeController=Get.put(BusinessTypeController());


  var paymentIdList = [];

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

  var number = TextEditingController();

  var descController=TextEditingController();

  var nameTitleList = ["Mr.", "Mrs.", "Miss.", "Dr."];
  var employeeList=["1-5","6-20","21-50","51-100","101-50","500+"];


  Map<String, dynamic> map;

  var json;



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: buildBusinessInfoBar("Step 2"),
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
                    Row(
                      children: [
                        Obx(
                          () => TimeSetContainer(
                            title: "open",
                            callback: () {
                              timerWidget(context, onConfirm: (date) {
                                var time = DateFormat.jm().format(date).toString();
                                controller.openTime.value = time;
                              });
                            },
                            time: controller.openTime.value,
                          ),
                        ),
                        width10,
                        Obx(
                          () => TimeSetContainer(
                            title: "close",
                            callback: () {
                              timerWidget(context, onConfirm: (date) {
                                var time = DateFormat.jm().format(date).toString();
                                controller.closeTime.value = time;
                              });
                            },
                            time: controller.closeTime.value,
                          ),
                        )
                      ],
                    ),
                    size10,
                    textUbuntu("Telephone Number", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                    AddBusinessForm(
                      controller: numberController,
                      textInputType: TextInputType.number,
                      hintText: "",
                      onChange: (val) {},
                      validator: (value) {
                        if (value.isEmpty) {
                          return "This Field is required";
                        }
                        _formKey.currentState.save();
                        return null;
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
                    textUbuntu("Email*", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                    AddBusinessForm(
                      controller: email,
                      textInputType: TextInputType.emailAddress,
                      hintText: "",
                      validator: (value) {
                        if (value.isEmpty) {
                          return "This Field is required";
                        }
                        _formKey.currentState.save();
                        return null;
                      },
                      isSuffix: false,
                    ),
                    size10,
                    WelcomeScreenButton(
                      height: 50.0,
                      isIcon: false,
                      buttonText: "Select payment methods",
                      buttonColor: kPrimaryPurple,
                      textColor: Colors.white,
                      callback: () {
                        paymentMethosOptions(context, size);
                      },
                      borderRadiusGeometry: BorderRadius.circular(10.0),
                    ),
                    size10,
                    Obx(() => paymentController.paymentList.length == 0
                        ? Container(
                            child: Center(
                              child: textUbuntu("No payment selected", kPrimaryPurple),
                            ),
                          )
                        : Container(
                            height: 30,
                            width: size.width,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: paymentController.paymentList.length,
                              itemBuilder: (_, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Chip(
                                    //labelPadding: EdgeInsets.symmetric(horizontal: 3.0),
                                    avatar: CircleAvatar(
                                      backgroundColor: kPrimaryPurple,
                                      child: textUbuntu("${paymentController.paymentList[index][0]}", Colors.white),
                                    ),
                                    label: textUbuntu("${paymentController.paymentList[index]}", kBlackColor),
                                    backgroundColor: kBlackColor.withOpacity(0.2),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                                    //shadowColor: Colors.grey[60],
                                    padding: EdgeInsets.all(6.0),
                                  ),
                                );
                                /*return Container(
                                  //height: 17,
                                  margin: EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                    color: kPrimaryPurple,
                                    borderRadius: BorderRadius.circular(5.0),
                                    //border: Border.all(color: Colors.black.withOpacity(0.2))
                                  ),
                                  padding: EdgeInsets.all(7.0),
                                  child: Center(
                                    child: textUbuntu(paymentController.paymentList[index], kWhiteColor,
                                        fontSize: 14.0, fontWeight: FontWeight.w500),
                                  ),
                                );*/
                              },
                            ),
                          )),
                    size10,
                    textUbuntu("Years of Establishment*", kPrimaryPurple, fontWeight: weight500, fontSize: 16),
                    size5,
                    GestureDetector(
                      onTap: (){
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Select Year"),
                              content: Container( // Need to use container to add size constraint.
                                width: 300,
                                height: 300,
                                child: YearPicker(
                                  firstDate: DateTime(DateTime.now().year - 100, 1),
                                  lastDate: DateTime(DateTime.now().year + 100, 1),
                                  initialDate: DateTime.now(),
                                  // save the selected date to _selectedDate DateTime variable.
                                  // It's used to set the previous selected date when
                                  // re-showing the dialog.
                                  selectedDate: DateTime.now(),
                                  onChanged: (DateTime dateTime) {
                                    // close the dialog when year is selected.
                                    var year=DateFormat.y().format(dateTime).toString();
                                    print(year);
                                    dataController.setSelectedYear(year);
                                    Navigator.pop(context);

                                    // Do something with the dateTime selected.
                                    // Remember that you need to use dateTime.year to get the year
                                  },
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        height: 50.0,
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(color: kPrimaryPurple.withOpacity(0.2), borderRadius: BorderRadius.circular(10.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(()=>textUbuntu(dataController.selectYear.value, kBlackColor.withOpacity(0.6), fontSize:
                            14),),
                            Icon(
                              Icons.arrow_drop_down_circle,
                              color: kPrimaryPurple,
                            )
                          ],
                        ),
                      ),
                    ),

                    size10,
                    textUbuntu("Number of Employee", kPrimaryPurple, fontWeight: weight500, fontSize: 16),
                    size5,
                    GestureDetector(
                      onTap: (){
                        showBarModalBottomSheet(
                            backgroundColor: kWhiteColor,
                            context: context,
                            expand: false,
                            builder: (context) => Container(
                              height: size.height * 0.4,
                              child: ListView.builder(
                                itemCount: employeeList.length,
                                itemBuilder:(_,index){
                                  return ListTile(
                                    onTap: (){
                                      dataController.setEmployeeNumber(employeeList[index]);
                                      Navigator.of(context).pop();
                                    },
                                    leading: Icon(Icons.people,color: kPrimaryPurple,),
                                    title: textUbuntu(employeeList[index], kPrimaryPurple),
                                  );
                                },
                              ),
                            ));
                      },
                      child: Container(
                        height: 50.0,
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(color: kPrimaryPurple.withOpacity(0.2), borderRadius: BorderRadius.circular(10.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(()=>textUbuntu(dataController.numberOfEmployee.value, kBlackColor.withOpacity(0.6), fontSize:
                            14),),
                            Icon(
                              Icons.arrow_drop_down_circle,
                              color: kPrimaryPurple,
                            ),
                          ],
                        ),
                      ),
                    ),

                    size10,
                    textUbuntu("Description*", kPrimaryPurple, fontWeight: weight500, fontSize: 16),
                    size5,
                    AddBusinessForm(
                      controller: descController,
                      textInputType: TextInputType.text,
                      hintText: "",
                      validator: (value) {
                        if (value.isEmpty) {
                          return "This Field is required";
                        }
                        _formKey.currentState.save();
                        return null;
                      },
                      //height: 40.0,
                      maxLine: 5,
                      isSuffix: false,
                    ),
                    size10,
                    textUbuntu("Type of Business", kPrimaryPurple, fontWeight: weight500, fontSize: 16),
                    size5,
                    GestureDetector(
                      onTap: (){
                        openBusinessTypeDialog(context);
                      },
                      child: Container(
                        height: 50.0,
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(color: kPrimaryPurple.withOpacity(0.2), borderRadius: BorderRadius.circular(10.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(()=>textUbuntu(businessTyeController.businessTypeName.value, kBlackColor.withOpacity(0.6), fontSize:
                            14),),
                            Icon(
                              Icons.arrow_drop_down_circle,
                              color: kPrimaryPurple,
                            ),

                          ],
                        ),
                      ),
                    ),
                    size20,
                    GestureDetector(
                      onTap: () {
                        //Navigator.pushNamed(context, '/stepSix');

                        if(_formKey.currentState.validate()){


                          if(paymentController.paymentList.length==0){
                            showErrorToast("Payment method must not be empty");
                            return;
                          }

                          map={
                            "open_time":controller.openTime.value,
                            "close_time":controller.closeTime.value,
                            "telephone number":numberController.text,
                            "mobile numbers":controller.mobileNumbers,
                            "business email":email.text,
                            "payment Id":paymentIdList,
                            "establish year":dataController.selectYear.value,
                            "employee number":dataController.numberOfEmployee.value,
                            "description":descController.text,
                            "business type":businessTyeController.businessTypeId.value,
                          };

                          log(map.toString());

                          boxStorage.write(BUSINESS_OPEN_TIME,controller.openTime.value );
                          boxStorage.write(BUSINESS_CLOSE_TIME, controller.closeTime.value);
                          boxStorage.write(MOBILE_NUMBERS, controller.mobileNumbers);
                          boxStorage.write(KEY_BUSINESS_PHONE_NUMBER, numberController.text);
                          boxStorage.write(KEY_BUSINESS_EMAIL, email.text);
                          boxStorage.write(PAYMENT_ID_LIST, paymentIdList);
                          boxStorage.write(YEAR_ESTABLISH, dataController.selectYear.value);
                          boxStorage.write(NUMBER_OF_EMPLOYEE, dataController.numberOfEmployee.value);
                          boxStorage.write(DESCRIPTION, descController.text);
                          boxStorage.write(TYPE_OF_BUSINESS, businessTyeController.businessTypeId.value);

                          Navigator.pushNamed(context, '/stepSix');
                        }

                        //Navigator.pushNamed(context, '/stepSix');
                        /*if (_formKey.currentState.validate()) {

                          boxStorage.write(KEY_BUSINESS_PHONE_NUMBER, numberController.text ?? "No Number Found");
                          boxStorage.write(KEY_BUSINESS_EMAIL, email.text ?? "No Email ID Found");
                          boxStorage.write(MOBILE_NUMBERS, controller.mobileNumbers);
                          Navigator.pushNamed(context, '/stepThree');
                        }*/
                        //Navigator.pushNamed(context, '/stepThree');
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
                                textUbuntu("Go To Step 3 ", Colors.white, fontWeight: weightBold, fontSize: 16.0),
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

  Future<dynamic> paymentMethosOptions(BuildContext context, Size size) {
    return showBarModalBottomSheet(
        backgroundColor: kWhiteColor,
        context: context,
        expand: false,
        builder: (context) => Obx(() => Container(
              height: size.height * 0.75,
              child: paymentController.paymentModelClass.value == null
                  ? textUbuntu("loading...", kPrimaryPurple)
                  : paymentController.paymentModelClass.value.results.length == 0
                      ? textUbuntu("No data found", kPrimaryPurple)
                      : Column(
                          children: [
                            size10,
                            textUbuntu("Select payaments methods", kPrimaryPurple, fontWeight: weight500, fontSize: 16),
                            Expanded(
                              child: ListView.builder(
                                itemCount: paymentController.paymentModelClass.value.results.length,
                                itemBuilder: (_, index) {
                                  return Obx(() => CheckboxListTile(
                                        activeColor: kPrimaryPurple,
                                        value: paymentController.paymentList
                                            .contains(paymentController.paymentModelClass.value.results[index].name),
                                        onChanged: (bool selected) {
                                          if (selected == true) {
                                            paymentIdList.add(paymentController.paymentModelClass.value.results[index].sId);
                                            paymentController.onSelect(
                                                paymentController.paymentModelClass.value.results[index].name,
                                                selected);
                                          } else {
                                            paymentIdList
                                                .remove(paymentController.paymentModelClass.value.results[index].sId);
                                            paymentController.onRemove(
                                                paymentController.paymentModelClass.value.results[index].name,
                                                selected);
                                          }
                                        },
                                        title: Container(
                                          height: 20.0,
                                          margin: EdgeInsets.only(top: 10.0, left: 10, right: 10, bottom: 5.0),
                                          child: Row(
                                            children: <Widget>[
                                              textUbuntu(paymentController.paymentModelClass.value.results[index].name,
                                                  kPrimaryPurple,
                                                  fontWeight: weight400)
                                            ],
                                          ),
                                        ),
                                      ));
                                },
                              ),
                            ),
                            WelcomeScreenButton(
                                height: 40,
                                edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 120, vertical: 15.0),
                                borderRadiusGeometry: BorderRadius.circular(10.0),
                                textColor: kWhiteColor,
                                buttonText: "Submit",
                                buttonColor: kPrimaryPurple,
                                isIcon: false,
                                callback: () {
                                  Navigator.of(context).pop();
                                  print(paymentIdList);
                                })
                          ],
                        ),
            )));
  }
}

class TimeSetContainer extends StatelessWidget {
  String title;
  VoidCallback callback;
  String time;

  TimeSetContainer({this.title, this.callback, this.time});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: callback,
        child: Container(
          height: 50.0,
          decoration: containerBoxDecoration(color: kPrimaryPurple, borderRadius: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textUbuntu("$title", Colors.white),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textUbuntu("$time", Colors.white, fontSize: 22.0, fontWeight: FontWeight.bold),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                    size: 25.0,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
