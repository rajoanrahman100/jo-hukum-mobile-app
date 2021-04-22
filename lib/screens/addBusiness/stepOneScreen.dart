import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/controller/divisionController.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/screens/welcomeScreen/welcomeButtonWidget.dart';
import 'package:johukum/widgets/addBusinessForm.dart';
import 'package:johukum/widgets/textWidgets.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class StepOneScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  var divisionController = Get.put(DivisionController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: buildBusinessInfoBar("Step 1/10"),
      body: Container(
        height: size.height,
        child: Responsive(
          mobile: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WelcomeScreenButton(
                      height: 50,
                      borderRadiusGeometry: BorderRadius.circular(10.0),
                      edgeInsetsGeometry: EdgeInsets.symmetric(vertical: 10.0),
                      buttonText: "Fillup Business Info",
                      buttonColor: kPrimaryPurple,
                      textColor: kWhiteColor,
                      isIcon: false,
                    ),
                    textUbuntu("Business Name*", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                    AddBusinessForm(
                      isSuffix: false,
                      hintText: "business name",
                      validator: (value) {
                        if (value.isEmpty) {
                          return "This Field is required";
                        }
                        _formKey.currentState.save();
                        return null;
                      },
                    ),
                    size10,
                    textUbuntu("Street Address", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                    AddBusinessForm(
                      hintText: "street address",
                      isSuffix: false,
                    ),
                    size10,
                    textUbuntu("Land Mark", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                    AddBusinessForm(
                      hintText: "land mark",
                      isSuffix: false,
                    ),
                    size10,
                    textUbuntu("Building", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                    AddBusinessForm(
                      hintText: "building",
                      isSuffix: false,
                    ),
                    size10,
                    textUbuntu("Division", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                    size5,
                    Container(
                      height: 50.0,
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                          color: kPrimaryPurple.withOpacity(0.2), borderRadius: BorderRadius.circular(10.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         Obx(()=>textUbuntu(divisionController.selectDivision.value, kBlackColor.withOpacity(0.6),
                             fontSize: 16)),
                          GestureDetector(
                              onTap: () {
                                showBarModalBottomSheet(
                                    backgroundColor: kWhiteColor,
                                    context: context,
                                    expand: false,
                                    builder: (context) =>Obx(()=>Container(
                                      height: 600.0,
                                      child: divisionController.divisionModelClass.value == null
                                          ? textUbuntu("loading...", kPrimaryPurple)
                                          : divisionController.divisionModelClass.value.results.length == 0
                                          ? textUbuntu("No data found", kPrimaryPurple)
                                          : ListView.builder(
                                        itemCount: divisionController.divisionModelClass.value.results.length,
                                        itemBuilder: (_, index) {
                                          return ListTile(
                                            onTap: (){
                                              divisionController.setDivisionID(divisionController.divisionModelClass
                                                  .value.results[index].sId);
                                              divisionController.setDivision(divisionController.divisionModelClass
                                                  .value.results[index].name);
                                              Navigator.of(context).pop();
                                            },
                                            leading: Icon(Icons.map,color: kPrimaryPurple,),
                                            title: textUbuntu(
                                                divisionController
                                                    .divisionModelClass.value.results[index].name,
                                                kPrimaryPurple,fontSize: 16,fontWeight: weight500),
                                          );
                                        },
                                      ),
                                    )) );
                              }, child: Icon(Icons.arrow_drop_down_circle, color: kPrimaryPurple))
                        ],
                      ),
                    ),
                    size10,
                    textUbuntu("City*", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                    size5,
                    Container(
                      height: 50.0,
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                          color: kPrimaryPurple.withOpacity(0.2), borderRadius: BorderRadius.circular(10.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(()=>textUbuntu(divisionController.selectCity.value, kBlackColor.withOpacity(0.6),
                              fontSize: 16)),
                          GestureDetector(
                              onTap: () async{
                                await divisionController.fetchCity(divisionController.selectDivisionId.value, "");

                                showBarModalBottomSheet(
                                    backgroundColor: kWhiteColor,
                                    context: context,
                                    expand: false,
                                    builder: (context) =>Obx(()=>Container(
                                      height: 600.0,
                                      child: divisionController.cityModelClass.value == null
                                          ? textUbuntu("loading...", kPrimaryPurple)
                                          : divisionController.cityModelClass.value.results.length == 0
                                          ? textUbuntu("No data found", kPrimaryPurple)
                                          : ListView.builder(
                                        itemCount: divisionController.cityModelClass.value.results.length,
                                        itemBuilder: (_, index) {
                                          return ListTile(
                                            onTap: (){
                                              divisionController.setCity(divisionController.cityModelClass
                                                  .value.results[index].name);
                                              divisionController.setCityID(divisionController.cityModelClass
                                                  .value.results[index].sId);
                                              Navigator.of(context).pop();
                                            },
                                            leading: Icon(Icons.location_city_rounded,color: kPrimaryPurple,),

                                            title: textUbuntu(
                                                divisionController
                                                    .cityModelClass.value.results[index].name,
                                                kPrimaryPurple,fontSize: 16,fontWeight: weight500),
                                          );
                                        },
                                      ),
                                    )) );
                              }, child: Icon(Icons.arrow_drop_down_circle, color: kPrimaryPurple))
                        ],
                      ),
                    ),
                    size10,
                    textUbuntu("Thana*", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                    size5,
                    Container(
                      height: 50.0,
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                          color: kPrimaryPurple.withOpacity(0.2), borderRadius: BorderRadius.circular(10.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(()=>textUbuntu(divisionController.selectThana.value, kBlackColor.withOpacity(0.6),
                              fontSize: 16)),
                          GestureDetector(
                              onTap: () async{
                                await divisionController.fetchThana(divisionController.selectCityId.value, "");

                                showBarModalBottomSheet(
                                    backgroundColor: kWhiteColor,
                                    context: context,
                                    expand: false,
                                    builder: (context) =>Obx(()=>Container(
                                      height: 600.0,
                                      child: divisionController.thanaModelClass.value == null
                                          ? textUbuntu("loading...", kPrimaryPurple)
                                          : divisionController.thanaModelClass.value.results.length == 0
                                          ? textUbuntu("No data found", kPrimaryPurple)
                                          : ListView.builder(
                                        itemCount: divisionController.thanaModelClass.value.results.length,
                                        itemBuilder: (_, index) {
                                          return ListTile(
                                            onTap: (){
                                              divisionController.setThana(divisionController.thanaModelClass
                                                  .value.results[index].name);
                                              Navigator.of(context).pop();
                                            },
                                            leading: Icon(Icons.location_city_rounded,color: kPrimaryPurple,),

                                            title: textUbuntu(
                                                divisionController
                                                    .thanaModelClass.value.results[index].name,
                                                kPrimaryPurple,fontSize: 16,fontWeight: weight500),
                                          );
                                        },
                                      ),
                                    )) );
                              }, child: Icon(Icons.arrow_drop_down_circle, color: kPrimaryPurple))
                        ],
                      ),
                    ),
                    size10,
                    textUbuntu("Postal Code*", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                    AddBusinessForm(
                      hintText: "postal code",
                      isSuffix: false,
                    ),
                    size10,
                    textUbuntu("Area", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                    AddBusinessForm(
                      hintText: "area",
                      isSuffix: false,
                    ),
                    size10,
                    textUbuntu("Plus Code*", kBlackColor, fontSize: 16.0, fontWeight: weight500),
                    AddBusinessForm(
                      hintText: "plus code",
                      isSuffix: false,
                    ),
                    size10,
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/stepTwo'),
                      child: Row(
                        children: [
                          Expanded(child: Container()),
                          textUbuntu("Go To Step 2 ", kPrimaryPurple, fontWeight: weightBold, fontSize: 18.0),
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
            ),
          ),
        ),
      ),
    );
  }
}

//


AppBar buildBusinessInfoBar(String title) {
  return AppBar(
    backgroundColor: kPrimaryPurple,
    title: textUbuntu(title, kWhiteColor, fontWeight: weight500),
    iconTheme: IconThemeData(color: kWhiteColor),
  );
}
