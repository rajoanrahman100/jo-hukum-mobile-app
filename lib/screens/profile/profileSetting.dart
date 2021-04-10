import 'package:flutter/material.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/widgets/profileHeader.dart';
import 'package:johukum/widgets/textWidgets.dart';

class ProfileSettings extends StatelessWidget {
  var profile =
      "https://scontent.fdac116-1.fna.fbcdn.net/v/t1.6435-9/158261324_226608225830377_8521737132345272932_n.jpg?_nc_cat=102&ccb=1-3&_nc_sid=730e14&_nc_ohc=PivMlip5C94AX8C38PS&_nc_ht=scontent.fdac116-1.fna&oh=ece9ef74fbfee93d213a6c1e8437438d&oe=60967998";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryPurple,
        elevation: 0.0,
        iconTheme: IconThemeData(color: kWhiteColor),
        title: Text("Profile Settings",style: textStyleUbuntu(color: kWhiteColor),),
      ),
      body: Container(
        height: size.height,
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileHeader(profile: profile),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Profile Settings",
              style: textStyleUbuntu(
                  color: kBlackColor, fontWeight: weightBold, fontSize: 22),
            ),
            Divider(
              color: kBlackColor.withOpacity(0.3),
            ),
            ProfileSettingsOptions(title: "Change Password",icon: Icons.arrow_forward_ios,),
            ProfileSettingsOptions(title: "Change Description",icon: Icons.arrow_forward_ios,),
            ProfileSettingsOptions(title: "Social Apperance",icon: Icons.arrow_forward_ios,),
            ProfileSettingsOptions(title: "Language",icon: Icons.arrow_forward_ios,),
            ProfileSettingsOptions(title: "Location",icon: Icons.arrow_forward_ios,),
            ProfileSettingsOptions(title: "Privacy & Security",icon: Icons.arrow_forward_ios,),
            ProfileSettingsOptions(title: "Your Business Setting",icon: Icons.arrow_forward_ios,),
            SizedBox(height: 5.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Invite Your Friends",
                  style: textStyleUbuntu(
                      color: kBlackColor.withOpacity(0.5),
                      fontWeight: weight400,
                      fontSize: 18),
                ),
                Container(
                  height: 25,
                  width: 70,
                  decoration: BoxDecoration(
                    color: kPrimaryPurple,
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  child: Center(
                    child: Text("Get Link",style: TextStyle(color: kWhiteColor),),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileSettingsOptions extends StatelessWidget {

  String title;
  IconData icon;

  ProfileSettingsOptions({this.title,this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: textStyleUbuntu(
                color: kBlackColor.withOpacity(0.5),
                fontWeight: weight400,
                fontSize: 18),
          ),
          Icon(
            icon,
            color: kBlackColor.withOpacity(0.5),
            size: 17.0,
          )
        ],
      ),
    );
  }
}
