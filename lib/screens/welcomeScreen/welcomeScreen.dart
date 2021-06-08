import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:johukum/controller/locationController.dart';
import 'package:johukum/screens/welcomeScreen/welcomeScreenMobileView.dart';
import 'package:johukum/screens/welcomeScreen/welcomeScreenTabView.dart';
import '../../responsive.dart';

class WelcomeScreen extends StatefulWidget {

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  var controller=Get.put(LocationController());
  var token;



  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body:SafeArea(
        child:Responsive(
          mobile: WelcomeScreenMobileView(size: size),
          tablet: WelcomeScreenTabView(size: size),
        )
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


