import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/screens/addBusiness/stepOneScreen.dart';
import 'package:johukum/widgets/textWidgets.dart';

import 'businessItems.dart';

class CategorySubcategories extends StatelessWidget {
  var sublist = [];
  var categoryName;
  var length;

  CategorySubcategories({this.sublist, this.categoryName, this.length});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: buildBusinessInfoBar(categoryName),
        body: Responsive(
          mobile: Container(
            height: size.height,
            child: sublist.length == 0
                ? Center(child: textUbuntu("No Data Found", kPrimaryPurple, fontWeight: weight500, fontSize: 20))
                : ListView.builder(
                    itemCount: sublist.length,
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => BusinessItems(sublist[index].id, sublist[index].name));
                        },
                        child: Container(
                          height: 70,
                          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: kWhiteColor.withOpacity(0.1),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ], color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: CachedNetworkImage(
                                    imageUrl: "https://dsqdpdmeibwm2.cloudfront.net/${sublist[index].banner}",
                                    height: 60.0,
                                    width: 80.0,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => spinKit,
                                    errorWidget: (context, url, error) => Image.asset(
                                      "assets/images/johukuminfologo.png",
                                      height: 80.0,
                                    ),
                                  ),
                                ),
                                width10,
                                Expanded(child: textUbuntu(sublist[index].name, kPrimaryPurple, fontWeight: weight500))
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
          tablet: Container(
            height: size.height,
            child: sublist.length == 0
                ? Center(child: textUbuntu("No Data Found", kPrimaryPurple, fontWeight: weight500, fontSize: 20))
                : ListView.builder(
                    itemCount: sublist.length,
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => BusinessItems(sublist[index].id, sublist[index].name));
                        },
                        child: Container(
                          height: 80,
                          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: kWhiteColor.withOpacity(0.1),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ], color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: CachedNetworkImage(
                                    imageUrl: "https://dsqdpdmeibwm2.cloudfront.net/${sublist[index].banner}",
                                    height: 60.0,
                                    width: 80.0,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => spinKit,
                                    errorWidget: (context, url, error) => Image.asset(
                                      "assets/images/johukuminfologo.png",
                                      height: 90.0,
                                    ),
                                  ),
                                ),
                                width10,
                                Expanded(child: textUbuntu(sublist[index].name,
                                    kPrimaryPurple, fontWeight: weight500,fontSize: 20.0))
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ));
  }
}
