import 'package:flutter/material.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/screens/addBusiness/stepOneScreen.dart';
import 'package:johukum/screens/welcomeScreen/welcomeButtonWidget.dart';
import 'package:johukum/widgets/addBusinessForm.dart';
import 'package:johukum/widgets/textWidgets.dart';

class StepSevenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildBusinessInfoBar("Step 7"),
      body: Container(
        height: size.height,
        child: Responsive(
          mobile: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textUbuntu("Title for SEO", kPrimaryPurple, fontSize: 16.0, fontWeight: weight500),
                  size5,
                  AddBusinessForm(
                    hintText: "write title",
                    isSuffix: false,
                  ),
                  size10,
                  textUbuntu("Meta Description", kPrimaryPurple, fontWeight: weight500, fontSize: 16),
                  size5,
                  AddBusinessForm(
                    textInputType: TextInputType.emailAddress,
                    hintText: "write description",
                    //height: 40.0,
                    maxLine: 6,
                    isSuffix: false,
                  ),
                  size10,

                  GestureDetector(
                    onTap: (){},
                    child: Row(
                      children: [
                        textUbuntu("Select Tag  ", kPrimaryPurple, fontWeight: weight500, fontSize: 16),
                        Icon(Icons.arrow_drop_down_circle,color: kPrimaryPurple,size: 19,)
                      ],
                    ),
                  ),

                  size10,

                  GestureDetector(
                    onTap: (){},
                    child: Row(
                      children: [
                        textUbuntu("Select Keywords  ", kPrimaryPurple, fontWeight: weight500, fontSize: 16),
                        Icon(Icons.arrow_drop_down_circle,color: kPrimaryPurple,size: 19,)
                      ],
                    ),
                  ),

                  size20,

                  WelcomeScreenButton(
                    height: 45,
                    isIcon: false,
                    buttonColor: kPrimaryPurple,
                    buttonText: "Complete Registration",
                    textColor: kWhiteColor,
                    borderRadiusGeometry: BorderRadius.circular(15),
                    edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 60,vertical: 20),
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
