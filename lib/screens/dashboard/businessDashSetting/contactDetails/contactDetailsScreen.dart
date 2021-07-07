import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/components/settingsDataSaveConfig.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/screens/addBusiness/stepOneScreen.dart';
import 'package:johukum/screens/dashboard/businessDashSetting/contactDetails/contactDetailsController.dart';
import 'package:johukum/screens/welcomeScreen/welcomeButtonWidget.dart';
import 'package:johukum/widgets/addBusinessForm.dart';
import 'package:johukum/widgets/customToast.dart';
import 'package:johukum/widgets/textWidgets.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SettingContactDetails extends StatefulWidget {
  @override
  _SettingContactDetailsState createState() => _SettingContactDetailsState();
}

class _SettingContactDetailsState extends State<SettingContactDetails> {
  var mobileNumbers = [];

  var c = Get.put(ContactDetailsSettingController());

  var numbers=TextEditingController();
  var telePhone=TextEditingController();
  var wesbite=TextEditingController();
  var map;

  @override
  void initState() {
    // TODO: implement initState
    print(boxNewStorage.read(BUSINESS_MOBILE_NUMBERS));

    c.addedMobileNumber.value = boxNewStorage.read(BUSINESS_MOBILE_NUMBERS);
    wesbite.text = boxNewStorage.read(OWNER_WEBSITE);
    telePhone.text = boxNewStorage.read(BUSINESS_LAND_LINE);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildBusinessInfoBar("Contacts"),
      body: Responsive(
        mobile: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  textUbuntu("Website", kBlackColor, fontSize: 16.0, fontWeight: weight400),

                  AddBusinessForm(
                    controller: wesbite,
                    isSuffix: false,
                  ),
                  size10,
                  textUbuntu("Telephone Number", kBlackColor, fontSize: 16.0, fontWeight: weight400),
                  AddBusinessForm(
                    controller: telePhone,
                    isSuffix: false,
                  ),

                  size10,

                  textUbuntu("Add New Number", kBlackColor, fontSize: 16.0, fontWeight: weight400),

                  Row(
                    children: [
                      Expanded(
                        child: AddBusinessForm(
                          hintText: "add new number",
                          controller: numbers,
                          textInputType: TextInputType.number,
                          isSuffix: false,
                        ),
                      ),
                      width10,
                      GestureDetector(
                        onTap: (){
                          if(numbers.text.isEmpty){
                            showToast("insert your number");
                            return;
                          }else if(numbers.text.length!=11){
                            showToast("Mobile Number Format is not valid");
                          }else{
                            map = {"mobile_number": numbers.text};
                            c.addMoreNumbers(map);
                            //controller.mobileNumbers.add(MobileNumberModel(value:number.text));
                            //json = jsonEncode(controller.mobileNumbers);
                            numbers.clear();
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
                      )

                    ],
                  ),
                  size10,

                  textUbuntu("Added Mobile Numbers", kBlackColor, fontSize: 16.0, fontWeight: weight400),
                  Obx(
                        () => Container(
                      height: MediaQuery.of(context).size.height / 5,
                      child: GridView.builder(
                        itemCount: c.addedMobileNumber.length,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 140, childAspectRatio: 8 / 3, crossAxisSpacing: 4, mainAxisSpacing: 4),
                        itemBuilder: (_, index) {
                          return GestureDetector(
                            onTap: () {
                              c.addedMobileNumber.removeAt(index);
                            },
                            child: Row(
                              children: [
                                textUbuntu(c.addedMobileNumber[index]['mobile_number'], kPrimaryPurple,
                                    fontWeight: weight500),
                                Icon(Icons.cancel)
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  WelcomeScreenButton(
                    height: 50,
                    borderRadiusGeometry: BorderRadius.circular(10.0),
                    edgeInsetsGeometry: EdgeInsets.symmetric(vertical: 10.0),
                    buttonText: "Save",
                    buttonColor: kPrimaryPurple,
                    textColor: kWhiteColor,
                    isIcon: false,
                    callback: (){
                      print(c.addedMobileNumber);
                      c.updateBusinessData(context, boxStorage.read(MY_BUSINESS_ID), c.addedMobileNumber,telePhone.text);
                    },
                  ),

                ],
              ),
            ),
          ),
        ),
        tablet: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  textUbuntu("Website", kBlackColor, fontSize: 16.0, fontWeight: weight400),

                  AddBusinessForm(
                    controller: wesbite,
                    isSuffix: false,
                  ),
                  size10,
                  textUbuntu("Telephone Number", kBlackColor, fontSize: 16.0, fontWeight: weight400),
                  AddBusinessForm(
                    controller: telePhone,
                    isSuffix: false,
                  ),

                  size10,

                  textUbuntu("Add New Number", kBlackColor, fontSize: 16.0, fontWeight: weight400),

                  Row(
                    children: [
                      Expanded(
                        child: AddBusinessForm(
                          hintText: "add new number",
                          controller: numbers,
                          textInputType: TextInputType.number,
                          isSuffix: false,
                        ),
                      ),
                      width10,
                      GestureDetector(
                        onTap: (){
                          if(numbers.text.isEmpty){
                            showToast("insert your number");
                            return;
                          }else if(numbers.text.length!=11){
                            showToast("Mobile Number Format is not valid");
                          }else{
                            map = {"mobile_number": numbers.text};
                            c.addMoreNumbers(map);
                            //controller.mobileNumbers.add(MobileNumberModel(value:number.text));
                            //json = jsonEncode(controller.mobileNumbers);
                            numbers.clear();
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
                      )

                    ],
                  ),
                  size10,

                  textUbuntu("Added Mobile Numbers", kBlackColor, fontSize: 16.0, fontWeight: weight400),
                  Obx(
                        () => Container(
                      height: MediaQuery.of(context).size.height / 5,
                      child: GridView.builder(
                        itemCount: c.addedMobileNumber.length,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 140, childAspectRatio: 8 / 3, crossAxisSpacing: 4, mainAxisSpacing: 4),
                        itemBuilder: (_, index) {
                          return GestureDetector(
                            onTap: () {
                              c.addedMobileNumber.removeAt(index);
                            },
                            child: Row(
                              children: [
                                textUbuntu(c.addedMobileNumber[index]['mobile_number'], kPrimaryPurple,
                                    fontWeight: weight500),
                                Icon(Icons.cancel)
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  WelcomeScreenButton(
                    height: 50,
                    borderRadiusGeometry: BorderRadius.circular(10.0),
                    edgeInsetsGeometry: EdgeInsets.symmetric(vertical: 10.0),
                    buttonText: "Save",
                    buttonColor: kPrimaryPurple,
                    textColor: kWhiteColor,
                    isIcon: false,
                    callback: (){
                      print(c.addedMobileNumber);
                      c.updateBusinessData(context, boxStorage.read(MY_BUSINESS_ID), c.addedMobileNumber,telePhone.text);
                    },
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
