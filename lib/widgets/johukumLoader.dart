import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
