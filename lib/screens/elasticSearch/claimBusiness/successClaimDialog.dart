import 'package:flutter/material.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/screens/welcomeScreen/welcomeButtonWidget.dart';
import 'package:johukum/widgets/textWidgets.dart';
import 'package:get/get.dart';

class SuccessClaimDialog extends StatelessWidget {


  final Size size;
  String mobileNumber;



  SuccessClaimDialog({this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height/4,
      width: size.width,
      child: Column(
        crossAxisAlignment: crossAxisAlignmentCenter,
        mainAxisAlignment: mainAxisAlignmentCenter,
        children: [
          Row(
            mainAxisAlignment: mainAxisAlignmentCenter,
            children: [
              Icon(Icons.check_circle,size: 17.0,),
              textUbuntu(" Success", kPrimaryPurple,
                  fontSize: 18.0, fontWeight: weight500),
            ],
          ),
          size20,
          Container(
            height: 70.0,
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            decoration: containerBoxDecoration(
              color: kPrimaryPurple,
              borderRadius: 8.0
            ),
            child: Center(
              child: Text("You habe now full access in your businees. You can edit or change anything from your "
                  "business profile",style: textStyleUbuntu(
                color: Colors.white,
              ),textAlign: TextAlign.center,),
            ),
          ),

          size10,

          WelcomeScreenButton(
            height: 40,
            borderRadiusGeometry: BorderRadius.circular(10.0),
            buttonText: "Back To Business",
            textColor: kWhiteColor,
            fontSize: 16.0,
            edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 10.0),
            buttonColor: kPrimaryPurple,
            isIcon: false,
            callback: () {
              Navigator.of(context).pop();
            },

          ),
          size10,

        ],
      ),
    );
  }
}
