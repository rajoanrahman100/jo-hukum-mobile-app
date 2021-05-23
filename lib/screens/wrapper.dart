import 'package:flutter/material.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/screens/bottomNavScreen.dart';
import 'package:johukum/screens/welcomeScreen/welcomeScreen.dart';

class WrapperClass extends StatefulWidget {
  @override
  _WrapperClassState createState() => _WrapperClassState();
}

class _WrapperClassState extends State<WrapperClass> {


  @override
  Widget build(BuildContext context) {
    return boxStorage.read(KEY_TOKEN)==null?WelcomeScreen():BottomNavScreen();
  }

}
