import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class WelcomeScreenButton extends StatelessWidget {

  double height;
  EdgeInsetsGeometry edgeInsetsGeometry;
  Color buttonColor;
  String buttonText;
  Color textColor;
  double fontSize;
  VoidCallback callback;

  WelcomeScreenButton({this.height,this.edgeInsetsGeometry,this.buttonColor,this.buttonText,this.textColor,this.fontSize,this.callback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        height: height,
        margin: edgeInsetsGeometry,
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(20.0)
        ),
        child: Center(
          child: Text(buttonText,style: GoogleFonts.ubuntu(color: textColor,fontWeight: FontWeight.w500,fontSize: fontSize??16.0 ),),
        ),
      ),
    );
  }
}
