import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/controller/dashBoardController/singleBusinessAllDataController.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/screens/addBusiness/stepOneScreen.dart';
import 'package:johukum/screens/dashboard/businessDashSetting/paymentMethodDetails/paymentMethodController.dart';
import 'package:johukum/screens/welcomeScreen/welcomeButtonWidget.dart';
import 'package:johukum/widgets/textWidgets.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class PaymentMethodDetails extends StatefulWidget {
  @override
  _PaymentMethodDetailsState createState() => _PaymentMethodDetailsState();
}

class _PaymentMethodDetailsState extends State<PaymentMethodDetails> {
  var payC = Get.put(PaymentMethodController());
  var c = Get.put(SingleBusinessAllDataController());

  @override
  void initState() {
    print("payments value ${c.paymentMethodNamesList}");
    payC.paymentMethodNames.value = c.paymentMethodNamesList;
    payC.paymentMethodID.value = c.paymentMethodList;

    //print(boxNewStorage.read(BUSINESS_PROFESSIONAL_PAYMENT_METHOD_NAME));
    //payC.paymentMethodNames.value = boxNewStorage.read(BUSINESS_PROFESSIONAL_PAYMENT_METHOD_NAME);
    //payC.paymentMethodID.value = boxNewStorage.read(BUSINESS_PROFESSIONAL_PAYMENT_METHOD);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: buildBusinessInfoBar("Payment Methods"),
      body: Responsive(
        mobile: Container(
          height: size.height,
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: crossAxisAlignmentStart,
              children: [
                textUbuntu("Accepted payment methods:", kBlackColor),
                size10,
                Obx(() => Container(
                      height: size.height / 4,
                      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                      decoration: containerBoxDecoration(color: kPrimaryPurple.withOpacity(0.2), borderRadius: 5.0),
                      child: GridView.builder(
                        itemCount: payC.paymentMethodNames.length,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 140, childAspectRatio: 10 / 3, crossAxisSpacing: 8, mainAxisSpacing: 8),
                        itemBuilder: (_, index) {
                          return GestureDetector(
                            onTap: () {
                              payC.paymentMethodNames.removeAt(index);
                              payC.onRemove(payC.paymentModelClass.value.results[index].name, false,
                                  payC.paymentModelClass.value.results[index].sId);
                              //c.addedMobileNumber.removeAt(index);
                            },
                            child: Container(
                              //height: 15.0,
                              decoration: containerBoxDecoration(color: Colors.white, borderRadius: 5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  textUbuntu(payC.paymentMethodNames[index], kPrimaryPurple, fontWeight: weight500),
                                  width10,
                                  Icon(
                                    Icons.delete_forever,
                                    size: 18,
                                    color: kPrimaryPurple,
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )),
                /*Obx(() => Container(
                  height: size.height / 4,
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  decoration: containerBoxDecoration(color: kPrimaryPurple.withOpacity(0.2), borderRadius: 5.0),
                  child: GridView.builder(
                    itemCount: c.paymentMethodNamesList.length,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 140, childAspectRatio: 10 / 3, crossAxisSpacing: 8, mainAxisSpacing: 8),
                    itemBuilder: (_, index) {


                      return GestureDetector(
                        onTap: () {
                          */ /*payC.paymentMethodNames.removeAt(index);
                          payC.onRemove(
                              payC.paymentModelClass.value.results[index].name,
                              false,payC.paymentModelClass.value.results[index].sId
                          );*/ /*
                          //c.addedMobileNumber.removeAt(index);
                        },
                        child: Container(
                          //height: 15.0,
                          decoration: containerBoxDecoration(color: Colors.white, borderRadius: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              textUbuntu(c.paymentMethodNamesList[index], kPrimaryPurple, fontWeight: weight500),
                              width10,
                              Icon(
                                Icons.delete_forever,
                                size: 18,
                                color: kPrimaryPurple,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )),*/
                size10,
                WelcomeScreenButton(
                    height: 40,
                    //edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 120, vertical: 15.0),
                    borderRadiusGeometry: BorderRadius.circular(10.0),
                    textColor: kWhiteColor,
                    buttonText: "Add Payament Methods",
                    buttonColor: kSecondaryPurple,
                    isIcon: false,
                    callback: () {
                      showBarModalBottomSheet(
                          backgroundColor: kWhiteColor,
                          context: context,
                          expand: false,
                          builder: (context) => Obx(() => Container(
                                height: size.height,
                                child: payC.paymentModelClass.value == null
                                    ? textUbuntu("loading...", kPrimaryPurple)
                                    : payC.paymentModelClass.value.results.length == 0
                                        ? textUbuntu("No data found", kPrimaryPurple)
                                        : Column(
                                            children: [
                                              size10,
                                              textUbuntu("Select payaments methods", kPrimaryPurple,
                                                  fontWeight: weight500, fontSize: 16),
                                              Expanded(
                                                child: ListView.builder(
                                                  itemCount: payC.paymentModelClass.value.results.length,
                                                  itemBuilder: (_, index) {
                                                    return Obx(() => CheckboxListTile(
                                                          activeColor: kPrimaryPurple,
                                                          value: payC.paymentMethodNames.contains(
                                                              payC.paymentModelClass.value.results[index].name),
                                                          onChanged: (bool selected) {
                                                            if (selected == true) {
                                                              payC.onSelect(
                                                                  payC.paymentModelClass.value.results[index].name,
                                                                  selected,
                                                                  payC.paymentModelClass.value.results[index].sId);
                                                            } else {
                                                              payC.onRemove(
                                                                  payC.paymentModelClass.value.results[index].name,
                                                                  selected,
                                                                  payC.paymentModelClass.value.results[index].sId);
                                                            }
                                                          },
                                                          title: Container(
                                                            height: 20.0,
                                                            margin: EdgeInsets.only(
                                                                top: 10.0, left: 10, right: 10, bottom: 5.0),
                                                            child: Row(
                                                              children: <Widget>[
                                                                textUbuntu(
                                                                    payC.paymentModelClass.value.results[index].name,
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
                                                  edgeInsetsGeometry:
                                                      EdgeInsets.symmetric(horizontal: 120, vertical: 15.0),
                                                  borderRadiusGeometry: BorderRadius.circular(10.0),
                                                  textColor: kWhiteColor,
                                                  buttonText: "Submit",
                                                  buttonColor: kPrimaryPurple,
                                                  isIcon: false,
                                                  callback: () {
                                                    Navigator.of(context).pop();
                                                  })
                                            ],
                                          ),
                              )));
                    }),
                SizedBox(
                  height: 60.0,
                ),
                WelcomeScreenButton(
                    height: 50,
                    borderRadiusGeometry: BorderRadius.circular(10.0),
                    textColor: kWhiteColor,
                    buttonText: "Save Method Payments",
                    buttonColor: kPrimaryPurple,
                    isIcon: false,
                    callback: () {
                      //Navigator.of(context).pop();
                      print(payC.paymentMethodID);
                      print(payC.paymentMethodNames);
                      payC
                          .updateBusinessData(context, boxStorage.read(MY_BUSINESS_ID), payC.paymentMethodID)
                          .then((value) {
                            //payC.paymentMethodID.clear();
                            //payC.paymentMethodNames.clear();
                      });
                    }),
              ],
            ),
          ),
        ),
        tablet: Container(
          height: size.height,
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: crossAxisAlignmentStart,
              children: [
                textUbuntu("Accepted payment methods:", kBlackColor, fontSize: 18.0),
                size10,
                Obx(() => Container(
                      height: size.height / 4,
                      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                      decoration: containerBoxDecoration(color: kPrimaryPurple.withOpacity(0.2), borderRadius: 5.0),
                      child: GridView.builder(
                        itemCount: payC.paymentMethodNames.length,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 140, childAspectRatio: 10 / 3, crossAxisSpacing: 8, mainAxisSpacing: 8),
                        itemBuilder: (_, index) {
                          return GestureDetector(
                            onTap: () {
                              payC.paymentMethodNames.removeAt(index);
                              //c.addedMobileNumber.removeAt(index);
                            },
                            child: Container(
                              //height: 15.0,
                              decoration: containerBoxDecoration(color: Colors.white, borderRadius: 5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  textUbuntu(payC.paymentMethodNames[index], kPrimaryPurple, fontWeight: weight500),
                                  width10,
                                  Icon(
                                    Icons.delete_forever,
                                    size: 18,
                                    color: kPrimaryPurple,
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )),
                size10,
                WelcomeScreenButton(
                    height: 40,
                    //edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 120, vertical: 15.0),
                    borderRadiusGeometry: BorderRadius.circular(10.0),
                    textColor: kWhiteColor,
                    buttonText: "Add Payament Methods",
                    buttonColor: kSecondaryPurple,
                    isIcon: false,
                    callback: () {
                      showBarModalBottomSheet(
                          backgroundColor: kWhiteColor,
                          context: context,
                          expand: false,
                          builder: (context) => Obx(() => Container(
                                height: size.height,
                                child: payC.paymentModelClass.value == null
                                    ? textUbuntu("loading...", kPrimaryPurple)
                                    : payC.paymentModelClass.value.results.length == 0
                                        ? textUbuntu("No data found", kPrimaryPurple)
                                        : Column(
                                            children: [
                                              size10,
                                              textUbuntu("Select payaments methods", kPrimaryPurple,
                                                  fontWeight: weight500, fontSize: 16),
                                              Expanded(
                                                child: ListView.builder(
                                                  itemCount: payC.paymentModelClass.value.results.length,
                                                  itemBuilder: (_, index) {
                                                    return Obx(() => CheckboxListTile(
                                                          activeColor: kPrimaryPurple,
                                                          value: payC.paymentMethodNames.contains(
                                                              payC.paymentModelClass.value.results[index].name),
                                                          onChanged: (bool selected) {
                                                            if (selected == true) {
                                                              payC.onSelect(
                                                                  payC.paymentModelClass.value.results[index].name,
                                                                  selected,
                                                                  payC.paymentModelClass.value.results[index].sId);
                                                            } else {
                                                              payC.onRemove(
                                                                  payC.paymentModelClass.value.results[index].name,
                                                                  selected,
                                                                  payC.paymentModelClass.value.results[index].sId);
                                                            }
                                                          },
                                                          title: Container(
                                                            height: 20.0,
                                                            margin: EdgeInsets.only(
                                                                top: 10.0, left: 10, right: 10, bottom: 5.0),
                                                            child: Row(
                                                              children: <Widget>[
                                                                textUbuntu(
                                                                    payC.paymentModelClass.value.results[index].name,
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
                                                  edgeInsetsGeometry:
                                                      EdgeInsets.symmetric(horizontal: 120, vertical: 15.0),
                                                  borderRadiusGeometry: BorderRadius.circular(10.0),
                                                  textColor: kWhiteColor,
                                                  buttonText: "Submit",
                                                  buttonColor: kPrimaryPurple,
                                                  isIcon: false,
                                                  callback: () {
                                                    Navigator.of(context).pop();
                                                  })
                                            ],
                                          ),
                              )));
                    }),
                SizedBox(
                  height: 60.0,
                ),
                WelcomeScreenButton(
                    height: 50,
                    borderRadiusGeometry: BorderRadius.circular(10.0),
                    textColor: kWhiteColor,
                    buttonText: "Save Method Payments",
                    buttonColor: kPrimaryPurple,
                    isIcon: false,
                    callback: () {
                      //Navigator.of(context).pop();
                      print(payC.paymentMethodID);
                      print(payC.paymentMethodNames);
                      payC
                          .updateBusinessData(context, boxStorage.read(MY_BUSINESS_ID), payC.paymentMethodID)
                          .then((value) => c.paymentMethodNamesList.clear());
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
