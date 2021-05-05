import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/controller/businessDataController.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/screens/addBusiness/stepOneScreen.dart';
import 'package:johukum/widgets/addBusinessForm.dart';
import 'package:johukum/widgets/textWidgets.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:intl/intl.dart';

class StepFourScreen extends StatelessWidget {

  var annualTurnOverList=["N/A","1-500000","500001-1000000","1000001-5000000","5000001-20000000","20000001-5000000000"];
  var employeeList=["1-5","6-20","21-50","51-100","101-50","500+"];
  var asscList=["DCC"];
  var certificateList=["DMC"];
  var businessTypeList=["Grocery","Health Care","Electrical","Stationary"];

  var dataController=Get.put(BusinessDataController());

  var descController=TextEditingController();

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
                  Container(
                    height: 50.0,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(color: kPrimaryPurple.withOpacity(0.2), borderRadius: BorderRadius.circular(10.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(()=>textUbuntu(dataController.selectYear.value, kBlackColor.withOpacity(0.6), fontSize:
                        14),),
                        GestureDetector(
                          onTap: (){
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Select Year"),
                                  content: Container( // Need to use container to add size constraint.
                                    width: 300,
                                    height: 300,
                                    child: YearPicker(
                                      firstDate: DateTime(DateTime.now().year - 100, 1),
                                      lastDate: DateTime(DateTime.now().year + 100, 1),
                                      initialDate: DateTime.now(),
                                      // save the selected date to _selectedDate DateTime variable.
                                      // It's used to set the previous selected date when
                                      // re-showing the dialog.
                                      selectedDate: DateTime.now(),
                                      onChanged: (DateTime dateTime) {
                                        // close the dialog when year is selected.
                                        var year=DateFormat.y().format(dateTime).toString();
                                        print(year);

                                        dataController.setSelectedYear(year);
                                        Navigator.pop(context);

                                        // Do something with the dateTime selected.
                                        // Remember that you need to use dateTime.year to get the year
                                      },
                                    ),
                                  ),
                                );
                              },
                            );
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
                    controller: descController,
                    textInputType: TextInputType.text,
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
                    onTap: (){
                      boxStorage.write(YEAR_ESTABLISH, dataController.selectYear.value);
                      boxStorage.write(ANNUAL_TURNOVER, dataController.annualTurnOver.value);
                      boxStorage.write(NUMBER_OF_EMPLOYEE, dataController.numberOfEmployee.value);
                      boxStorage.write(PROFESSIONAL_ASSOC, dataController.professAssc.value);
                      boxStorage.write(CERTIFICATION, dataController.certificate.value);
                      boxStorage.write(DESCRIPTION, descController.text);
                      boxStorage.write(TYPE_OF_BUSINESS, dataController.selectBusinessType.value);
                      Navigator.pushNamed(context, '/stepFive');
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
