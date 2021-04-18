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


Text textUbuntu(String title, Color color,
    {double fontSize, FontWeight fontWeight,int maxLine,TextDecoration textDecoration}) {
  return Text(
    title,
    style: GoogleFonts.ubuntu(
        color: color, fontWeight: fontWeight, fontSize: fontSize,decoration: textDecoration),
    maxLines: maxLine?? 1,
    overflow: TextOverflow.ellipsis,
    softWrap: false,
  );
}
