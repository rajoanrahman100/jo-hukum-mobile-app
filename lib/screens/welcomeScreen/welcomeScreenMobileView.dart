import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:johukum/screens/welcomeScreen/welcomeButtonWidget.dart';
import 'package:johukum/widgets/textWidgets.dart';

import '../../components/components.dart';

class WelcomeScreenMobileView extends StatelessWidget {
  const WelcomeScreenMobileView({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/welcome.jpg",height: size.height,width: size.width,fit: BoxFit.cover,),
        Center(
          child: Container(
            height: size.height/1.2,
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Image.asset("assets/images/newjohukum.png",height: size.height/3.5,),
                /*WelcomeScreenButton(
                  height: 55.0,
                  edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 20.0),
                  buttonColor: kWhiteColor,
                  buttonText: "SIGN UP",
                  textColor: kPrimaryPurple,
                  callback: ()=>Navigator.pushNamed(context, '/signUp'),
                  isIcon: false,
                ),*/
                SizedBox(height: 40.0),
                WelcomeScreenButton(
                  height: 55.0,
                  borderRadiusGeometry: BorderRadius.circular(15.0),
                  edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 20.0),
                  buttonColor: kWhiteColor,
                  buttonText: "EXPLORE",
                  textColor: kPrimaryPurple,
                  callback: ()=>Navigator.of(context)
                      .pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false),
                  isIcon: false,
                ),

                size20,
                Row(
                  children: [
                    Expanded(
                      child:WelcomeScreenButton(
                        height: 50.0,
                        borderRadiusGeometry: BorderRadius.circular(15.0),
                        edgeInsetsGeometry: EdgeInsets.only(left: 20.0),
                        //buttonColor: kPrimaryPurple,
                        buttonText: "Sign Up",
                        textColor: Colors.white,
                        callback: ()=>Navigator.pushNamed(context, '/signUp'),
                        isIcon: false, border: Border.all(color: kWhiteColor,width: 0.5),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFF482080),
                              Color(0xFF5F2C8B),
                            ]
                        ),
                      ),
                    ),
                    width10,
                    Expanded(
                      child: WelcomeScreenButton(
                        height: 50.0,
                        borderRadiusGeometry: BorderRadius.circular(15.0),
                        edgeInsetsGeometry: EdgeInsets.only(right: 20.0),
                        //buttonColor: kPrimaryPurple,
                        buttonText: "Log In",
                        textColor: Colors.white,
                        callback: ()=>Navigator.pushNamed(context, '/signIn'),
                        isIcon: false, border: Border.all(color: kWhiteColor,width: 0.5),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF482080),
                            Color(0xFF5F2C8B),
                          ]
                        ),
                      ),
                    ),

                  ],
                ),
                SizedBox(height: 40.0,),

                Text("For web view, visit",style: textStyleUbuntu(
                    color: kWhiteColor,fontSize: 12.0,fontWeight: FontWeight.w400
                ),),

                Text("www.jo-hukum.com",style: textStyleUbuntu(
                    color: kWhiteColor,fontSize: 13.0,fontWeight: FontWeight.w500,
                    textDecoration: TextDecoration.underline
                ),),
              ],
            ),
          ),
        ),

      ],
    );
  }
}
