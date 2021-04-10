import 'package:flutter/material.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/widgets/textWidgets.dart';


class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    Key key,
    @required this.profile,
  }) : super(key: key);

  final String profile;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      child: Row(
        children: [
          Container(
            height: 120,
            width: 120,
            margin: EdgeInsets.only(top: 20.0),
            child: Stack(
              children: [
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: kPrimaryPurple.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    border: Border.all(color: kWhiteColor),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(profile)),
                    borderRadius: BorderRadius.all(
                      Radius.circular(60.0),
                    ),
                  ),
                ),
                Positioned(
                  left: 70.0,
                  bottom: 20.0,
                  child: Container(
                    height: 30,width: 30,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kPrimaryPurple,
                        border: Border.all(color: kWhiteColor)
                    ),
                    child: Center(child: Icon(Icons.camera_alt,color: kWhiteColor,size: 15.0,),),
                  ),

                )
              ],
            ),
          ),
          Text("Md. Rejoan Rahman Rifat",style: textStyleUbuntu(color: kBlackColor,fontWeight: weightBold,fontSize: 18.0),),
          SizedBox(width: 5.0,),
          Container(
            height: 25,width: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kPrimaryPurple,
            ),
            child: Center(child: Icon(Icons.edit,color: kWhiteColor,size: 16.0,),),
          ),

        ],
      ),
    );
  }
}
