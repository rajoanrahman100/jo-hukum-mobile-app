import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:johukum/screens/welcomeScreen/welcomeScreenMobileView.dart';

import '../../responsive.dart';

class WelcomeScreen extends StatelessWidget {


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


