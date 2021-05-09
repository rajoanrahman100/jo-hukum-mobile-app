import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/controller/businessTagController.dart';
import 'package:johukum/controller/keywordController.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/screens/addBusiness/stepOneScreen.dart';
import 'package:johukum/screens/fullScreenAlertDialog/fullScreenKeyword.dart';
import 'package:johukum/screens/welcomeScreen/welcomeButtonWidget.dart';
import 'package:johukum/widgets/addBusinessForm.dart';
import 'package:johukum/widgets/textWidgets.dart';

class StepSevenScreen extends StatelessWidget {
  var keywordController = Get.put(KeywordController());
  var tagController = Get.put(BusinessTagController());

  var tag = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildBusinessInfoBar("Step 7"),
      body: Container(
        height: size.height,
        child: Responsive(
          mobile: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textUbuntu("Title for SEO", kPrimaryPurple, fontSize: 16.0, fontWeight: weight500),
                  size5,
                  AddBusinessForm(
                    hintText: "",
                    isSuffix: false,
                  ),
                  size10,
                  textUbuntu("Meta Description", kPrimaryPurple, fontWeight: weight500, fontSize: 16),
                  size5,
                  AddBusinessForm(
                    textInputType: TextInputType.emailAddress,
                    hintText: "",
                    //height: 40.0,
                    maxLine: 6,
                    isSuffix: false,
                  ),
                  size10,
                  textUbuntu("Add Business Tag", kPrimaryPurple, fontSize: 16.0, fontWeight: weight500),
                  size5,
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: AddBusinessForm(
                          controller: tag,
                          hintText: "",
                          isSuffix: false,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          tagController.addTagList(tag.text);
                          tag.clear();
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(color: kPrimaryPurple, borderRadius: BorderRadius.circular(10.0)),
                          child: Center(
                            child: Text(
                              "ADD",
                              style: textStyleUbuntu(color: kWhiteColor, fontWeight: weight500),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  size10,
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(height: 30, child: Center(child: textUbuntu("Tags: ", kPrimaryPurple, fontWeight: weight500))),
                      Obx(
                        () => tagController.tagList.length == 0
                            ? Container(
                                height: 30, child: Center(child: textUbuntu("No tagg added", kPrimaryPurple, fontWeight: weight400)))
                            : Expanded(
                                child: Container(
                                  height: 30,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: tagController.tagList.length,
                                    itemBuilder: (_, index) {
                                      return GestureDetector(
                                        onTap: (){
                                          tagController.tagList.removeAt(index);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              //color: kPrimaryPurple,
                                              borderRadius: BorderRadius.circular(5.0),
                                              //border: Border.all(color: Colors.black.withOpacity(0.2))
                                            ),
                                            child: Row(
                                              children: [
                                                textUbuntu(tagController.tagList[index], kPrimaryPurple,fontWeight:
                                                weight500,fontSize: 16),
                                                SizedBox(width: 2,),
                                                Icon(Icons.cancel,color: kPrimaryPurple,size: 16,)
                                              ],
                                            )),
                                      );
                                    },
                                  ),
                                ),
                              ),
                      )
                    ],
                  ),
                  size10,
                  GestureDetector(
                    onTap: () async {
                      // await keywordController.fetchKeyword();
                      openKeywordDialog(context);
                    },
                    child: Row(
                      children: [
                        textUbuntu("Select Keywords  ", kPrimaryPurple, fontWeight: weight500, fontSize: 16),
                        Icon(
                          Icons.arrow_drop_down_circle,
                          color: kPrimaryPurple,
                          size: 19,
                        )
                      ],
                    ),
                  ),
                  size10,
                  Obx(() => keywordController.keywordList.length == 0
                      ? Container(
                          child: Center(
                            child: textUbuntu("No keywords selected", kPrimaryPurple),
                          ),
                        )
                      : Container(
                          height: 30,
                          width: size.width,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: keywordController.keywordList.length,
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
                                  child: textUbuntu(keywordController.keywordList[index], kWhiteColor,
                                      fontSize: 14.0, fontWeight: FontWeight.w500),
                                ),
                              );
                            },
                          ),
                        )),
                  size20,
                  WelcomeScreenButton(
                    height: 45,
                    isIcon: false,
                    buttonColor: kPrimaryPurple,
                    buttonText: "Complete Registration",
                    textColor: kWhiteColor,
                    borderRadiusGeometry: BorderRadius.circular(15),
                    edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
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
