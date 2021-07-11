import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/controller/dashBoardController/singleBusinessAllDataController.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/screens/addBusiness/stepOneScreen.dart';
import 'package:johukum/screens/dashboard/businessDashSetting/seoDetails/seoDetailsController.dart';
import 'package:johukum/screens/welcomeScreen/welcomeButtonWidget.dart';
import 'package:johukum/widgets/textWidgets.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SeoDetails extends StatefulWidget {
  @override
  _SeoDetailsState createState() => _SeoDetailsState();
}

class _SeoDetailsState extends State<SeoDetails> {
  var c = Get.put(SingleBusinessAllDataController());
  var seoC = Get.put(SeoController());

  @override
  void initState() {
    // TODO: implement initState

    seoC.keyWordIdList.value = c.keywordsList;
    seoC.keyWordNameList.value = c.keywordsNameList;

    print("Keywords ID ${c.keywordsList}");
    print("Keywords Name ${c.keywordsNameList}");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: buildBusinessInfoBar("SEO"),
      body: Responsive(
        mobile: Container(
          height: size.height,
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: crossAxisAlignmentStart,
              children: [
                Row(
                  mainAxisAlignment: mainAxisAlignmentBetween,
                  children: [
                    textUbuntu("Keywords", kBlackColor, fontSize: 16.0, fontWeight: weight400),
                    GestureDetector(
                        onTap: () {
                          showBarModalBottomSheet(
                              backgroundColor: kWhiteColor,
                              context: context,
                              expand: false,
                              builder: (context) => Obx(() => Container(
                                    height: size.height,
                                    child: seoC.keywordClass.value == null
                                        ? textUbuntu("loading...", kPrimaryPurple)
                                        : seoC.keywordClass.value.results.length == 0
                                            ? textUbuntu("No data found", kPrimaryPurple)
                                            : Column(
                                                children: [
                                                  size10,
                                                  textUbuntu("Select payaments methods", kPrimaryPurple,
                                                      fontWeight: weight500, fontSize: 16),
                                                  Expanded(
                                                    child: ListView.builder(
                                                      itemCount: seoC.keywordClass.value.results.length,
                                                      itemBuilder: (_, index) {
                                                        return Obx(() => CheckboxListTile(
                                                              activeColor: kPrimaryPurple,
                                                              value: seoC.keyWordNameList.contains(
                                                                  seoC.keywordClass.value.results[index].name),
                                                              onChanged: (bool selected) {
                                                                if (selected == true) {
                                                                  seoC.onSelect(selected, seoC.keywordClass.value
                                                                      .results[index].name,
                                                                      seoC.keywordClass.value.results[index].sId);
                                                                } else {

                                                                  seoC.onRemove(selected, seoC.keywordClass.value
                                                                      .results[index].name,
                                                                      seoC.keywordClass.value.results[index].sId);
                                                                }
                                                              },
                                                              title: Container(
                                                                height: 20.0,
                                                                margin: EdgeInsets.only(
                                                                    top: 10.0, left: 10, right: 10, bottom: 5.0),
                                                                child: Row(
                                                                  children: <Widget>[
                                                                    textUbuntu(
                                                                        seoC.keywordClass.value.results[index].name,
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
                                                      height: 45,
                                                      edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 10.0,
                                                          vertical: 15.0),
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
                        },
                        child: textUbuntu("add/remove", kBlackColor, fontSize: 16.0, fontWeight: weight500)),
                  ],
                ),
                size10,
                Obx(
                  () => Container(
                    height: size.height / 4,
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    decoration: containerBoxDecoration(color: kPrimaryPurple.withOpacity(0.2), borderRadius: 5.0),
                    child: GridView.builder(
                      itemCount: seoC.keyWordNameList.length,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 140, childAspectRatio: 8 / 2.5, crossAxisSpacing: 5, mainAxisSpacing: 4),
                      itemBuilder: (_, index) {
                        return Container(
                            decoration: containerBoxDecoration(color: Colors.white, borderRadius: 5.0),
                            child: Center(child: textUbuntu("${seoC.keyWordNameList[index]}", kPrimaryPurple)));
                      },
                    ),
                  ),
                ),
                size20,
                WelcomeScreenButton(
                    height: 45,
                    //edgeInsetsGeometry:
                   // EdgeInsets.symmetric(horizontal: 120, vertical: 15.0),
                    borderRadiusGeometry: BorderRadius.circular(10.0),
                    textColor: kWhiteColor,
                    buttonText: "Save",
                    buttonColor: kPrimaryPurple,
                    isIcon: false,
                    callback: () {
                      seoC. updateBusinessData(context, boxStorage.read(MY_BUSINESS_ID), seoC.keyWordIdList);
                     // seoC.updateBusinessData(context, singleId, keywordID)
                     // Navigator.of(context).pop();
                    })
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
                Row(
                  mainAxisAlignment: mainAxisAlignmentBetween,
                  children: [
                    textUbuntu("Keywords", kBlackColor, fontSize: 18.0, fontWeight: weight400),
                    GestureDetector(
                        onTap: () {
                          showBarModalBottomSheet(
                              backgroundColor: kWhiteColor,
                              context: context,
                              expand: false,
                              builder: (context) => Obx(() => Container(
                                height: size.height,
                                child: seoC.keywordClass.value == null
                                    ? textUbuntu("loading...", kPrimaryPurple)
                                    : seoC.keywordClass.value.results.length == 0
                                    ? textUbuntu("No data found", kPrimaryPurple)
                                    : Column(
                                  children: [
                                    size10,
                                    textUbuntu("Select payaments methods", kPrimaryPurple,
                                        fontWeight: weight500, fontSize: 16),
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount: seoC.keywordClass.value.results.length,
                                        itemBuilder: (_, index) {
                                          return Obx(() => CheckboxListTile(
                                            activeColor: kPrimaryPurple,
                                            value: seoC.keyWordNameList.contains(
                                                seoC.keywordClass.value.results[index].name),
                                            onChanged: (bool selected) {
                                              if (selected == true) {
                                                seoC.onSelect(selected, seoC.keywordClass.value
                                                    .results[index].name,
                                                    seoC.keywordClass.value.results[index].sId);
                                              } else {

                                                seoC.onRemove(selected, seoC.keywordClass.value
                                                    .results[index].name,
                                                    seoC.keywordClass.value.results[index].sId);
                                              }
                                            },
                                            title: Container(
                                              height: 20.0,
                                              margin: EdgeInsets.only(
                                                  top: 10.0, left: 10, right: 10, bottom: 5.0),
                                              child: Row(
                                                children: <Widget>[
                                                  textUbuntu(
                                                      seoC.keywordClass.value.results[index].name,
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
                                        height: 45,
                                        edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 10.0,
                                            vertical: 15.0),
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
                        },
                        child: textUbuntu("add/remove", kBlackColor, fontSize: 16.0, fontWeight: weight500)),
                  ],
                ),
                size10,
                Obx(
                      () => Container(
                    height: size.height / 4,
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    decoration: containerBoxDecoration(color: kPrimaryPurple.withOpacity(0.2), borderRadius: 5.0),
                    child: GridView.builder(
                      itemCount: seoC.keyWordNameList.length,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 140, childAspectRatio: 8 / 2.5, crossAxisSpacing: 5, mainAxisSpacing: 4),
                      itemBuilder: (_, index) {
                        return Container(
                            decoration: containerBoxDecoration(color: Colors.white, borderRadius: 5.0),
                            child: Center(child: textUbuntu("${seoC.keyWordNameList[index]}", kPrimaryPurple)));
                      },
                    ),
                  ),
                ),
                size20,
                WelcomeScreenButton(
                    height: 50,
                    //edgeInsetsGeometry:
                    // EdgeInsets.symmetric(horizontal: 120, vertical: 15.0),
                    borderRadiusGeometry: BorderRadius.circular(10.0),
                    textColor: kWhiteColor,
                    buttonText: "Save",
                    buttonColor: kPrimaryPurple,
                    isIcon: false,
                    callback: () {
                      seoC. updateBusinessData(context, boxStorage.read(MY_BUSINESS_ID), seoC.keyWordIdList);
                      // seoC.updateBusinessData(context, singleId, keywordID)
                      // Navigator.of(context).pop();
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
