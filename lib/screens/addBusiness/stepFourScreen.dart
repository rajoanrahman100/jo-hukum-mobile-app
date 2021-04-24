import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/controller/businessDataController.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/screens/addBusiness/stepOneScreen.dart';
import 'package:johukum/widgets/addBusinessForm.dart';
import 'package:johukum/widgets/textWidgets.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class StepFourScreen extends StatelessWidget {

  var annualTurnOverList=["N/A","1-500000","500001-1000000","1000001-5000000","5000001-20000000","20000001-5000000000"];
  var employeeList=["1-5","6-20","21-50","51-100","101-50","500+"];
  var asscList=["DCC"];
  var certificateList=["DMC"];
  var businessTypeList=["Grocery","Health Care","Electrical","Stationary"];

  var dataController=Get.put(BusinessDataController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: buildBusinessInfoBar("Step 4/10"),
      body: Container(
        height: size.height,
        child: Responsive(
          mobile: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textUbuntu("Years of Establishment", kPrimaryPurple, fontWeight: weight500, fontSize: 16),
                  size5,
                  ContainerIconWidget(
                    text: "Select",
                    callBack: (){},
                  ),
                  size10,
                  textUbuntu("Annual Turnover", kPrimaryPurple, fontWeight: weight500, fontSize: 16),
                  size5,
                  Container(
                    height: 50.0,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(color: kPrimaryPurple.withOpacity(0.2), borderRadius: BorderRadius.circular(10.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(()=>textUbuntu(dataController.annualTurnOver.value, kBlackColor.withOpacity(0.6), fontSize:
                        14),),
                        GestureDetector(
                          onTap: (){
                            showBarModalBottomSheet(
                                backgroundColor: kWhiteColor,
                                context: context,
                                expand: false,
                                builder: (context) => Container(
                                  height: size.height * 0.4,
                                  child: ListView.builder(
                                    itemCount: annualTurnOverList.length,
                                    itemBuilder:(_,index){
                                      return ListTile(
                                        onTap: (){
                                          dataController.setAnnualTurnOver(annualTurnOverList[index]);
                                          Navigator.of(context).pop();
                                        },
                                        leading: Icon(Icons.money,color: kPrimaryPurple,),
                                        title: textUbuntu(annualTurnOverList[index], kPrimaryPurple),
                                      );
                                    },
                                  ),
                                ));
                          },
                          child: Icon(
                            Icons.arrow_drop_down_circle,
                            color: kPrimaryPurple,
                          ),
                        )
                      ],
                    ),
                  ),
                  size10,
                  textUbuntu("Number of Employee", kPrimaryPurple, fontWeight: weight500, fontSize: 16),
                  size5,
                  Container(
                    height: 50.0,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(color: kPrimaryPurple.withOpacity(0.2), borderRadius: BorderRadius.circular(10.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(()=>textUbuntu(dataController.numberOfEmployee.value, kBlackColor.withOpacity(0.6), fontSize:
                        14),),
                        GestureDetector(
                          onTap: (){
                            showBarModalBottomSheet(
                                backgroundColor: kWhiteColor,
                                context: context,
                                expand: false,
                                builder: (context) => Container(
                                  height: size.height * 0.4,
                                  child: ListView.builder(
                                    itemCount: employeeList.length,
                                    itemBuilder:(_,index){
                                      return ListTile(
                                        onTap: (){
                                          dataController.setEmployeeNumber(employeeList[index]);
                                          Navigator.of(context).pop();
                                        },
                                        leading: Icon(Icons.people,color: kPrimaryPurple,),
                                        title: textUbuntu(employeeList[index], kPrimaryPurple),
                                      );
                                    },
                                  ),
                                ));
                          },
                          child: Icon(
                            Icons.arrow_drop_down_circle,
                            color: kPrimaryPurple,
                          ),
                        )
                      ],
                    ),
                  ),
                  size10,
                  textUbuntu("Professional Association", kPrimaryPurple, fontWeight: weight500, fontSize: 16),
                  size5,
                  Container(
                    height: 50.0,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(color: kPrimaryPurple.withOpacity(0.2), borderRadius: BorderRadius.circular(10.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(()=>textUbuntu(dataController.professAssc.value, kBlackColor.withOpacity(0.6), fontSize:
                        14),),
                        GestureDetector(
                          onTap: (){
                            showBarModalBottomSheet(
                                backgroundColor: kWhiteColor,
                                context: context,
                                expand: false,
                                builder: (context) => Container(
                                  height: size.height * 0.2,
                                  child: ListView.builder(
                                    itemCount: asscList.length,
                                    itemBuilder:(_,index){
                                      return ListTile(
                                        onTap: (){
                                          dataController.setAssc(asscList[index]);
                                          Navigator.of(context).pop();
                                        },
                                        leading: Icon(Icons.people,color: kPrimaryPurple,),
                                        title: textUbuntu(asscList[index], kPrimaryPurple),
                                      );
                                    },
                                  ),
                                ));
                          },
                          child: Icon(
                            Icons.arrow_drop_down_circle,
                            color: kPrimaryPurple,
                          ),
                        )
                      ],
                    ),
                  ),
                  size10,
                  textUbuntu("Certifications", kPrimaryPurple, fontWeight: weight500, fontSize: 16),
                  size5,
                  Container(
                    height: 50.0,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(color: kPrimaryPurple.withOpacity(0.2), borderRadius: BorderRadius.circular(10.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(()=>textUbuntu(dataController.certificate.value, kBlackColor.withOpacity(0.6), fontSize:
                        14),),
                        GestureDetector(
                          onTap: (){
                            showBarModalBottomSheet(
                                backgroundColor: kWhiteColor,
                                context: context,
                                expand: false,
                                builder: (context) => Container(
                                  height: size.height * 0.2,
                                  child: ListView.builder(
                                    itemCount: certificateList.length,
                                    itemBuilder:(_,index){
                                      return ListTile(
                                        onTap: (){
                                          dataController.setCertificate(certificateList[index]);
                                          Navigator.of(context).pop();
                                        },
                                        leading: Icon(Icons.people,color: kPrimaryPurple,),
                                        title: textUbuntu(certificateList[index], kPrimaryPurple),
                                      );
                                    },
                                  ),
                                ));
                          },
                          child: Icon(
                            Icons.arrow_drop_down_circle,
                            color: kPrimaryPurple,
                          ),
                        )
                      ],
                    ),
                  ),
                  size10,
                  textUbuntu("Description", kPrimaryPurple, fontWeight: weight500, fontSize: 16),
                  size5,
                  AddBusinessForm(
                    textInputType: TextInputType.emailAddress,
                    hintText: "write something",
                    //height: 40.0,
                    maxLine: 5,
                    isSuffix: false,
                  ),
                  size10,
                  textUbuntu("Type of Business", kPrimaryPurple, fontWeight: weight500, fontSize: 16),
                  size5,
                  Container(
                    height: 50.0,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(color: kPrimaryPurple.withOpacity(0.2), borderRadius: BorderRadius.circular(10.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(()=>textUbuntu(dataController.selectBusinessType.value, kBlackColor.withOpacity(0.6), fontSize:
                        14),),
                        GestureDetector(
                          onTap: (){
                            showBarModalBottomSheet(
                                backgroundColor: kWhiteColor,
                                context: context,
                                expand: false,
                                builder: (context) => Container(
                                  height: size.height * 0.3,
                                  child: ListView.builder(
                                    itemCount: businessTypeList.length,
                                    itemBuilder:(_,index){
                                      return ListTile(
                                        onTap: (){
                                          dataController.setBusinessType(businessTypeList[index]);
                                          Navigator.of(context).pop();
                                        },
                                        leading: Icon(Icons.people,color: kPrimaryPurple,),
                                        title: textUbuntu(businessTypeList[index], kPrimaryPurple,fontWeight: weight500),
                                      );
                                    },
                                  ),
                                ));
                          },
                          child: Icon(
                            Icons.arrow_drop_down_circle,
                            color: kPrimaryPurple,
                          ),
                        ),

                      ],
                    ),
                  ),
                  size20,
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/stepFive'),
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
          ),
        ),
      ),
    );
  }
}

class ContainerIconWidget extends StatelessWidget {

  String text;

  Function callBack;

  ContainerIconWidget({this.text,this.callBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(color: kPrimaryPurple.withOpacity(0.2), borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          textUbuntu("Select", kBlackColor.withOpacity(0.6), fontSize: 14),
          GestureDetector(
            onTap: callBack,
            child: Icon(
              Icons.arrow_drop_down_circle,
              color: kPrimaryPurple,
            ),
          )
        ],
      ),
    );
  }
}
