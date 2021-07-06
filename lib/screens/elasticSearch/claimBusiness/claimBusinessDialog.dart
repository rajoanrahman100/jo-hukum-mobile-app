import 'package:flutter/material.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/screens/elasticSearch/claimBusiness/claimBusinessController.dart';
import 'package:johukum/screens/elasticSearch/claimBusiness/sendOtpDialog.dart';
import 'package:johukum/screens/welcomeScreen/welcomeButtonWidget.dart';
import 'package:johukum/widgets/textWidgets.dart';
import 'package:get/get.dart';

class ClaimBusinessDialog extends StatelessWidget {


  final Size size;
  String mobileNumber;



  ClaimBusinessDialog({this.size, this.mobileNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height/4,
      width: size.width,
      child: Column(
        crossAxisAlignment: crossAxisAlignmentCenter,
        mainAxisAlignment: mainAxisAlignmentCenter,
        children: [
          textUbuntu("Verify Your Business Claim", kPrimaryPurple,
              fontSize: 18.0, fontWeight: weight500),
          size20,
          WelcomeScreenButton(
            height: 40,
            borderRadiusGeometry: BorderRadius.circular(10.0),
            buttonText: "Mobile Number Verification",
            textColor: kWhiteColor,
            fontSize: 16.0,
            edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 10.0),
            buttonColor: kPrimaryPurple,
            isIcon: false,
            callback: () {
              Navigator.of(context).pop();
              return showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: SendOtpDialog(size: size,
                          mobileNumber: mobileNumber),
                    );
                  });
            },

          ),

          /*size10,

          WelcomeScreenButton(
            height: 40,
            borderRadiusGeometry: BorderRadius.circular(10.0),
            buttonText: "Method 2: Form Submission",
            textColor: kWhiteColor,
            fontSize: 16.0,
            edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 10.0),
            buttonColor: kPrimaryPurple,
            isIcon: false,
            callback: () {
            },

          ),*/
          size10,
          Row(
            mainAxisAlignment: mainAxisAlignmentCenter,
            children: [
              Icon(Icons.check_circle,color: kPrimaryPurple,size: 15,),
              textUbuntu(" Requeste will be proceed ater verification",
                  kPrimaryPurple,
                  fontSize: 14.0, fontWeight: weight500),
            ],
          ),
        ],
      ),
    );
  }
}
