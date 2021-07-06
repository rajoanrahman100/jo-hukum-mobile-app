
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/controller/reportBusinessController.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/screens/welcomeScreen/welcomeButtonWidget.dart';
import 'package:johukum/widgets/addBusinessForm.dart';
import 'package:johukum/widgets/customToast.dart';
import 'package:johukum/widgets/fullScreenAlertForAuth.dart';
import 'package:johukum/widgets/textWidgets.dart';




class BusinessReport extends StatelessWidget {


  var businessID;

  BusinessReport({this.businessID});

  var issues=["Business Name is not right","Phone Number is wrong","Business doesn't exist in the location",
  "The business is closed down","Report abuse"];

  var infoController=TextEditingController();

  var c=Get.put(ReportBusinessController());

  @override
  Widget build(BuildContext context) {

    print(businessID);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryPurple,
        elevation: 0.0,
        title: Text(
          "Report Business",
          style: textStyleUbuntu(color: kWhiteColor, fontSize: 18.0, fontWeight: FontWeight.w500),
        ),
      ),
      body: Responsive(
        mobile: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 15.0),
          child: Column(
            crossAxisAlignment: crossAxisAlignmentStart,
            children: [
              textUbuntu("Report Issues:", kPrimaryPurple,fontSize: 16.0,fontWeight: FontWeight.w500),
              size10,
              GestureDetector(
                onTap: (){
                  c.changeShowStatus();
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: kPrimaryPurple.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                       Expanded(child: Obx(()=>textUbuntu(c.issueValue.value, kBlackColor))),
                        Icon(Icons.arrow_drop_down_circle)
                      ],
                    ),
                  ),
                ),
              ),

              size20,

              Obx(()=>c.show.value==true?Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        IssueWidget(issue: "Business Name is not right",
                          callback: (){
                          c.changeIssueValue("Business Name is not right",0);
                          c.changeShowStatus();
                        },),
                        IssueWidget(issue: "Phone Number is wrong",callback: (){
                          c.changeIssueValue("Phone Number is wrong",1);
                          c.changeShowStatus();
                        },),

                      ],
                    ),
                    size10,
                    Row(
                      children: [
                        IssueWidget(issue: "Report Abuse",callback: (){
                          c.changeIssueValue("Report Abuse",2);
                          c.changeShowStatus();
                        },),
                        IssueWidget(issue: "The business is closed down",callback: (){
                          c.changeIssueValue("The business is closed down",3);
                          c.changeShowStatus();
                        },),

                      ],
                    ),
                    size10,
                    Row(
                      children: [
                        IssueWidget(issue: "Business doesn't exist in the location",callback: (){
                          c.changeIssueValue("Business doesn't exist in the location",4);
                          c.changeShowStatus();
                        },),

                      ],
                    )
                  ],
                ),

              ):Container()),


              size20,

              textUbuntu("Additioal Info:", kPrimaryPurple,fontSize: 16.0,fontWeight: FontWeight.w500),
              size10,
              AddBusinessForm(
                controller: infoController,
                textInputType: TextInputType.text,
                hintText: "additioal info",
                isSuffix: false,
                maxLine: 6,
              ),

              size20,

              boxStorage.read(KEY_TOKEN)!=null?WelcomeScreenButton(
                height: 50,
                borderRadiusGeometry: BorderRadius.circular(10.0),
                edgeInsetsGeometry: EdgeInsets.symmetric(vertical: 10.0),
                buttonText: "Submit",
                buttonColor: kPrimaryPurple,
                textColor: kWhiteColor,
                isIcon: false,
                callback: (){
                  c.submitReport(c.selectValue.value, infoController.text, businessID,context);
                },
              ):WelcomeScreenButton(
                height: 50,
                borderRadiusGeometry: BorderRadius.circular(10.0),
                edgeInsetsGeometry: EdgeInsets.symmetric(vertical: 10.0),
                buttonText: "Submit",
                buttonColor: kPrimaryPurple,
                textColor: kWhiteColor,
                isIcon: false,
                callback: (){
                  showSnackBar(context: context, message: "You need to log in first",callBack: (){});
                },
              ),




            ],
          ),
        ),
        tablet: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 15.0),
          child: Column(
            crossAxisAlignment: crossAxisAlignmentStart,
            children: [
              textUbuntu("Report Issues:", kPrimaryPurple,fontSize: 18.0,fontWeight: FontWeight.w500),
              size10,
              GestureDetector(
                onTap: (){
                  c.changeShowStatus();
                },
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                      color: kPrimaryPurple.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        Expanded(child: Obx(()=>textUbuntu(c.issueValue.value, kBlackColor,fontSize: 18.0))),
                        Icon(Icons.arrow_drop_down_circle,size: 25.0,)
                      ],
                    ),
                  ),
                ),
              ),

              size20,

              Obx(()=>c.show.value==true?Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        IssueWidget(issue: "Business Name is not right",
                          callback: (){
                            c.changeIssueValue("Business Name is not right",0);
                            c.changeShowStatus();
                          },),
                        IssueWidget(issue: "Phone Number is wrong",callback: (){
                          c.changeIssueValue("Phone Number is wrong",1);
                          c.changeShowStatus();
                        },),

                      ],
                    ),
                    size10,
                    Row(
                      children: [
                        IssueWidget(issue: "Report Abuse",callback: (){
                          c.changeIssueValue("Report Abuse",2);
                          c.changeShowStatus();
                        },),
                        IssueWidget(issue: "The business is closed down",callback: (){
                          c.changeIssueValue("The business is closed down",3);
                          c.changeShowStatus();
                        },),

                      ],
                    ),
                    size10,
                    Row(
                      children: [
                        IssueWidget(issue: "Business doesn't exist in the location",callback: (){
                          c.changeIssueValue("Business doesn't exist in the location",4);
                          c.changeShowStatus();
                        },),

                      ],
                    )
                  ],
                ),

              ):Container()),


              size20,

              textUbuntu("Additioal Info:", kPrimaryPurple,fontSize: 18.0,fontWeight: FontWeight.w500),
              size10,
              AddBusinessForm(
                controller: infoController,
                textInputType: TextInputType.text,
                hintText: "additioal info",
                isSuffix: false,
                maxLine: 6,
              ),

              size20,

              WelcomeScreenButton(
                height: 60,
                borderRadiusGeometry: BorderRadius.circular(10.0),
                edgeInsetsGeometry: EdgeInsets.symmetric(vertical: 10.0),
                buttonText: "Submit",
                buttonColor: kPrimaryPurple,
                textColor: kWhiteColor,
                isIcon: false,
                callback: (){
                  c.submitReport(c.selectValue.value, infoController.text, businessID,context);
                },
              ),




            ],
          ),
        ),
      ),
    );
  }
}

class IssueWidget extends StatelessWidget {

  var issue;
  VoidCallback callback;
  Color backColor;

  IssueWidget({this.issue,this.callback,this.backColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: callback,
        child: Container(
          height:35,
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          decoration:BoxDecoration(
            color: backColor??kPrimaryPurple,
            borderRadius: BorderRadius.circular(10.0)
          ),
          child: Center(child: textUbuntu(issue, kWhiteColor)),
        ),
      ),
    );
  }
}


void openBusinessReportDialog(BuildContext context,businessID) {
  Navigator.of(context).push(new MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return BusinessReport(businessID: businessID,);
      },
      fullscreenDialog: true));
}