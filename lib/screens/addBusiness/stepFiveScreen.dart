import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/controller/listWidgetController.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/screens/addBusiness/stepOneScreen.dart';
import 'package:johukum/screens/welcomeScreen/welcomeButtonWidget.dart';
import 'package:johukum/widgets/addBusinessForm.dart';
import 'package:johukum/widgets/textWidgets.dart';

class StepFiveScreen extends StatelessWidget {
  var controller = Get.put(ListWidgetController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: buildBusinessInfoBar("Step 5/10"),
      body: Container(
        height: size.height,
        child: Responsive(
            mobile: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textUbuntu("Frequent asked Question 1", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                AddBusinessForm(
                  textInputType: TextInputType.number,
                  hintText: "Enter Question",
                  isSuffix: false,
                ),
                AddBusinessForm(
                  textInputType: TextInputType.number,
                  hintText: "Enter Answere",
                  isSuffix: false,
                ),
                Obx(
                  () => controller.questionList.length == 0
                      ? Text("")
                      : ListView.builder(
                          itemCount: controller.questionList.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (_, index) {
                            return GestureDetector(
                              onTap: () {
                                //controller.list.removeAt(index);
                              },
                              child: Container(child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  size10,
                                  controller.questionList[index],
                                  WelcomeScreenButton(
                                    height: 40.0,
                                    edgeInsetsGeometry: EdgeInsets.only(right: 170.0),
                                    buttonText: "Remove Questions",
                                    textColor: kWhiteColor,
                                    borderRadiusGeometry: BorderRadius.circular(10.0),
                                    isIcon: false,
                                    buttonColor: kSecondaryPurple,
                                    callback: () {
                                      controller.questionList.removeAt(index);
                                    },
                                  ),
                                ],
                              )),
                            );
                          },
                        ),
                ),
                size20,
                WelcomeScreenButton(
                  height: 40.0,
                  edgeInsetsGeometry: EdgeInsets.only(right: 140.0),
                  buttonText: "Add More Questions",
                  textColor: kWhiteColor,
                  borderRadiusGeometry: BorderRadius.circular(10.0),
                  isIcon: false,
                  buttonColor: kPrimaryPurple,
                  callback: () {
                    controller.addQuestionWidget(Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textUbuntu("Frequent asked Question ", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                        AddBusinessForm(
                          textInputType: TextInputType.number,
                          hintText: "Enter Question",
                          isSuffix: false,
                        ),
                        AddBusinessForm(
                          textInputType: TextInputType.number,
                          hintText: "Enter Answere",
                          isSuffix: false,
                        ),
                      ],
                    ));
                  },
                ),
                size20,
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/stepSix'),
                  child: Row(
                    children: [
                      Expanded(child: Container()),
                      textUbuntu("Go To Step 6 ", kPrimaryPurple, fontWeight: weightBold, fontSize: 18.0),
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
        )),
      ),
    );
  }
}
