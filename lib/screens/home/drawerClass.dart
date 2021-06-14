import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/controller/dialogAuthController.dart';
import 'package:johukum/controller/myBusinessDataController.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/screens/welcomeScreen/welcomeButtonWidget.dart';
import 'package:johukum/widgets/customToast.dart';
import 'package:johukum/widgets/fullScreenAlertForAuth.dart';
import 'package:johukum/widgets/textWidgets.dart';

class DrawerClass extends StatelessWidget {
  var profile =
      "https://scontent.fdac116-1.fna.fbcdn.net/v/t1.6435-9/158261324_226608225830377_8521737132345272932_n.jpg?_nc_cat=102&ccb=1-3&_nc_sid=730e14&_nc_ohc=PivMlip5C94AX8C38PS&_nc_ht=scontent.fdac116-1.fna&oh=ece9ef74fbfee93d213a6c1e8437438d&oe=60967998";

  var c = Get.put(DialogAuthController());
  var businessController = Get.put(MyBusinessController());

  @override
  Widget build(BuildContext context) {
    businessController.getMyBusinessData();
    Size size = MediaQuery.of(context).size;

    return Responsive(
       mobile: Container(
          width: MediaQuery.of(context).size.width / 1.4, //20.0,
          height: MediaQuery.of(context).size.height,
          child:Theme(
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
                      height: 230,
                    ),
                    Row(
                      children: [

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
                    size20,
                    //boxStorage.read(KEY_TOKEN) == null?Container():
                   boxStorage.read(KEY_TOKEN)!=null?GestureDetector(
                      onTap: (){
                        return showDialog(
                            context: context,
                            builder: (context){
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Container(
                                  height: size.height/4.5,
                                  decoration: containerBoxDecoration(
                                      borderRadius: 10.0
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                          child: Obx(()=>businessController.businessData.value.results==null?
                                          Center(child: spinKit):businessController.businessData.value
                                              .results.length==0?Center(child: textUbuntu("You are not added any "
                                              "business yet", kPrimaryPurple,fontSize: 18.0))
                                              :Container(
                                            child: SizedBox.expand(
                                              child: Padding(
                                                padding: const EdgeInsets.all(15.0),
                                                child: ListView.builder(
                                                  itemCount: businessController.businessData.value.results.length,
                                                  itemBuilder: (_,index){

                                                    var obj=businessController.businessData.value;

                                                    return ListTile(
                                                      title: textUbuntu(businessController.businessData.value.results[index].location.businessName, kBlackColor,fontSize: 16,maxLine: 2),
                                                      leading:Icon(Icons.business_sharp,color: kPrimaryPurple,size: 22.0,),
                                                      onTap: (){
                                                        businessController.setMyBusinessSlug(obj.results[index].slug);
                                                        businessController.setMyBusinessID(obj.results[index].sId);
                                                        businessController.setMyBusinessName(obj.results[index].location.businessName);
                                                        Navigator.of(context).pop();
                                                      },

                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),)
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }
                        );
                      },
                      child: Container(
                        height: 40,
                        decoration: containerBoxDecoration(
                          borderRadius: 10.0,
                          color: kWhiteColor,
                        ),
                          child:Row(
                            children: [
                              Obx(()=>Expanded(child: Center(child: textUbuntu("${businessController.myBusinessName.value}",
                                  kPrimaryPurple,fontSize: 16,fontWeight: weight500),))),
                              Icon(Icons.arrow_drop_down,color: kPrimaryPurple,size: 23,),
                              width10
                            ],
                          )
                      ),
                    ):Container(),
                    size20,
                    boxStorage.read(KEY_TOKEN)!=null? DrawerItems(
                      callBack: (){
                        Navigator.pushNamed(context, '/userSetting');
                      },
                      icon: Icons.settings,
                      title: "Profile Setting",
                    ):Container(),

                    DrawerItems(
                      icon: Icons.report_problem,
                      title: "Report",
                      callBack: (){
                        Get.snackbar("Coming Soon!", "This feature will be available soon",backgroundColor: kWhiteColor);

                      },
                    ),
                    DrawerItems(
                      icon: Icons.description,
                      title: "Suggestion",
                      callBack: (){
                        Get.snackbar("Coming Soon!", "This feature will be available soon",backgroundColor: kWhiteColor);

                      },
                    ),
                    DrawerItems(
                      icon: Icons.message,
                      title: "Message",
                      callBack: (){
                        Get.snackbar("Coming Soon!", "This feature will be available soon",backgroundColor: kWhiteColor);

                      },
                    ),
                    DrawerItems(
                      icon: Icons.notifications,
                      title: "Notifications",
                      callBack: (){
                        Get.snackbar("Coming Soon!", "This feature will be available soon",backgroundColor: kWhiteColor);

                      },
                    ),

                   boxStorage.read(KEY_TOKEN)!=null?DrawerItems(
                      icon: Icons.dashboard,
                      title: "User Dashboard",
                      callBack: (){
                        if(boxStorage.read(MY_BUSINESS_SLUG)==null){
                          showErrorToast("Select your business first");
                          return;
                        }else{
                          Navigator.pushNamed(context, '/dashBoard');
                        }
                      },
                    ):Container(),
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
                      height: 50,
                    ),
                    boxStorage.read(KEY_TOKEN)!=null? GetBuilder<DialogAuthController>(
                      builder: (controller) {
                        return WelcomeScreenButton(
                          edgeInsetsGeometry: EdgeInsets.only(right: 120, left: 5),
                          buttonColor: kWhiteColor,
                          buttonText: "Log Out",
                          textColor: kPrimaryPurple,
                          height: 40,
                          borderRadiusGeometry: BorderRadius.circular(10.0),
                          isIcon: true,
                          callback: () {
                            //boxStorage.remove(MY_BUSINESS_SLUG);
                            boxStorage.remove(KEY_TOKEN).then((value) {
                              boxStorage.remove(KEY_USER_ID);
                              boxStorage.remove(MY_BUSINESS_SLUG);
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
                    ):Container()
                  ],
                ),
              ),
            ),
          ),
        ),
      tablet: Container(
        width: MediaQuery.of(context).size.width / 2.0, //20.0,
        height: MediaQuery.of(context).size.height,
        child:Theme(
          data: Theme.of(context).copyWith(
            canvasColor: kPrimaryPurple.withOpacity(0.8),
          ),
          child: Drawer(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: <Widget>[
                  Image.asset(
                    "assets/images/johukuminfologo.png",
                    height: 350,
                  ),
                  Row(
                    children: [

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome,",
                            style: textStyleUbuntu(color: kWhiteColor, fontSize: 15.0, fontWeight: weight500),
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
                  size20,
                  //boxStorage.read(KEY_TOKEN) == null?Container():
                  boxStorage.read(KEY_TOKEN)!=null? GestureDetector(
                    onTap: (){
                      return showDialog(
                          context: context,
                          builder: (context){
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Container(
                                height: size.height/4.5,
                                decoration: containerBoxDecoration(
                                    borderRadius: 10.0
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                        child: Obx(()=>businessController.businessData.value.results.length==0?textUbuntu("No Business Found", kPrimaryPurple):Container(
                                          child: SizedBox.expand(
                                            child: Padding(
                                              padding: const EdgeInsets.all(15.0),
                                              child: ListView.builder(
                                                itemCount: businessController.businessData.value.results.length,
                                                itemBuilder: (_,index){

                                                  var obj=businessController.businessData.value;

                                                  return ListTile(
                                                    title: textUbuntu(businessController.businessData.value.results[index].location.businessName, kBlackColor,fontSize: 18,maxLine: 2),
                                                    leading:Icon(Icons.add_business,color: kPrimaryPurple,size: 25.0,),
                                                    onTap: (){
                                                      businessController.setMyBusinessSlug(obj.results[index].slug);
                                                      businessController.setMyBusinessID(obj.results[index].sId);
                                                      businessController.setMyBusinessName(obj.results[index].location.businessName);
                                                      Navigator.of(context).pop();
                                                    },

                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),)
                                    )
                                  ],
                                ),
                              ),
                            );
                          }
                      );
                    },
                    child: Container(
                      height: 50,
                      decoration: containerBoxDecoration(
                        borderRadius: 10.0,
                        color: kWhiteColor,
                      ),
                      child: Obx(()=>Row(
                        children: [
                          Expanded(child: Center(child: textUbuntu("${businessController.myBusinessName.value}", kPrimaryPurple,fontSize: 16,fontWeight: weight500),)),
                          Icon(Icons.arrow_drop_down,color: kPrimaryPurple,size: 23,),
                          width10
                        ],
                      )),
                    ),
                  ):Container(),
                  size20,
                  boxStorage.read(KEY_TOKEN)!=null? DrawerItems(
                    callBack: (){
                      Navigator.pushNamed(context, '/userSetting');
                    },
                    icon: Icons.settings,
                    title: "Profile Setting",
                  ):Container(),
                  DrawerItems(
                    icon: Icons.report_problem,
                    title: "Report",
                    callBack: (){
                      Get.snackbar("Coming Soon!", "This feature will be available soon",backgroundColor: kWhiteColor);

                    },
                  ),
                  DrawerItems(
                    icon: Icons.description,
                    title: "Suggestion",
                    callBack: (){
                      Get.snackbar("Coming Soon!", "This feature will be available soon",backgroundColor: kWhiteColor);

                    },
                  ),
                  DrawerItems(
                    icon: Icons.message,
                    title: "Message",
                    callBack: (){
                      Get.snackbar("Coming Soon!", "This feature will be available soon",backgroundColor: kWhiteColor);

                    },
                  ),
                  DrawerItems(
                    icon: Icons.notifications,
                    title: "Notifications",
                    callBack: (){
                      Get.snackbar("Coming Soon!", "This feature will be available soon",backgroundColor: kWhiteColor);

                    },
                  ),

                  boxStorage.read(KEY_TOKEN)!=null?DrawerItems(
                    icon: Icons.dashboard,
                    title: "Business Dashboard",
                      callBack: (){
                        if(boxStorage.read(MY_BUSINESS_SLUG)==null){
                          showErrorToast("Select your business first");
                          return;
                        }else{
                          Navigator.pushNamed(context, '/dashBoard');
                        }
                      },
                  ):Container(),
                  SizedBox(
                    height: 20.0,
                  ),
                  WelcomeScreenButton(
                    callback: () {
                      boxStorage.read(KEY_USER_ID);
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
                    height: 50,
                    borderRadiusGeometry: BorderRadius.circular(10.0),
                    isIcon: false,
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  boxStorage.read(KEY_TOKEN)!=null? GetBuilder<DialogAuthController>(
                    builder: (controller) {
                      return WelcomeScreenButton(
                        edgeInsetsGeometry: EdgeInsets.only(right: 120, left: 5),
                        buttonColor: kWhiteColor,
                        buttonText: "Log Out",
                        textColor: kPrimaryPurple,
                        height: 50,
                        borderRadiusGeometry: BorderRadius.circular(10.0),
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
                  ):Container()
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
