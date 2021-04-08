import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle textStyleUbuntu({Color color,double fontSize,FontWeight fontWeight,TextDecoration textDecoration}){
  return GoogleFonts.ubuntu(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    decoration: textDecoration
  );
}