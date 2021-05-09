import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/controller/listWidgetController.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/screens/addBusiness/stepOneScreen.dart';
import 'package:johukum/widgets/addBusinessForm.dart';
import 'package:johukum/widgets/textWidgets.dart';

class StepFiveScreen extends StatelessWidget {
  var controller = Get.put(ListWidgetController());

  var questionOne = TextEditingController();
  var questionTwo = TextEditingController();
  var questionThree = TextEditingController();
  var questionFour = TextEditingController();

  var answerOne = TextEditingController();
  var answerTwo = TextEditingController();
  var answerThree = TextEditingController();
  var answerFour = TextEditingController();

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
                Container(
                  child: Column(
                    children: [
                      textUbuntu("Frequent asked Question 1", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                      AddBusinessForm(
                        controller: questionOne,
                        textInputType: TextInputType.number,
                        hintText: "Enter Question 1",
                        isSuffix: false,
                      ),
                      AddBusinessForm(
                        controller: answerOne,
                        textInputType: TextInputType.number,
                        hintText: "Enter Answere 1",
                        isSuffix: false,
                        maxLine: 6,
                      ),
                      Obx(() => controller.addQuestionTwo.value == false
                          ? GestureDetector(
                              onTap: () {
                                controller.addQuestionTwo.value = true;
                              },
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: textUbuntu("Add More Questions", kPrimaryPurple,
                                    fontSize: 18, fontWeight: weight500),
                              ),
                            )
                          : Container())
                    ],
                  ),
                ),
                size10,
                Obx(
                  () => controller.addQuestionTwo.value == true
                      ? Container(
                          child: Column(
                            children: [
                              textUbuntu("Frequent asked Question 2", kBlackColor,
                                  fontSize: 16.0, fontWeight: weight500),
                              AddBusinessForm(
                                controller: questionTwo,
                                textInputType: TextInputType.number,
                                hintText: "Enter Question 2",
                                isSuffix: false,
                              ),
                              AddBusinessForm(
                                controller: answerTwo,
                                textInputType: TextInputType.number,
                                hintText: "Enter Answere 2",
                                isSuffix: false,
                                maxLine: 6,
                              ),
                              Obx(() => controller.addQuestionThree.value == false
                                  ? GestureDetector(
                                      onTap: () {
                                        controller.addQuestionThree.value = true;
                                      },
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: textUbuntu("Add More Questions", kPrimaryPurple,
                                            fontSize: 18, fontWeight: weight500),
                                      ),
                                    )
                                  : Container())
                            ],
                          ),
                        )
                      : Container(),
                ),
                size10,
                Obx(
                  () => controller.addQuestionThree.value == true
                      ? Container(
                          child: Column(
                            children: [
                              textUbuntu("Frequent asked Question 3", kBlackColor,
                                  fontSize: 16.0, fontWeight: weight500),
                              AddBusinessForm(
                                controller: questionThree,
                                textInputType: TextInputType.number,
                                hintText: "Enter Question 3",
                                isSuffix: false,
                              ),
                              AddBusinessForm(
                                controller: answerThree,
                                textInputType: TextInputType.number,
                                hintText: "Enter Answere 3",
                                isSuffix: false,
                                maxLine: 6,
                              ),
                              Obx(() => controller.addQuestionFour.value == false
                                  ? GestureDetector(
                                      onTap: () {
                                        controller.addQuestionFour.value = true;
                                      },
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: textUbuntu("Add More Questions", kPrimaryPurple,
                                            fontSize: 18, fontWeight: weight500),
                                      ),
                                    )
                                  : Container())
                            ],
                          ),
                        )
                      : Container(),
                ),
                size10,
                Obx(
                  () => controller.addQuestionFour.value == true
                      ? Container(
                          child: Column(
                            children: [
                              textUbuntu("Frequent asked Question 4", kBlackColor,
                                  fontSize: 16.0, fontWeight: weight500),
                              AddBusinessForm(
                                controller: questionFour,
                                textInputType: TextInputType.number,
                                hintText: "Enter Question 4",
                                isSuffix: false,
                              ),
                              AddBusinessForm(
                                controller: answerFour,
                                textInputType: TextInputType.number,
                                hintText: "Enter Answere 4",
                                isSuffix: false,
                                maxLine: 6,
                              ),
                              Obx(() => controller.addQuestionFour.value == true ? Container() : Container())
                            ],
                          ),
                        )
                      : Container(),
                ),
                GestureDetector(
                  onTap: () {
                    boxStorage.write(QUESTION_ONE, questionOne);
                    boxStorage.write(QUESTION_TWO, questionTwo);
                    boxStorage.write(QUESTION_THREE, questionThree);
                    boxStorage.write(QUESTION_FOUR, questionFour);

                    boxStorage.write(ANSWER_ONE, answerOne);
                    boxStorage.write(ANSWER_TWO, answerTwo);
                    boxStorage.write(ANSWER_THREE, answerThree);
                    boxStorage.write(ANSWER_FOUR, answerFour);

                    Navigator.pushNamed(context, '/stepSix');
                  },
                  child: Row(
                    children: [
                      Expanded(child: Container()),
                      textUbuntu("Go To Step 5 ", kPrimaryPurple, fontWeight: weightBold, fontSize: 18.0),
                      Icon(
                        Icons.arrow_forward,
                        color: kPrimaryPurple,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}

/*



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
size20*/
