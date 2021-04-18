import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/controller/timePickerController.dart';
import 'package:johukum/screens/addBusiness/stepOneScreen.dart';
import 'package:johukum/widgets/textWidgets.dart';
import 'package:intl/intl.dart';
import '../../responsive.dart';

class StepThreeScreen extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  DateTime selectedTimeDateTime;
  DateTime endTimeDateTime;

  var timePickerController=Get.put(TimePickerController());
  @override
  Widget build(BuildContext context) {

    Size size=MediaQuery.of(context).size;

    return Scaffold(
      appBar:buildBusinessInfoBar("Step 3/10"),
      body: Container(
        height: size.height,
        child: Responsive(
          mobile: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Form(
                key: _formKey,
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    size20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textUbuntu("Open Time", kBlackColor,fontWeight: weight500,fontSize: 16),
                            size5,

                            Obx(()=>GestureDetector(
                              onTap: (){
                                DatePicker.showTime12hPicker(
                                    context, showTitleActions: true,
                                    onChanged: (date) {},
                                    onConfirm: (date) {
                                      var time = DateFormat.jm().format(date).toString();
                                      timePickerController.setStartTime(time);
                                      print("Start Time $time");
                                    },
                                    currentTime: DateTime(
                                        2008, 12, 31, 23, 12, 34));
                              },
                              child: setTimeWidget(timeValue: timePickerController.startTime.value),
                            )),


                          ],
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textUbuntu("Close Time", kBlackColor,fontWeight: weight500,fontSize: 16),
                            size5,
                            Obx(()=>GestureDetector(
                              onTap: (){
                                DatePicker.showTime12hPicker(
                                    context, showTitleActions: true,
                                    onChanged: (date) {},
                                    onConfirm: (date) {
                                      var time = DateFormat.jm().format(date).toString();
                                      timePickerController.setEndTime(time);
                                      print("end Time $time");
                                    },
                                    currentTime: DateTime(
                                        2008, 12, 31, 23, 12, 34));
                              },
                              child: setTimeWidget(timeValue: timePickerController.endTime.value),
                            )),
                          ],
                        ),
                      ],
                    ),
                    size10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textUbuntu("Leisure Start", kBlackColor,fontWeight: weight500,fontSize: 16),
                            size5,

                            Obx(()=>GestureDetector(
                              onTap: (){
                                DatePicker.showTime12hPicker(
                                    context, showTitleActions: true,
                                    onChanged: (date) {},
                                    onConfirm: (date) {
                                      var time = DateFormat.jm().format(date).toString();
                                      timePickerController.leisureStartTime(time);
                                      print("Start Time $time");
                                    },
                                    currentTime: DateTime(
                                        2008, 12, 31, 23, 12, 34));
                              },
                              child: setTimeWidget(timeValue: timePickerController.startLeisureTime.value),
                            )),


                          ],
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textUbuntu("Leisure End", kBlackColor,fontWeight: weight500,fontSize: 16),
                            size5,
                            Obx(()=>GestureDetector(
                              onTap: (){
                                DatePicker.showTime12hPicker(
                                    context, showTitleActions: true,
                                    onChanged: (date) {},
                                    onConfirm: (date) {
                                      var time = DateFormat.jm().format(date).toString();
                                      timePickerController.leisureEndTime(time);
                                      print("end Time $time");
                                    },
                                    currentTime: DateTime(
                                        2008, 12, 31, 23, 12, 34));
                              },
                              child: setTimeWidget(timeValue: timePickerController.endLeisureTime.value),
                            )),
                          ],
                        ),
                      ],
                    ),
                    size10,
                    textUbuntu("Select working days", kBlackColor,fontSize: 16,fontWeight: weight500),
                    Row(
                      children: [
                        Checkbox(
                          value: true,
                          checkColor: kWhiteColor,
                          activeColor: kPrimaryPurple,
                        )
                      ],
                    )
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

class setTimeWidget extends StatelessWidget {
  const setTimeWidget({
    Key key,
    @required this.timeValue,
  }) : super(key: key);

  final String timeValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 140,
      decoration: BoxDecoration(
          color: kPrimaryPurple.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10.0)
      ),
      child: Center(child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.access_time,size: 16,),
          SizedBox(width: 3.0,),
          textUbuntu(timeValue,kBlackColor,fontSize: 16),
        ],
      )),
    );
  }
}

//
//DatePicker.showTime12hPicker(context, showTitleActions: true, onChanged: (date) {}, onConfirm: (date) {
//setState(() {
//selectedTimeDateTime = date;
//var fromTime=DateFormat.jm().format(selectedTimeDateTime).toString();
//startTime = DateFormat('Hms').format(selectedTimeDateTime).toString();
//prefs.setString("start time", fromTime);
//print("Start Time $fromTime");
//});
//}, currentTime: DateTime(2008, 12, 31, 23, 12, 34))
