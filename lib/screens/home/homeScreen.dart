import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/screens/home/drawerClass.dart';
import 'package:johukum/screens/home/posterShow.dart';
import 'package:johukum/widgets/items.dart';
import 'package:johukum/widgets/textWidgets.dart';

import 'categoryItems.dart';
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

  var title = "Party";

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Responsive(
          mobile:  Container(
              height: size.height,
              child: Column(
                children: [
                  Header(size: size,
                    callBack: () => _scaffoldKey.currentState.openDrawer(),),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(

                        children: [
                          PosterShow(images: images),
                          Container(
                            height: 100.0,
                            color: kPrimaryPurple.withOpacity(0.1),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Items(topRated: topRated, title: "Top Rated",callBack: ()=>Navigator.pushNamed(context, '/businessProfile'),),
                                Items(topRated: nearBy, title: "Your Nearby",),
                                Items(topRated: fav, title: "Your Favorite",),
                                Items(topRated: trending, title: "Trending",),
                              ],
                            ),
                          ),
                          SizedBox(height: 20.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CategoryItems(trending: "assets/images/service.png",
                                title: "Service",
                                callBack: () =>Navigator.pushNamed(context, '/subCategories'),),
                              CategoryItems(
                                  trending: "assets/images/rent.png", title: "Rent"),
                              CategoryItems(
                                  trending: "assets/images/news.png", title: "News"),
                            ],
                          ),
                          SizedBox(height: 20.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CategoryItems(
                                  trending: "assets/images/hire.png", title: "Hire"),
                              CategoryItems(
                                  trending: "assets/images/shop.png", title: "Shop"),
                              CategoryItems(
                                  trending: "assets/images/party.png", title: "Party"),
                            ],
                          ),
                          SizedBox(height: 20.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CategoryItems(
                                  trending: "assets/images/b2b.png", title: "B2b"),
                              CategoryItems(trending: "assets/images/emergency.png",
                                  title: "Emergency"),
                              CategoryItems(
                                  trending: "assets/images/news.png", title: "News"),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),



                ],
              ),
            ),

        ),
        drawer: DrawerClass(),
      ),

    );
  }
}


