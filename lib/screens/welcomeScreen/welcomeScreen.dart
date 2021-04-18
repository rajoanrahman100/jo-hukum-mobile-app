import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/controller/locationController.dart';
import 'package:johukum/screens/welcomeScreen/welcomeScreenMobileView.dart';
import 'package:geolocator/geolocator.dart';
import '../../responsive.dart';

class WelcomeScreen extends StatefulWidget {


  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  Position _currentPosition;
  String _currentAddress;

  var controller=Get.put(LocationController());

  @override
  void initState() {
    // TODO: implement initState

    //getCurrentLocation();

    //getTimeZoneInfo();
  }




  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Responsive(
          mobile: WelcomeScreenMobileView(size: size)
        )
      ),
    );
  }
}


