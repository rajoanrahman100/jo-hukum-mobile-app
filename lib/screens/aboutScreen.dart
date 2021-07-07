import 'package:flutter/material.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/screens/addBusiness/stepOneScreen.dart';
import 'package:johukum/widgets/textWidgets.dart';

class AboutApp extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: buildBusinessInfoBar("About"),
      body: Responsive(
        mobile: Container(
          height: size.height,
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: crossAxisAlignmentCenter,
              children: [
                size20,
                Container(
                    width: size.width,
                    child: Image.asset(
                      "assets/images/newjohukum.png",
                      height: size.height * 0.2,
                    )),
                size20,
                textUbuntu(" '$intro' ", kPrimaryPurple,maxLine: 7,fontWeight: weight500),
                size20,
                Align(
                  alignment: Alignment.topLeft,
                  child:textUbuntu("Why?", kPrimaryPurple,maxLine: 7,fontWeight: weight500,fontSize: 18.0),
                ),
                size10,
                textUbuntu("$whyOne \n\n$whyTwo", kPrimaryPurple,maxLine: 7,fontWeight: weight500),
                size20,
                Align(
                  alignment: Alignment.topLeft,
                  child:textUbuntu("How?", kPrimaryPurple,maxLine: 7,fontWeight: weight500,fontSize: 18.0),
                ),
                size10,
                textUbuntu("$how", kPrimaryPurple,maxLine: 7,fontWeight: weight500),
                SizedBox(height: 40.0,),
                textUbuntu("Version: ${boxStorage.read(VERSION_NUMBER)}", kPrimaryPurple,maxLine: 7,fontWeight:
                weight500,fontSize: 18.0,textDecoration: TextDecoration.underline),


              ],
            ),
          ),
        ),
        tablet:Container(
        height: size.height,
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: crossAxisAlignmentCenter,
            children: [
              size20,
              Container(
                  width: size.width,
                  child: Image.asset(
                    "assets/images/newjohukum.png",
                    height: size.height * 0.3,
                  )),
              size20,
              textUbuntu(" '$intro' ", kPrimaryPurple,maxLine: 7,fontWeight: weight500,fontSize: 18.0),
              size20,
              Align(
                alignment: Alignment.topLeft,
                child:textUbuntu("Why?", kPrimaryPurple,maxLine: 7,fontWeight: weight500,fontSize: 20.0),
              ),
              size10,
              textUbuntu("$whyOne \n\n$whyTwo", kPrimaryPurple,maxLine: 7,fontWeight: weight500,fontSize: 18.0),
              size20,
              Align(
                alignment: Alignment.topLeft,
                child:textUbuntu("How?", kPrimaryPurple,maxLine: 7,fontWeight: weight500,fontSize: 20.0),
              ),
              size10,
              textUbuntu("$how", kPrimaryPurple,maxLine: 7,fontWeight: weight500,fontSize: 18.0),
              SizedBox(height: 60.0,),
              textUbuntu("Version: ${boxStorage.read(VERSION_NUMBER)}", kPrimaryPurple,maxLine: 7,fontWeight:
              weight500,fontSize: 20.0,textDecoration: TextDecoration.underline),


            ],
          ),
        ),
      ),
      ),
    );
  }
}
