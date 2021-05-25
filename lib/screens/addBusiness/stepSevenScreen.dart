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

class StepSevenScreen extends StatelessWidget {
  var keywordController = Get.put(KeywordController());
  var tagController = Get.put(BusinessTagController());
  var businessController = Get.put(AddBusinessController());
  var imageController=Get.put(ImageController());

  var titleSeo=TextEditingController();
  var metaDesc=TextEditingController();

  var tag = TextEditingController();

  var taglist=["Test Tag1,Test Tag2,Test Tag3"];

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
                            imageController.selectCoverImagePath.value);

                        ///Business Info
/*                        print("business name: ${boxStorage.read(KEY_USER_BUSINESS_NAME)}");
                        print("KEY_USER_STREET_ADDRESS: ${boxStorage.read(KEY_USER_STREET_ADDRESS)}");
                        print("KEY_USER_LANDMARK: ${boxStorage.read(KEY_USER_LANDMARK)}");
                        print("KEY_USER_BUILDING: ${boxStorage.read(KEY_USER_BUILDING)}");
                        print("KEY_USER_BUILDING: ${boxStorage.read(KEY_USER_BUILDING)}");
                        print("KEY_USER_THANA_ID: ${boxStorage.read(KEY_USER_THANA_ID)}");
                        print("KEY_USER_POSTAL_CODE: ${boxStorage.read(KEY_USER_POSTAL_CODE)}");
                        print("KEY_USER_PLUS_CODE: ${boxStorage.read(KEY_USER_PLUS_CODE)}");

                        print("KEY_BUSINESS_OWNER_TITLE: ${boxStorage.read(KEY_BUSINESS_OWNER_TITLE)}");
                        print("KEY_BUSINESS_OWNER_NAME: ${boxStorage.read(KEY_BUSINESS_OWNER_NAME)}");
                        print("KEY_BUSINESS_DESIGNATION: ${boxStorage.read(KEY_BUSINESS_DESIGNATION)}");
                        print("KEY_BUSINESS_DESIGNATION: ${boxStorage.read(MOBILE_ONE)}");

                        ///Business Time
                        print("SAT_START: ${boxStorage.read(SAT_START)}");
                        print("SUN_START: ${boxStorage.read(SUN_START)}");
                        print("MON_START: ${boxStorage.read(MON_START)}");
                        print("TUE_START: ${boxStorage.read(TUE_START)}");
                        print("WED_START: ${boxStorage.read(WED_START)}");
                        print("THURS_START: ${boxStorage.read(THURS_START)}");

                        print("SAT_END: ${boxStorage.read(SAT_END)}");
                        print("SUN_END: ${boxStorage.read(SUN_END)}");
                        print("MON_END: ${boxStorage.read(MON_END)}");
                        print("TUE_END: ${boxStorage.read(TUE_END)}");
                        print("WED_END: ${boxStorage.read(WED_END)}");
                        print("THURS_END: ${boxStorage.read(THURS_END)}");

                        print("PAYMENT_IDS: ${boxStorage.read(PAYMENT_ID_LIST)}");
                        print("YEAR_ESTABLISH: ${boxStorage.read(YEAR_ESTABLISH)}");
                        print("ANNUAL_TURNOVER: ${boxStorage.read(ANNUAL_TURNOVER)}");
                        print("DESCRIPTION: ${boxStorage.read(DESCRIPTION)}");
                        print("TYPE_OF_BUSINESS: ${boxStorage.read(TYPE_OF_BUSINESS)}");
                        print("KEYWORDS: ${boxStorage.read(KEYWORDS)}");*/

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
