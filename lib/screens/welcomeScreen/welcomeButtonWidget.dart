import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreenButton extends StatelessWidget {
  double height;
  EdgeInsetsGeometry edgeInsetsGeometry;
  Color buttonColor;
  String buttonText;
  Color textColor;
  double fontSize;
  VoidCallback callback;
  BorderRadiusGeometry borderRadiusGeometry;
  bool isIcon;
  Icon iconData;

  WelcomeScreenButton(
      {this.height,
      this.edgeInsetsGeometry,
      this.buttonColor,
      this.buttonText,
      this.textColor,
      this.fontSize,
      this.callback,this.borderRadiusGeometry,this.isIcon,this.iconData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        height: height,
        margin: edgeInsetsGeometry,
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: borderRadiusGeometry ?? BorderRadius.circular(20.0)),
        child: Center(
          child:isIcon==false?Text(
            buttonText,
            style: GoogleFonts.ubuntu(
                color: textColor,
                fontWeight: FontWeight.w500,
                fontSize: fontSize ?? 16.0),
          ):Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             iconData,SizedBox(width: 5.0,),Text(
               buttonText,
               style: GoogleFonts.ubuntu(
                   color: textColor,
                   fontWeight: FontWeight.w500,
                   fontSize: fontSize ?? 16.0),
             ),
            ],
          ),
        ),
      ),
    );
  }
}
