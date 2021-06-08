import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:johukum/screens/welcomeScreen/welcomeButtonWidget.dart';
import 'package:johukum/widgets/textWidgets.dart';

import '../../components/components.dart';

class WelcomeScreenTabView extends StatelessWidget {
  const WelcomeScreenTabView({
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

              children: [
                Spacer(),
                Image.asset("assets/images/johukuminfologo.png",height: size.height/2,),
                WelcomeScreenButton(
                  height: 70.0,
                  edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 25.0),
                  buttonColor: kWhiteColor,
                  buttonText: "SIGN UP",
                  textColor: kPrimaryPurple,
                  callback: ()=>Navigator.pushNamed(context, '/signUp'),
                  isIcon: false,
                ),

                size15,
                WelcomeScreenButton(
                  height: 70.0,
                  edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 25.0),
                  buttonColor: kPrimaryPurple,
                  buttonText: "Explore",
                  textColor: kWhiteColor,
                  callback: ()=>Navigator.pushNamed(context, '/bottomNav'),
                  isIcon: false,
                ),
                size15,
                Text("Already have an account?",style: GoogleFonts.ubuntu(color: kWhiteColor,fontSize: 18.0),),
                size15,
                WelcomeScreenButton(
                  height: 55.0,
                  edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 110.0),
                  buttonColor: kWhiteColor,
                  buttonText: "SIGN IN",
                  textColor: kPrimaryPurple,
                  fontSize: 16.0,
                  isIcon: false,
                  callback: ()=>Navigator.pushNamed(context, '/signIn'),
                ),

                SizedBox(height: 40.0,),

                Text("For web view, visit",style: textStyleUbuntu(
                    color: kWhiteColor,fontSize: 16.0,fontWeight: FontWeight.w400
                ),),
                Text("www.jo-hukum.com",style: textStyleUbuntu(
                    color: kWhiteColor,fontSize: 18.0,fontWeight: FontWeight.w500,
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
