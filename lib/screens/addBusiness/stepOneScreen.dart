
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/screens/welcomeScreen/welcomeButtonWidget.dart';
import 'package:johukum/widgets/addBusinessForm.dart';
import 'package:johukum/widgets/textWidgets.dart';

class StepOneScreen extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    Size size=MediaQuery.of(context).size;

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

                    textUbuntu("Business Name*", kBlackColor,fontSize: 16.0,fontWeight: weight500),
                    AddBusinessForm(
                      isSuffix: false,
                      hintText: "business name",
                      validator: (value){
                        if (value.isEmpty) {
                          return "This Field is required";
                        }
                        _formKey.currentState.save();
                        return null;
                      },
                    ),
                    size10,
                    textUbuntu("Street Address", kBlackColor,fontSize: 16.0,fontWeight: weight500),
                    AddBusinessForm(
                      hintText: "street address",
                      isSuffix: false,
                    ),
                    size10,
                    textUbuntu("Land Mark", kBlackColor,fontSize: 16.0,fontWeight: weight500),
                    AddBusinessForm(
                      hintText: "land mark",
                      isSuffix: false,
                    ),
                    size10,
                    textUbuntu("Building", kBlackColor,fontSize: 16.0,fontWeight: weight500),
                    AddBusinessForm(
                      hintText: "building",
                      isSuffix: false,
                    ),
                    size10,
                    textUbuntu("Division", kBlackColor,fontSize: 16.0,fontWeight: weight500),
                    AddBusinessForm(
                      hintText: "division",
                      suffixIcon: Icon(Icons.arrow_drop_down_circle,color: kPrimaryPurple,),
                      isSuffix: true,
                      validator: (value){
                        if (value.isEmpty) {
                          return "This Field is required";
                        }
                        _formKey.currentState.save();
                        return null;
                      },
                    ),
                    size10,
                    textUbuntu("City*", kBlackColor,fontSize: 16.0,fontWeight: weight500),
                    AddBusinessForm(
                      hintText: "city",
                      suffixIcon: Icon(Icons.arrow_drop_down_circle,color: kPrimaryPurple,),
                      isSuffix: true,
                      validator: (value){
                        if (value.isEmpty) {
                          return "This Field is required";
                        }
                        _formKey.currentState.save();
                        return null;
                      },
                    ),
                    size10,
                    textUbuntu("Thana*", kBlackColor,fontSize: 16.0,fontWeight: weight500),
                    AddBusinessForm(
                      hintText: "thana",
                      suffixIcon: Icon(Icons.arrow_drop_down_circle,color: kPrimaryPurple,),
                      isSuffix: true,
                      validator: (value){
                        if (value.isEmpty) {
                          return "This Field is required";
                        }
                        _formKey.currentState.save();
                        return null;
                      },
                    ),
                    size10,
                    textUbuntu("Postal Code*", kBlackColor,fontSize: 16.0,fontWeight: weight500),
                    AddBusinessForm(
                      hintText: "postal code",
                      isSuffix: false,
                    ),
                    size10,
                    textUbuntu("Area", kBlackColor,fontSize: 16.0,fontWeight: weight500),
                    AddBusinessForm(
                      hintText: "area",
                      isSuffix: false,
                    ),
                    size10,
                    textUbuntu("Plus Code*", kBlackColor,fontSize: 16.0,fontWeight: weight500),
                    AddBusinessForm(
                      hintText: "plus code",
                      isSuffix: false,
                    ),

                    size10,
                    GestureDetector(
                      onTap: ()=>Navigator.pushNamed(context, '/stepTwo'),
                      child: Row(
                        children: [
                          Expanded(child: Container()),
                          textUbuntu("Go To Step 2 ", kPrimaryPurple,fontWeight: weightBold,fontSize: 18.0),
                          Icon(Icons.arrow_forward,color: kPrimaryPurple,)
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


AppBar buildBusinessInfoBar(String title) {
  return AppBar(
    backgroundColor: kPrimaryPurple,
    title: textUbuntu(title,kWhiteColor,fontWeight: weight500),
    iconTheme: IconThemeData(color: kWhiteColor),
  );
}


