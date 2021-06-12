import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/controller/businessTimeSetController.dart';
import 'package:johukum/controller/paymentController.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/screens/addBusiness/stepOneScreen.dart';
import 'package:johukum/screens/welcomeScreen/welcomeButtonWidget.dart';
import 'package:johukum/widgets/customToast.dart';
import 'package:johukum/widgets/textWidgets.dart';
import 'package:johukum/widgets/timseSetWidget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class StepTheeScreenTwo extends StatelessWidget {
  var businessTimeController = Get.put(BusinessTimeController());
  var paymentController = Get.put(PaymentController());


  var satStart,sundayStart,mondayStart,tueStart,wedStart,thurStart,friStart;
  var satEnd,sundayEnd,mondayEnd,tueEnd,wedEnd,thurEnd,friEnd;

  var paymentIdList=[];
  var mobileNumbers=[];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: buildBusinessInfoBar("Step 3/10"),
      body: Container(
        height: size.height,
        child: Responsive(
          mobile: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                          activeColor: kPrimaryPurple,
                          value: businessTimeController.open24check.value,
                          onChanged: (value) {
                            print("value $value");
                            businessTimeController.check24Hour();
                          }),
                    ),
                    textUbuntu("Open 24 Hours", kPrimaryPurple, fontWeight: weight500, fontSize: 14),
                  ],
                ),
                textUbuntu("Working Days", kPrimaryPurple, fontWeight: weight500, fontSize: 16),
                Obx(() => Row(
                      children: [
                        Checkbox(
                            activeColor: kPrimaryPurple,
                            value: businessTimeController.satCheck.value,
                            onChanged: (value) {
                              print("value $value");
                              businessTimeController.checkSatHour();
                            }),
                        textUbuntu("Saturday", kPrimaryPurple, fontWeight: weight500, fontSize: 14),
                        Spacer(),
                        Row(
                          children: [
                            size5,
                            TimeSetWidget(
                                callBack: () {
                                  setTimerWidget(context, onConfirm: (date) {
                                    var time = DateFormat.jm().format(date).toString();
                                    satStart = DateFormat("hh:mm").format(date).toString();
                                    businessTimeController.setWeeklyStartHour("Sat", time);
                                    print("start Time $time & $satStart");
                                  });
                                },
                                hrSet: businessTimeController.satStartTime.value),
                            textUbuntu("  to  ", kPrimaryPurple, fontWeight: weight500, fontSize: 14),
                            TimeSetWidget(
                                callBack: () {
                                  setTimerWidget(context, onConfirm: (date) {
                                    var time = DateFormat.jm().format(date).toString();
                                    satEnd=DateFormat.Hm().format(date).toString();
                                    businessTimeController.setWeeklyEndHour("Sat", time);
                                    print("end Time $time & $satEnd");
                                  });
                                },
                                hrSet: businessTimeController.satEndTime.value),
                          ],
                        )
                      ],
                    )),
                Obx(() => Row(
                      children: [
                        Checkbox(
                            activeColor: kPrimaryPurple,
                            value: businessTimeController.sunCheck.value,
                            onChanged: (value) {
                              print("value $value");
                              businessTimeController.checkSunHour();
                            }),
                        textUbuntu("Sunday", kPrimaryPurple, fontWeight: weight500, fontSize: 14),
                        Spacer(),
                        Row(
                          children: [
                            size5,
                            TimeSetWidget(
                                callBack: () {
                                  setTimerWidget(context, onConfirm: (date) {
                                    var time = DateFormat.jm().format(date).toString();
                                     sundayStart = DateFormat("hh:mm").format(date).toString();
                                    //sundayStart=time;
                                    businessTimeController.setWeeklyStartHour("Sun", time);
                                    print("sunday $sundayStart");
                                  });
                                },
                                hrSet: businessTimeController.sunStartTime.value),
                            textUbuntu("  to  ", kPrimaryPurple, fontWeight: weight500, fontSize: 14),
                            TimeSetWidget(
                                callBack: () {
                                  setTimerWidget(context, onConfirm: (date) {
                                    var time = DateFormat.jm().format(date).toString();
                                    sundayEnd = DateFormat.Hm().format(date).toString();
                                    businessTimeController.setWeeklyEndHour("Sun", time);
                                    print("sunday end $sundayEnd");
                                  });
                                },
                                hrSet: businessTimeController.sunEndTime.value),
                          ],
                        )
                      ],
                    )),
                Obx(() => Row(
                      children: [
                        Checkbox(
                            activeColor: kPrimaryPurple,
                            value: businessTimeController.monCheck.value,
                            onChanged: (value) {
                              print("value $value");
                              businessTimeController.checkMonHour();
                            }),
                        textUbuntu("Monday", kPrimaryPurple, fontWeight: weight500, fontSize: 14),
                        Spacer(),
                        Row(
                          children: [
                            size5,
                            TimeSetWidget(
                                callBack: () {
                                  setTimerWidget(context, onConfirm: (date) {
                                    var time = DateFormat.jm().format(date).toString();
                                     mondayStart = DateFormat("hh:mm").format(date).toString();
                                    //mondayStart=time;
                                    print("monday $mondayStart");
                                    businessTimeController.setWeeklyStartHour("Mon", time);
                                  });
                                },
                                hrSet: businessTimeController.monStartTime.value),
                            textUbuntu("  to  ", kPrimaryPurple, fontWeight: weight500, fontSize: 14),
                            TimeSetWidget(
                                callBack: () {
                                  setTimerWidget(context, onConfirm: (date) {
                                    var time = DateFormat.jm().format(date).toString();
                                     mondayEnd = DateFormat.Hm().format(date).toString();
                                    businessTimeController.setWeeklyEndHour("Mon", time);
                                    print("monday end $mondayEnd");
                                  });
                                },
                                hrSet: businessTimeController.monEndTime.value),
                          ],
                        )
                      ],
                    )),
                Obx(() => Row(
                      children: [
                        Checkbox(
                            activeColor: kPrimaryPurple,
                            value: businessTimeController.tueCheck.value,
                            onChanged: (value) {
                              print("value $value");
                              businessTimeController.checkTueHour();
                            }),
                        textUbuntu("Tuesday", kPrimaryPurple, fontWeight: weight500, fontSize: 14),
                        Spacer(),
                        Row(
                          children: [
                            size5,
                            TimeSetWidget(
                                callBack: () {
                                  setTimerWidget(context, onConfirm: (date) {
                                    var time = DateFormat.jm().format(date).toString();
                                    tueStart = DateFormat("hh:mm").format(date).toString();

                                   // tueStart=time;
                                    print("tuesday $tueStart");
                                    businessTimeController.setWeeklyStartHour("Tue", time);
                                  });
                                },
                                hrSet: businessTimeController.tueStartTime.value),
                            textUbuntu("  to  ", kPrimaryPurple, fontWeight: weight500, fontSize: 14),
                            TimeSetWidget(
                                callBack: () {
                                  setTimerWidget(context, onConfirm: (date) {
                                    var time = DateFormat.jm().format(date).toString();
                                     tueEnd = DateFormat.Hm().format(date).toString();
                                    businessTimeController.setWeeklyEndHour("Tue", time);
                                    print("tuesday end $tueEnd");
                                  });
                                },
                                hrSet: businessTimeController.tueEndTime.value),
                          ],
                        )
                      ],
                    )),
                Obx(() => Row(
                      children: [
                        Checkbox(
                            activeColor: kPrimaryPurple,
                            value: businessTimeController.wedCheck.value,
                            onChanged: (value) {
                              print("value $value");
                              businessTimeController.checkWedHour();
                            }),
                        textUbuntu("Wednesday", kPrimaryPurple, fontWeight: weight500, fontSize: 14),
                        Spacer(),
                        Row(
                          children: [
                            size5,
                            TimeSetWidget(
                                callBack: () {
                                  setTimerWidget(context, onConfirm: (date) {
                                    var time = DateFormat.jm().format(date).toString();
                                    wedStart = DateFormat("hh:mm").format(date).toString();

                                   // wedStart=time;
                                    print("Wed $time");
                                    businessTimeController.setWeeklyStartHour("Wed", time);
                                  });
                                },
                                hrSet: businessTimeController.wedStartTime.value),
                            textUbuntu("  to  ", kPrimaryPurple, fontWeight: weight500, fontSize: 14),
                            TimeSetWidget(
                                callBack: () {
                                  setTimerWidget(context, onConfirm: (date) {
                                    var time = DateFormat.jm().format(date).toString();
                                    wedEnd = DateFormat.Hm().format(date).toString();
                                    businessTimeController.setWeeklyEndHour("Wed", time);
                                    print("Wed end $wedEnd");
                                  });
                                },
                                hrSet: businessTimeController.wedEndTime.value),
                          ],
                        )
                      ],
                    )),
                Obx(() => Row(
                      children: [
                        Checkbox(
                            activeColor: kPrimaryPurple,
                            value: businessTimeController.thuCheck.value,
                            onChanged: (value) {
                              print("value $value");
                              businessTimeController.checkThursHour();
                            }),
                        textUbuntu("Thursday", kPrimaryPurple, fontWeight: weight500, fontSize: 14),
                        Spacer(),
                        Row(
                          children: [
                            size5,
                            TimeSetWidget(
                                callBack: () {
                                  setTimerWidget(context, onConfirm: (date) {
                                    var time = DateFormat.jm().format(date).toString();
                                    thurStart = DateFormat("hh:mm").format(date).toString();

                                    //thurStart=time;
                                    print("thurs $thurStart");
                                    businessTimeController.setWeeklyStartHour("Thurs", time);
                                  });
                                },
                                hrSet: businessTimeController.thursStartTime.value),
                            textUbuntu("  to  ", kPrimaryPurple, fontWeight: weight500, fontSize: 14),
                            TimeSetWidget(
                                callBack: () {
                                  setTimerWidget(context, onConfirm: (date) {
                                    var time = DateFormat.jm().format(date).toString();
                                    thurEnd = DateFormat.Hm().format(date).toString();
                                    print(" thurs end $thurEnd");
                                    businessTimeController.setWeeklyEndHour("Thurs", time);
                                  });
                                },
                                hrSet: businessTimeController.thursEndTime.value)
                          ],
                        )
                      ],
                    )),
                Obx(() => Row(
                      children: [
                        Checkbox(
                            activeColor: kPrimaryPurple,
                            value: businessTimeController.friCheck.value,
                            onChanged: (value) {
                              print("value $value");
                              businessTimeController.checkFriHour();
                            }),
                        textUbuntu("Friday", kPrimaryPurple, fontWeight: weight500, fontSize: 14),
                        Spacer(),
                        Row(
                          children: [
                            size5,
                            TimeSetWidget(
                                callBack: () {
                                  setTimerWidget(context, onConfirm: (date) {
                                    var time = DateFormat.jm().format(date).toString();
                                    friStart = DateFormat("hh:mm").format(date).toString();

                                    businessTimeController.setWeeklyStartHour("Fri", time);
                                  });
                                },
                                hrSet: businessTimeController.friStartTime.value),
                            textUbuntu("  to  ", kPrimaryPurple, fontWeight: weight500, fontSize: 14),
                            TimeSetWidget(
                                callBack: () {
                                  setTimerWidget(context, onConfirm: (date) {
                                    var time = DateFormat.jm().format(date).toString();
                                    friEnd = DateFormat.Hm().format(date).toString();
                                    businessTimeController.setWeeklyEndHour("Fri", time);
                                  });
                                },
                                hrSet: businessTimeController.friEndTime.value)
                          ],
                        )
                      ],
                    )),
                size20,
                GestureDetector(
                  onTap: () async {
                    showBarModalBottomSheet(
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
                                            textUbuntu("Select payaments methods", kPrimaryPurple,fontWeight:
                                            weight500,fontSize: 16),
                                            Expanded(
                                              child: ListView.builder(
                                                itemCount: paymentController.paymentModelClass.value.results.length,
                                                itemBuilder: (_, index) {
                                                  return Obx(() => CheckboxListTile(
                                                        activeColor: kPrimaryPurple,
                                                        value: paymentController.paymentList.contains(paymentController
                                                            .paymentModelClass.value.results[index].name),
                                                        onChanged: (bool selected) {
                                                          if (selected == true) {
                                                            paymentIdList.add(paymentController
                                                                .paymentModelClass.value.results[index].sId);
                                                            paymentController.onSelect(
                                                                paymentController
                                                                    .paymentModelClass.value.results[index].name,
                                                                selected);
                                                          } else {
                                                            paymentController.onRemove(
                                                                paymentController
                                                                    .paymentModelClass.value.results[index].name,
                                                                selected);
                                                          }
                                                        },
                                                        title: Container(
                                                          height: 20.0,
                                                          margin: EdgeInsets.only(
                                                              top: 10.0, left: 10, right: 10, bottom: 5.0),
                                                          child: Row(
                                                            children: <Widget>[
                                                              textUbuntu(
                                                                  paymentController
                                                                      .paymentModelClass.value.results[index].name,
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
                                              callback: (){
                                                Navigator.of(context).pop();
                                                print(paymentIdList);
                                              }
                                            )
                                          ],
                                        ),
                            )));
                  },
                  child: Row(
                    children: [
                      textUbuntu("Select payment methods  ", kPrimaryPurple, fontWeight: weight500, fontSize: 16),
                      Icon(
                        Icons.arrow_drop_down_circle,
                        color: kPrimaryPurple,
                        size: 20,
                      )
                    ],
                  ),
                ),
                size10,
                Obx(() => paymentController.paymentList.length == 0
                    ? Container(child: Center(child: textUbuntu("No payment selected", kPrimaryPurple),),)
                    : Container(
                        height: 30,
                        width: size.width,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: paymentController.paymentList.length,
                          itemBuilder: (_, index) {
                            return Container(
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
                            );
                          },
                        ),
                      )),
                Spacer(),
                GestureDetector(
                  onTap: (){


                    if(paymentController.paymentList.length==0){
                      return showErrorToast("Select your payment method");
                    }else{
                      boxStorage.write(SAT_START,satStart);
                      boxStorage.write(SUN_START,sundayStart);
                      boxStorage.write(MON_START,mondayStart);
                      boxStorage.write(TUE_START,tueStart);
                      boxStorage.write(WED_START,wedStart);
                      boxStorage.write(THURS_START,thurStart);
                      boxStorage.write(FRI_START,friStart);

                      boxStorage.write(SAT_END, satEnd);
                      boxStorage.write(SUN_END, sundayEnd);
                      boxStorage.write(MON_END, mondayEnd);
                      boxStorage.write(TUE_END, tueEnd);
                      boxStorage.write(WED_END, wedEnd);
                      boxStorage.write(THURS_END, thurEnd);
                      boxStorage.write(FRI_END, friEnd);
                      boxStorage.write(PAYMENT_ID_LIST, paymentIdList);

                      Navigator.pushNamed(context, '/stepFour');
                    }
                    

                  },
                  child: Row(
                    children: [
                      Expanded(child: Container()),
                      textUbuntu("Go To Step 4 ", kPrimaryPurple, fontWeight: weightBold, fontSize: 18.0),
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
          tablet: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                size10,
                Row(
                  children: [
                    Obx(
                          () => Checkbox(
                          activeColor: kPrimaryPurple,
                          value: businessTimeController.open24check.value,
                          onChanged: (value) {
                            print("value $value");
                            businessTimeController.check24Hour();
                          }),
                    ),
                    textUbuntu("Open 24 Hours", kPrimaryPurple, fontWeight: weight500, fontSize: 16),
                  ],
                ),
                textUbuntu("Working Days", kPrimaryPurple, fontWeight: weight500, fontSize: 18),
                size5,
                Obx(() => Row(
                  children: [
                    Checkbox(
                        activeColor: kPrimaryPurple,
                        value: businessTimeController.satCheck.value,
                        onChanged: (value) {
                          print("value $value");
                          businessTimeController.checkSatHour();
                        }),
                    textUbuntu("Saturday", kPrimaryPurple, fontWeight: weight500, fontSize: 16),
                    Spacer(),
                    Row(
                      children: [
                        size5,
                        TimeSetWidget(
                            callBack: () {
                              setTimerWidget(context, onConfirm: (date) {
                                var time = DateFormat.jm().format(date).toString();
                                satStart = DateFormat("hh:mm").format(date).toString();
                                businessTimeController.setWeeklyStartHour("Sat", time);
                                print("start Time $time & $satStart");
                              });
                            },
                            hrSet: businessTimeController.satStartTime.value),
                        textUbuntu("  to  ", kPrimaryPurple, fontWeight: weight500, fontSize: 16),
                        TimeSetWidget(
                            callBack: () {
                              setTimerWidget(context, onConfirm: (date) {
                                var time = DateFormat.jm().format(date).toString();
                                satEnd=DateFormat.Hm().format(date).toString();
                                businessTimeController.setWeeklyEndHour("Sat", time);
                                print("end Time $time & $satEnd");
                              });
                            },
                            hrSet: businessTimeController.satEndTime.value),
                      ],
                    )
                  ],
                )),
                Obx(() => Row(
                  children: [
                    Checkbox(
                        activeColor: kPrimaryPurple,
                        value: businessTimeController.sunCheck.value,
                        onChanged: (value) {
                          print("value $value");
                          businessTimeController.checkSunHour();
                        }),
                    textUbuntu("Sunday", kPrimaryPurple, fontWeight: weight500, fontSize: 16),
                    Spacer(),
                    Row(
                      children: [
                        size5,
                        TimeSetWidget(
                            callBack: () {
                              setTimerWidget(context, onConfirm: (date) {
                                var time = DateFormat.jm().format(date).toString();
                                sundayStart = DateFormat("hh:mm").format(date).toString();
                                //sundayStart=time;
                                businessTimeController.setWeeklyStartHour("Sun", time);
                                print("sunday $sundayStart");
                              });
                            },
                            hrSet: businessTimeController.sunStartTime.value),
                        textUbuntu("  to  ", kPrimaryPurple, fontWeight: weight500, fontSize: 16),
                        TimeSetWidget(
                            callBack: () {
                              setTimerWidget(context, onConfirm: (date) {
                                var time = DateFormat.jm().format(date).toString();
                                sundayEnd = DateFormat.Hm().format(date).toString();
                                businessTimeController.setWeeklyEndHour("Sun", time);
                                print("sunday end $sundayEnd");
                              });
                            },
                            hrSet: businessTimeController.sunEndTime.value),
                      ],
                    )
                  ],
                )),
                Obx(() => Row(
                  children: [
                    Checkbox(
                        activeColor: kPrimaryPurple,
                        value: businessTimeController.monCheck.value,
                        onChanged: (value) {
                          print("value $value");
                          businessTimeController.checkMonHour();
                        }),
                    textUbuntu("Monday", kPrimaryPurple, fontWeight: weight500, fontSize: 16),
                    Spacer(),
                    Row(
                      children: [
                        size5,
                        TimeSetWidget(
                            callBack: () {
                              setTimerWidget(context, onConfirm: (date) {
                                var time = DateFormat.jm().format(date).toString();
                                mondayStart = DateFormat("hh:mm").format(date).toString();
                                //mondayStart=time;
                                print("monday $mondayStart");
                                businessTimeController.setWeeklyStartHour("Mon", time);
                              });
                            },
                            hrSet: businessTimeController.monStartTime.value),
                        textUbuntu("  to  ", kPrimaryPurple, fontWeight: weight500, fontSize: 16),
                        TimeSetWidget(
                            callBack: () {
                              setTimerWidget(context, onConfirm: (date) {
                                var time = DateFormat.jm().format(date).toString();
                                mondayEnd = DateFormat.Hm().format(date).toString();
                                businessTimeController.setWeeklyEndHour("Mon", time);
                                print("monday end $mondayEnd");
                              });
                            },
                            hrSet: businessTimeController.monEndTime.value),
                      ],
                    )
                  ],
                )),
                Obx(() => Row(
                  children: [
                    Checkbox(
                        activeColor: kPrimaryPurple,
                        value: businessTimeController.tueCheck.value,
                        onChanged: (value) {
                          print("value $value");
                          businessTimeController.checkTueHour();
                        }),
                    textUbuntu("Tuesday", kPrimaryPurple, fontWeight: weight500, fontSize: 16),
                    Spacer(),
                    Row(
                      children: [
                        size5,
                        TimeSetWidget(
                            callBack: () {
                              setTimerWidget(context, onConfirm: (date) {
                                var time = DateFormat.jm().format(date).toString();
                                tueStart = DateFormat("hh:mm").format(date).toString();

                                // tueStart=time;
                                print("tuesday $tueStart");
                                businessTimeController.setWeeklyStartHour("Tue", time);
                              });
                            },
                            hrSet: businessTimeController.tueStartTime.value),
                        textUbuntu("  to  ", kPrimaryPurple, fontWeight: weight500, fontSize: 16),
                        TimeSetWidget(
                            callBack: () {
                              setTimerWidget(context, onConfirm: (date) {
                                var time = DateFormat.jm().format(date).toString();
                                tueEnd = DateFormat.Hm().format(date).toString();
                                businessTimeController.setWeeklyEndHour("Tue", time);
                                print("tuesday end $tueEnd");
                              });
                            },
                            hrSet: businessTimeController.tueEndTime.value),
                      ],
                    )
                  ],
                )),
                Obx(() => Row(
                  children: [
                    Checkbox(
                        activeColor: kPrimaryPurple,
                        value: businessTimeController.wedCheck.value,
                        onChanged: (value) {
                          print("value $value");
                          businessTimeController.checkWedHour();
                        }),
                    textUbuntu("Wednesday", kPrimaryPurple, fontWeight: weight500, fontSize: 16),
                    Spacer(),
                    Row(
                      children: [
                        size5,
                        TimeSetWidget(
                            callBack: () {
                              setTimerWidget(context, onConfirm: (date) {
                                var time = DateFormat.jm().format(date).toString();
                                wedStart = DateFormat("hh:mm").format(date).toString();

                                // wedStart=time;
                                print("Wed $time");
                                businessTimeController.setWeeklyStartHour("Wed", time);
                              });
                            },
                            hrSet: businessTimeController.wedStartTime.value),
                        textUbuntu("  to  ", kPrimaryPurple, fontWeight: weight500, fontSize: 16),
                        TimeSetWidget(
                            callBack: () {
                              setTimerWidget(context, onConfirm: (date) {
                                var time = DateFormat.jm().format(date).toString();
                                wedEnd = DateFormat.Hm().format(date).toString();
                                businessTimeController.setWeeklyEndHour("Wed", time);
                                print("Wed end $wedEnd");
                              });
                            },
                            hrSet: businessTimeController.wedEndTime.value),
                      ],
                    )
                  ],
                )),
                Obx(() => Row(
                  children: [
                    Checkbox(
                        activeColor: kPrimaryPurple,
                        value: businessTimeController.thuCheck.value,
                        onChanged: (value) {
                          print("value $value");
                          businessTimeController.checkThursHour();
                        }),
                    textUbuntu("Thursday", kPrimaryPurple, fontWeight: weight500, fontSize: 16),
                    Spacer(),
                    Row(
                      children: [
                        size5,
                        TimeSetWidget(
                            callBack: () {
                              setTimerWidget(context, onConfirm: (date) {
                                var time = DateFormat.jm().format(date).toString();
                                thurStart = DateFormat("hh:mm").format(date).toString();

                                //thurStart=time;
                                print("thurs $thurStart");
                                businessTimeController.setWeeklyStartHour("Thurs", time);
                              });
                            },
                            hrSet: businessTimeController.thursStartTime.value),
                        textUbuntu("  to  ", kPrimaryPurple, fontWeight: weight500, fontSize: 16),
                        TimeSetWidget(
                            callBack: () {
                              setTimerWidget(context, onConfirm: (date) {
                                var time = DateFormat.jm().format(date).toString();
                                thurEnd = DateFormat.Hm().format(date).toString();
                                print(" thurs end $thurEnd");
                                businessTimeController.setWeeklyEndHour("Thurs", time);
                              });
                            },
                            hrSet: businessTimeController.thursEndTime.value)
                      ],
                    )
                  ],
                )),
                Obx(() => Row(
                  children: [
                    Checkbox(
                        activeColor: kPrimaryPurple,
                        value: businessTimeController.friCheck.value,
                        onChanged: (value) {
                          print("value $value");
                          businessTimeController.checkFriHour();
                        }),
                    textUbuntu("Friday", kPrimaryPurple, fontWeight: weight500, fontSize: 16),
                    Spacer(),
                    Row(
                      children: [
                        size5,
                        TimeSetWidget(
                            callBack: () {
                              setTimerWidget(context, onConfirm: (date) {
                                var time = DateFormat.jm().format(date).toString();
                                friStart = DateFormat("hh:mm").format(date).toString();

                                businessTimeController.setWeeklyStartHour("Fri", time);
                              });
                            },
                            hrSet: businessTimeController.friStartTime.value),
                        textUbuntu("  to  ", kPrimaryPurple, fontWeight: weight500, fontSize: 16),
                        TimeSetWidget(
                            callBack: () {
                              setTimerWidget(context, onConfirm: (date) {
                                var time = DateFormat.jm().format(date).toString();
                                friEnd = DateFormat.Hm().format(date).toString();
                                businessTimeController.setWeeklyEndHour("Fri", time);
                              });
                            },
                            hrSet: businessTimeController.friEndTime.value)
                      ],
                    )
                  ],
                )),
                size20,
                GestureDetector(
                  onTap: () async {
                    showBarModalBottomSheet(
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
                              size20,
                              textUbuntu("Select payaments methods", kPrimaryPurple,fontWeight:
                              weight500,fontSize: 18),
                              size20,
                              Expanded(
                                child: ListView.builder(
                                  itemCount: paymentController.paymentModelClass.value.results.length,
                                  itemBuilder: (_, index) {
                                    return Obx(() => CheckboxListTile(
                                      activeColor: kPrimaryPurple,
                                      value: paymentController.paymentList.contains(paymentController
                                          .paymentModelClass.value.results[index].name),
                                      onChanged: (bool selected) {
                                        if (selected == true) {
                                          paymentIdList.add(paymentController
                                              .paymentModelClass.value.results[index].sId);
                                          paymentController.onSelect(
                                              paymentController
                                                  .paymentModelClass.value.results[index].name,
                                              selected);
                                        } else {
                                          paymentController.onRemove(
                                              paymentController
                                                  .paymentModelClass.value.results[index].name,
                                              selected);
                                        }
                                      },
                                      title: Container(
                                        height: 20.0,
                                        margin: EdgeInsets.only(
                                            top: 10.0, left: 10, right: 10, bottom: 5.0),
                                        child: Row(
                                          children: <Widget>[
                                            textUbuntu(
                                                paymentController
                                                    .paymentModelClass.value.results[index].name,
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
                                  height: 50,
                                  edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 120, vertical: 15.0),
                                  borderRadiusGeometry: BorderRadius.circular(10.0),
                                  textColor: kWhiteColor,
                                  buttonText: "Submit",
                                  buttonColor: kPrimaryPurple,
                                  isIcon: false,
                                  callback: (){
                                    Navigator.of(context).pop();
                                    print(paymentIdList);
                                  }
                              )
                            ],
                          ),
                        )));
                  },
                  child: Row(
                    children: [
                      textUbuntu("Select payment methods  ", kPrimaryPurple, fontWeight: weight500, fontSize: 18),
                      Icon(
                        Icons.arrow_drop_down_circle,
                        color: kPrimaryPurple,
                        size: 25,
                      )
                    ],
                  ),
                ),
                size10,
                Obx(() => paymentController.paymentList.length == 0
                    ? Container(child: Center(child: textUbuntu("No payment selected", kPrimaryPurple),),)
                    : Container(
                  height: 30,
                  width: size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: paymentController.paymentList.length,
                    itemBuilder: (_, index) {
                      return Container(
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
                      );
                    },
                  ),
                )),
                Spacer(),
                GestureDetector(
                  onTap: (){


                    if(paymentController.paymentList.length==0){
                      return showErrorToast("Select your payment method");
                    }else{
                      boxStorage.write(SAT_START,satStart);
                      boxStorage.write(SUN_START,sundayStart);
                      boxStorage.write(MON_START,mondayStart);
                      boxStorage.write(TUE_START,tueStart);
                      boxStorage.write(WED_START,wedStart);
                      boxStorage.write(THURS_START,thurStart);
                      boxStorage.write(FRI_START,friStart);

                      boxStorage.write(SAT_END, satEnd);
                      boxStorage.write(SUN_END, sundayEnd);
                      boxStorage.write(MON_END, mondayEnd);
                      boxStorage.write(TUE_END, tueEnd);
                      boxStorage.write(WED_END, wedEnd);
                      boxStorage.write(THURS_END, thurEnd);
                      boxStorage.write(FRI_END, friEnd);

                      boxStorage.write(PAYMENT_ID_LIST, paymentIdList);

                      Navigator.pushNamed(context, '/stepFour');
                    }


                  },
                  child: Row(
                    children: [
                      Expanded(child: Container()),
                      textUbuntu("Go To Step 4 ", kPrimaryPurple, fontWeight: weightBold, fontSize: 18.0),
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
    );
  }
}

Future<DateTime> setTimerWidget(BuildContext context, {Function onConfirm}) {
  return DatePicker.showTime12hPicker(context,
      showTitleActions: true, onConfirm: onConfirm, currentTime: DateTime(2008, 12, 31, 23, 12, 34));
}
