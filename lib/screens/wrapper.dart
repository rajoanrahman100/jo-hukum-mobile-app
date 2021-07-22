import 'package:flutter/material.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/controller/packageInfoController.dart';
import 'package:johukum/screens/bottomNavScreen.dart';
import 'package:johukum/screens/welcomeScreen/welcomeScreen.dart';
import 'package:get/get.dart';

import 'home/homeScreen.dart';

class WrapperClass extends StatefulWidget {
  @override
  _WrapperClassState createState() => _WrapperClassState();
}

class _WrapperClassState extends State<WrapperClass> {

  var packageController=Get.put(PackageInfoController());

  @override
  Widget build(BuildContext context) {

    return boxStorage.read(KEY_TOKEN)==null?WelcomeScreen():HomeScreen();
  }

}
