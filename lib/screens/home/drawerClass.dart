import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/controller/dialogAuthController.dart';
import 'package:johukum/screens/welcomeScreen/welcomeButtonWidget.dart';
import 'package:johukum/widgets/fullScreenAlertForAuth.dart';
import 'package:johukum/widgets/textWidgets.dart';

class DrawerClass extends StatelessWidget {
  var profile =
      "https://scontent.fdac116-1.fna.fbcdn.net/v/t1.6435-9/158261324_226608225830377_8521737132345272932_n.jpg?_nc_cat=102&ccb=1-3&_nc_sid=730e14&_nc_ohc=PivMlip5C94AX8C38PS&_nc_ht=scontent.fdac116-1.fna&oh=ece9ef74fbfee93d213a6c1e8437438d&oe=60967998";

  var c = Get.put(DialogAuthController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: MediaQuery.of(context).size.width / 1.4, //20.0,
      height: MediaQuery.of(context).size.height,
      child: SafeArea(
        child: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: kPrimaryPurple.withOpacity(0.8),
          ),
          child: Drawer(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: <Widget>[
                  Image.asset(
                    "assets/images/johukuminfologo.png",
                    height: 200,
                  ),
                  Row(
                    children: [
                      /*Container(
                        width: 70.0,
                        height: 70.0,
                        decoration: BoxDecoration(
                          border: Border.all(color: kWhiteColor),
                          image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(profile)),
                          borderRadius: BorderRadius.all(
                            Radius.circular(60.0),
                          ),
                        ),
                      ),*/

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome,",
                            style: textStyleUbuntu(color: kWhiteColor, fontSize: 13.0, fontWeight: weight500),
                          ),
                          boxStorage.read(KEY_TOKEN) == null
                              ? Text(
                                  "Guest Login",
                                  style: textStyleUbuntu(color: kWhiteColor, fontSize: 20.0, fontWeight: weight500),
                                )
                              : Text(
                                  boxStorage.read(KEY_USER_NAME),
                                  style: textStyleUbuntu(color: kWhiteColor, fontSize: 20.0, fontWeight: weight500),
                                ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  DrawerItems(
                    icon: Icons.category,
                    title: "Categories",
                  ),
                  DrawerItems(
                    icon: Icons.report_problem,
                    title: "Report",
                  ),
                  DrawerItems(
                    icon: Icons.description,
                    title: "Suggestion",
                  ),
                  DrawerItems(
                    icon: Icons.message,
                    title: "Message",
                  ),
                  DrawerItems(
                    icon: Icons.notifications,
                    title: "Notifications",
                  ),
                  DrawerItems(
                    icon: Icons.settings,
                    title: "Profile Settings",
                    callBack: () => Navigator.pushNamed(context, '/profileSetting'),
                  ),
                  DrawerItems(
                    icon: Icons.dashboard,
                    title: "User Dashboard",
                    callBack: () => Navigator.pushNamed(context, '/dashBoard'),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  WelcomeScreenButton(
                    callback: () {
                      boxStorage.read(KEY_TOKEN)==null
                          ? openAddAuthDialog(context)
                          : Navigator.pushNamed(
                              context,
                              '/'
                              'stepOne');
                    },
                    edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 5),
                    buttonColor: kWhiteColor,
                    buttonText: "ADD YOUR BUSINESS",
                    textColor: kPrimaryPurple,
                    height: 40,
                    borderRadiusGeometry: BorderRadius.circular(10.0),
                    isIcon: false,
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  GetBuilder<DialogAuthController>(
                    builder: (controller) {
                      return WelcomeScreenButton(
                        edgeInsetsGeometry: EdgeInsets.only(right: 120, left: 5),
                        buttonColor: kWhiteColor,
                        buttonText: "Log Out",
                        textColor: kPrimaryPurple,
                        height: 40,
                        borderRadiusGeometry: BorderRadius.circular(20.0),
                        isIcon: true,
                        callback: () {
                          boxStorage.remove(KEY_TOKEN).then((value) {
                            controller.logInSuccess.value = false;
                            Navigator.of(context).pushNamedAndRemoveUntil('/welcome', (Route<dynamic> route) => false);
                          });
                        },
                        iconData: Icon(
                          Icons.logout,
                          color: kPrimaryPurple,
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DrawerItems extends StatelessWidget {
  IconData icon;
  String title;
  Function callBack;

  DrawerItems({this.icon, this.title, this.callBack});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callBack,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: [
            Icon(
              icon,
              color: kWhiteColor,
              size: 19.0,
            ),
            SizedBox(
              width: 5.0,
            ),
            Text(
              title,
              style: textStyleUbuntu(color: kWhiteColor, fontWeight: weight500, fontSize: 18.0),
            )
          ],
        ),
      ),
    );
  }
}
