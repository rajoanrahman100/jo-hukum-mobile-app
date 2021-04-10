import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/screens/home/drawerClass.dart';
import 'package:johukum/screens/home/posterShow.dart';
import 'package:johukum/widgets/items.dart';
import 'package:johukum/widgets/textWidgets.dart';

import 'header.dart';

class HomeScreen extends StatelessWidget {
  List<String> images = [
    "assets/images/adverOne.png",
    "assets/images/adverTwo.png",
    "assets/images/adverThree.png",
  ];

  var topRated = "assets/images/group2.png";
  var nearBy = "assets/images/best2.png";
  var fav = "assets/images/fav2.png";
  var trending = "assets/images/trend2.png";

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Responsive(
          mobile: SingleChildScrollView(
            child: Container(
              height: size.height,
              child: Column(
                children: [
                  Header(size: size,callBack: ()=>_scaffoldKey.currentState.openDrawer(),),
                  PosterShow(images: images),
                  Container(
                    height: 100.0,
                    color: kPrimaryPurple.withOpacity(0.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Items(topRated: topRated,title: "Top Rated",),
                        Items(topRated: nearBy,title: "Your Nearby",),
                        Items(topRated: fav,title: "Your Favorite",),
                        Items(topRated: trending,title: "Trending",),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        drawer: DrawerClass(),
      ),

    );
  }
}

