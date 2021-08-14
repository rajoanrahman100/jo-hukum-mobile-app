import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/controller/addBusinessController.dart';
import 'package:johukum/controller/businessTagController.dart';
import 'package:johukum/controller/imageController.dart';
import 'package:johukum/controller/keywordController.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/screens/addBusiness/stepOneScreen.dart';
import 'package:johukum/screens/fullScreenAlertDialog/fullScreenKeyword.dart';
import 'package:johukum/screens/welcomeScreen/welcomeButtonWidget.dart';
import 'package:johukum/widgets/addBusinessForm.dart';
import 'package:johukum/widgets/customToast.dart';
import 'package:johukum/widgets/textWidgets.dart';

import 'uploadMultipleImage.dart';

class StepSevenScreen extends StatefulWidget {
  @override
  _StepSevenScreenState createState() => _StepSevenScreenState();
}

class _StepSevenScreenState extends State<StepSevenScreen> {
  var keywordController = Get.put(KeywordController());

  var tagController = Get.put(BusinessTagController());

  var businessController = Get.put(AddBusinessController());

  var imageController=Get.put(ImageController());

  var titleSeo=TextEditingController();

  var metaDesc=TextEditingController();

  var tag = TextEditingController();

  var up=UploadMultipleImage();

  var taglist=["Test Tag1,Test Tag2,Test Tag3"];


  @override
  void initState() {
    // TODO: implement initState
    titleSeo.text=boxStorage.read(KEY_USER_BUSINESS_NAME);
  }

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
                    controller: titleSeo,
                    hintText: "",
                    isSuffix: false,
                    onSave: (String value){
                      titleSeo.text=value;
                    },
                  ),
                  size10,
                  textUbuntu("Meta Description", kPrimaryPurple, fontWeight: weight500, fontSize: 16),
                  size5,
                  AddBusinessForm(
                    controller: metaDesc,
                    textInputType: TextInputType.text,
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
                      ),
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
                      boxStorage.write(SEO_TITLE, titleSeo.text??"seo title");
                      boxStorage.write(META_DESCRIPTION, metaDesc.text??"meta description");
                      boxStorage.write(TAG_LIST, tagController.tagList??taglist);

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
                    callback: ()async{

                      if(keywordController.keywordList.length==0){
                        return showErrorToast("At least one keyword is required");
                      }else{

                        await businessController.addBusinessData(context,imageController.selectLogoImagePath.value,
                            imageController.selectCoverImagePath.value,imageController.idArray);
                        ///Business Info

                      }

                      //saveData(titleSeo,metaDesc,tagController.tagList,keywordController.keywordList);

                    },
                    borderRadiusGeometry: BorderRadius.circular(15),
                    edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  ),
                ],
              ),
            ),
          ),
          tablet: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textUbuntu("Title for SEO", kPrimaryPurple, fontSize: 16.0, fontWeight: weight500),
                  size5,
                  AddBusinessForm(
                    controller: titleSeo,
                    hintText: "",
                    isSuffix: false,
                  ),
                  size10,
                  textUbuntu("Meta Description", kPrimaryPurple, fontWeight: weight500, fontSize: 16),
                  size5,
                  AddBusinessForm(
                    controller: metaDesc,
                    textInputType: TextInputType.text,
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
                          if(tag.text.isEmpty){
                            showToast("Insert your Tag");
                            return;
                          }else{
                            tagController.addTagList(tag.text);
                            tag.clear();
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
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(height: 30, child: Center(child: textUbuntu("Tags: ", kPrimaryPurple, fontWeight: weight500))),
                      Obx(() => tagController.tagList.length == 0
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
                                          weight500,fontSize: 18),
                                          SizedBox(width: 2,),
                                          Icon(Icons.cancel,color: kPrimaryPurple,size: 18.0,)
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
                      boxStorage.write(SEO_TITLE, titleSeo.text??"seo title");
                      boxStorage.write(META_DESCRIPTION, metaDesc.text??"meta description");
                      boxStorage.write(TAG_LIST, tagController.tagList??taglist);

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
                    height: 60,
                    isIcon: false,
                    buttonColor: kPrimaryPurple,
                    buttonText: "Complete Registration",
                    textColor: kWhiteColor,
                    callback: ()async{

                      if(keywordController.keywordList.length==0){
                        return showErrorToast("At least one keyword is required");
                      }else{
                        /*await businessController.addBusinessData(context,imageController.selectLogoImagePath.value,
                            imageController.selectCoverImagePath.value);*/
                      }

                      //saveData(titleSeo,metaDesc,tagController.tagList,keywordController.keywordList);

                    },
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

 Future<void> saveData(title,metaDesc,tagList,keywordList){
    boxStorage.write(SEO_TITLE, title);
    boxStorage.write(META_DESCRIPTION, metaDesc);
    boxStorage.write(TAG_LIST, tagList);
    boxStorage.write(KEYWORDS, keywordList);
  }
}
