import 'package:flutter/material.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/screens/addBusiness/stepOneScreen.dart';
import 'package:johukum/widgets/textWidgets.dart';
import 'package:get/get.dart';

import 'businessDetailsSetting.dart';

class BusinessSettingLanding extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildBusinessInfoBar("Business Setting"),
      body: Responsive(
        mobile: Column(
          children: [
            SettingWidget(iconFront: Icons.edit,iconEnd: Icons.arrow_forward_ios,title: "Business Details",callback: (){
              Get.to(()=>SettingBusinessDetails());
            },),
            SettingWidget(iconFront: Icons.contact_phone,iconEnd: Icons.arrow_forward_ios,title: "Contact Details",),
            SettingWidget(iconFront: Icons.timer,iconEnd: Icons.arrow_forward_ios,title: "Working Hour",),
            SettingWidget(iconFront: Icons.business_center,iconEnd: Icons.arrow_forward_ios,title: "Others Details",),
            SettingWidget(iconFront: Icons.search_sharp,iconEnd: Icons.arrow_forward_ios,title: "SEO",),
            SettingWidget(iconFront: Icons.image,iconEnd: Icons.arrow_forward_ios,title: "Gallery",),
          ],
        ),
        tablet: Column(
          children: [
            SettingWidget(iconFront: Icons.edit,iconEnd: Icons.arrow_forward_ios,title: "Business Details",callback: (){
              print("Call");
            },),
            SettingWidget(iconFront: Icons.contact_phone,iconEnd: Icons.arrow_forward_ios,title: "Contact Details",),
            SettingWidget(iconFront: Icons.timer,iconEnd: Icons.arrow_forward_ios,title: "Working Hour",),
            SettingWidget(iconFront: Icons.business_center,iconEnd: Icons.arrow_forward_ios,title: "Others Details",),
            SettingWidget(iconFront: Icons.search_sharp,iconEnd: Icons.arrow_forward_ios,title: "SEO",),
            SettingWidget(iconFront: Icons.image,iconEnd: Icons.arrow_forward_ios,title: "Gallery",),
          ],
        ),
      ),
    );
  }
}

class SettingWidget extends StatelessWidget {
  const SettingWidget({
    Key key,@required this.iconFront,@required this.iconEnd,@required this.title,
    @required this.iconFSize,@required this.iconEndSize,@required this.titleSize,@required this.callback
  }) : super(key: key);

  final IconData iconFront;
  final double iconFSize;
  final IconData iconEnd;
  final double iconEndSize;
  final String title;
  final double titleSize;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
      child: GestureDetector(
        onTap:callback,
        child: Row(
          mainAxisAlignment: mainAxisAlignmentBetween,
          children: [
            Row(
              children: [
                Icon(iconFront,color: kPrimaryPurple,size:iconFSize?? 22.0),
                width10,
                textUbuntu(title, kBlackColor.withOpacity(0.4),fontSize:titleSize ?? 25.0,fontWeight: weight400),
              ],
            ),
            Icon(iconEnd,color: kPrimaryPurple,size: iconEndSize??22.0,)
          ],
        ),
      ),
    );
  }
}
