import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/controller/divisionController.dart';
import 'package:johukum/controller/keywordController.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/screens/welcomeScreen/welcomeButtonWidget.dart';
import 'package:johukum/widgets/addBusinessForm.dart';
import 'package:johukum/widgets/textWidgets.dart';

class keywordDialog extends StatelessWidget {

  var keywordController = Get.put(KeywordController());

  var keywordIdList=[];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryPurple,
          elevation: 0.0,
          title: Text(
            "Select Keywords",
            style: textStyleUbuntu(color: kWhiteColor, fontSize: 18.0, fontWeight: FontWeight.w500),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child:  Column(
              children: [
                Obx(() =>  keywordController.keywordClass.value.results == null
                    ? Center(child: CircularProgressIndicator(backgroundColor: kPrimaryPurple,))
                    : keywordController.keywordClass.value.results.length == 0
                    ? Center(child: textUbuntu("No data found", kPrimaryPurple))
                    :
                    Expanded(
                      //height: 400,
                      child: ListView.builder(
                        itemCount: keywordController.keywordClass.value.results.length,
                        itemBuilder: (_, index) {
                          return Obx(() => CheckboxListTile(
                            activeColor: kPrimaryPurple,
                            value: keywordController.keywordList.contains(keywordController
                                .keywordClass.value.results[index].name),
                            onChanged: (bool selected) {
                              if (selected == true) {
                                keywordIdList.add(keywordController
                                    .keywordClass.value.results[index].sId);
                                keywordController.onSelect(
                                    keywordController
                                        .keywordClass.value.results[index].name,
                                    selected);
                              } else {
                                keywordController.onRemove(
                                    keywordController
                                        .keywordClass.value.results[index].name,
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
                                      keywordController
                                          .keywordClass.value.results[index].name,
                                      kPrimaryPurple,
                                      fontWeight: weight400)
                                ],
                              ),
                            ),
                          ));
                        },
                      ),
                    ),


                ),

                WelcomeScreenButton(
                    height: 40,
                    edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 70, vertical: 10.0),
                    borderRadiusGeometry: BorderRadius.circular(10.0),
                    textColor: kWhiteColor,
                    buttonText: "Submit",
                    buttonColor: kPrimaryPurple,
                    isIcon: false,
                    callback: (){
                      Navigator.of(context).pop();
                      print(keywordIdList);
                    }
                )
              ],
            ),

        ),
      ),
    );
  }
}

void openKeywordDialog(BuildContext context) {
  Navigator.of(context).push(new MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return keywordDialog();
      },
      fullscreenDialog: true));
}
