import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/widgets/textWidgets.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class JohukumLoaderAnimation {

  static Widget showLoaderAnimation({context,String textBottom,Color colorTextBottom}){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Material(
            color: Colors.transparent,
            child: Container(
                height: 250.0,
                width: 250.0,
                color: Colors.transparent,
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/johukumloadergif.gif",height: 300.0,width: 350.0,),
                   // Text(textBottom,style: TextStyle(color: colorTextBottom,fontSize: 18,),maxLines: 1,)
                  ],
                )
            ),
          );
        },
        useSafeArea: true);
  }
  static hideRokkhiLoaderAnimation(context){
    Navigator.of(context,rootNavigator: true).pop();
  }
}


Future buildShowBarModalBottomSheet(BuildContext context,
    {Function cameraCallBack, Function galleryCallBack}) {
  return showBarModalBottomSheet(
    expand: false,
    context: context,
    builder: (context) => Container(
      height: 160,
      color: kWhiteColor,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          textUbuntu("Take Photo", kBlackColor,
              fontSize: 20.0, fontWeight: FontWeight.w500),
          SizedBox(
            height: 20.0,
          ),
          GestureDetector(
            onTap: cameraCallBack,
            child: Row(
              children: [
                Icon(
                  Icons.camera,
                  color: kPrimaryPurple,
                ),
                SizedBox(
                  width: 10.0,
                ),
                textUbuntu("From Camera", kPrimaryPurple,
                    fontSize: 18.0, fontWeight: FontWeight.w500),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          GestureDetector(
            onTap: galleryCallBack,
            child: Row(
              children: [
                Icon(
                  Icons.perm_media,
                  color: kPrimaryPurple,
                ),
                SizedBox(
                  width: 10.0,
                ),
                textUbuntu("From Gallery", kPrimaryPurple,
                    fontSize: 18.0, fontWeight: FontWeight.w500),
              ],
            ),
          )
        ],
      ),
    ),
  );
}