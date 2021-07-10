import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/screens/elasticSearch/claimBusiness/otpController.dart';
import 'package:johukum/screens/elasticSearch/claimBusiness/successClaimDialog.dart';
import 'package:johukum/screens/welcomeScreen/welcomeButtonWidget.dart';
import 'package:johukum/widgets/addBusinessForm.dart';
import 'package:johukum/widgets/customToast.dart';
import 'package:johukum/widgets/textWidgets.dart';

import 'claimBusinessController.dart';

class SendOtpDialog extends StatelessWidget {
  final Size size;
  String mobileNumber;
  var claimC = Get.put(ClaimBusinessController());
  var otpC = Get.put(OtpController());

  var codeController = TextEditingController();
  var code;

  SendOtpDialog({this.size, this.mobileNumber});

  @override
  Widget build(BuildContext context) {
    return Obx(()=>claimC.tap.value==false?Container(
      height: size.height / 6,
      width: size.width,
      child: Column(
        crossAxisAlignment: crossAxisAlignmentCenter,
        mainAxisAlignment: mainAxisAlignmentCenter,
        children: [
          textUbuntu("Do you have this number?", kPrimaryPurple, fontSize: 18.0, fontWeight: weight500),
          size10,
          textUbuntu(
              "We have found $mobileNumber in this "
                  "business",
              kPrimaryPurple,
              fontSize: 14.0,
              fontWeight: weight400),
          size10,
          WelcomeScreenButton(
            height: 40,
            borderRadiusGeometry: BorderRadius.circular(10.0),
            buttonText: "Send OTP for verification",
            textColor: kWhiteColor,
            fontSize: 16.0,
            edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 10.0),
            buttonColor: kPrimaryPurple,
            isIcon: false,
            callback: () async{
              claimC.tap.value = true;
              await otpC.getOtpNumber(mobileNumber, context);

            },
          ),
          size10,
        ],
      ),
    ):Container(
      height: size.height / 5,
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          //crossAxisAlignment: crossAxisAlignmentCenter,
          mainAxisAlignment: mainAxisAlignmentCenter,
          children: [
            textUbuntu(
                "We have send 6 digit number to $mobileNumber",
                kPrimaryPurple,
                maxLine: 2,
                fontSize: 14.0,
                fontWeight: weight500),
            size10,
            AddBusinessForm(
              hintText: "6 digit code",
              controller: codeController,

              isSuffix: false,
            ),
            size10,
            WelcomeScreenButton(
              height: 40,
              borderRadiusGeometry: BorderRadius.circular(10.0),
              buttonText: "Verify",
              textColor: kWhiteColor,
              fontSize: 16.0,
              edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 0.0),
              buttonColor: kPrimaryPurple,
              isIcon: false,
              callback: () async{

                code=await otpC.verifyOtpNumber(codeController.text, context);
                if(code==200 || code==201){
                  return showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: SuccessClaimDialog(size: size,),
                        );
                      });
                }else{
                  showToast("Invalid OTP number");
                }


              },
            ),
            size10,
          ],
        ),
      ),
    ));
  }
}
/*
Padding(
padding: const EdgeInsets.symmetric(horizontal: 10.0),
child: Column(
crossAxisAlignment: crossAxisAlignmentCenter,
mainAxisAlignment: mainAxisAlignmentCenter,
children: [
textUbuntu(
"We have send 6 digit number to ${mobileNumber.substring(0, 7)}****${mobileNumber.substring(12, 14)}"
"this number",
kPrimaryPurple,
maxLine: 2,
fontSize: 14.0,
fontWeight: weight400),
size10,
AddBusinessForm(
hintText: "6 digit code",
controller: codeController,
isSuffix: false,
),
WelcomeScreenButton(
height: 40,
borderRadiusGeometry: BorderRadius.circular(10.0),
buttonText: "Verify",
textColor: kWhiteColor,
fontSize: 16.0,
edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 10.0),
buttonColor: kPrimaryPurple,
isIcon: false,
callback: () {
//claimC.tap.value=true;
},
),
size10,
],
),
)*/
