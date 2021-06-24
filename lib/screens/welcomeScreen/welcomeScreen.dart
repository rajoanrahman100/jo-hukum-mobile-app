import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/controller/locationController.dart';
import 'package:johukum/screens/welcomeScreen/welcomeScreenMobileView.dart';
import 'package:johukum/screens/welcomeScreen/welcomeScreenTabView.dart';
import 'package:package_info/package_info.dart';
import '../../responsive.dart';
import 'package:wifi_info_flutter/wifi_info_flutter.dart';


class WelcomeScreen extends StatefulWidget {

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  var controller=Get.put(LocationController());
  var token;

  var version="";
  var ip;
  getIP()async{
     ip = await WifiInfo().getWifiIP();
     print("IP $ip");
     boxStorage.write(DEVICE_IPI, ip);
  }

  @override
  void initState() {
    print("-----------IP CALL");
    getIP();
    //getPackageInfo();
    // TODO: implement initState
  }

  getPackageInfo()async{
    PackageInfo info = await PackageInfo.fromPlatform();
    print("verson number ${info.version}");
    /*PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      version = packageInfo.version;
      print("verson number ${packageInfo.version}");
    });*/
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body:Responsive(
          mobile: WelcomeScreenMobileView(size: size),
          tablet: WelcomeScreenTabView(size: size),
        )
    );
  }

  void changeScreen() {

    Navigator.of(context)
        .pushNamedAndRemoveUntil('/bottomNav', (Route<dynamic> route) => false);
  }

  Widget callCompleteProfileNavigator() {
    return new FutureBuilder(
      future: Future.delayed(const Duration(milliseconds: 0)).then((value) => changeScreen()),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return emptyWidget(context);
      },
    );
  }

  Widget emptyWidget(BuildContext context) {
    return SizedBox.shrink();
  }
}


