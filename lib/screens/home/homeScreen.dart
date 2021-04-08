import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/Rifat/AndroidStudioProjects/johukum/lib/components/components.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/screens/home/posterShow.dart';
import 'package:johukum/widgets/textWidgets.dart';

import 'header.dart';

class HomeScreen extends StatelessWidget {

  List<String> images = ["assets/images/adverOne.png", "assets/images/adverTwo.png", "assets/images/adverThree.png",];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return SafeArea(
      child: Scaffold(
        body: Responsive(
          mobile: SingleChildScrollView(
            child: Container(
              height: size.height,
              child: Column(
                children: [
                  Header(size: size),
                  PosterShow(images: images),
                  Container(
                    height: 100.0,
                    color: kPrimaryPurple.withOpacity(0.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset("assets/images/toprate.png"),
                        Image.asset("assets/images/nearby.png"),
                        Image.asset("assets/images/fav.png"),
                        Image.asset("assets/images/trending.png"),
                      ],
                    ),
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


