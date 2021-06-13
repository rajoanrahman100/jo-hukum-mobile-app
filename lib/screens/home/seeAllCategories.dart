import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/controller/categoryController.dart';
import 'package:johukum/screens/addBusiness/stepOneScreen.dart';
import 'package:johukum/widgets/textWidgets.dart';

import '../../responsive.dart';
import 'businessItems.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  var categoryController = Get.put(CategoryController());

  var scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    scrollController.addListener(() async {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        categoryController.increasePageNumber();
        categoryController.getTask(categoryController.pageNumber.value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildBusinessInfoBar("Categories"),
      body: Responsive(
        mobile: Obx(
          () => categoryController.resultDataClass.length == 0
              ? Center(child: spinKit)
              : Container(
                  //margin: EdgeInsets.symmetric(horizontal: 10),
                  height: size.height,
                  width: size.width,
                  child: Center(
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 150, childAspectRatio: 5 / 6, crossAxisSpacing: 10, mainAxisSpacing: 10),
                        itemCount: categoryController.resultDataClass.length,
                        controller: scrollController,
                        itemBuilder: (BuildContext ctx, index) {
                          if (index == categoryController.resultDataClass.length - 1) {
                            return Center(child: spinKit);
                          }
                          return GestureDetector(
                            onTap: () {
                              //print(categoryController.resultDataClass[index].id);
                              //bController.setBusinessID(categoryController.resultDataClass[index].id);

                              Get.to(() => BusinessItems(categoryController.resultDataClass[index].id, categoryController.resultDataClass[index].name));
                            },
                            child: Container(
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.network(
                                    "https://dsqdpdmeibwm2.cloudfront.net/${categoryController.resultDataClass[index].icon}",
                                    height: 40,
                                    width: 40,
                                  ),
                                  size10,
                                  textUbuntu(categoryController.resultDataClass[index].name, kBlackColor, fontWeight: FontWeight.w500)
                                ],
                              ),
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                  color: kWhiteColor.withOpacity(0.2),
                                  spreadRadius: 5,
                                  blurRadius: 2,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
                            ),
                          );
                        }),
                  ),
                ),
        ),
        tablet: Obx(
          () => categoryController.resultDataClass.length == 0
              ? Center(child: spinKit)
              : Container(
                  //margin: EdgeInsets.symmetric(horizontal: 10),
                  height: size.height,
                  width: size.width,
                  child: Center(
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200, childAspectRatio: 4 / 5, crossAxisSpacing: 10, mainAxisSpacing: 10),
                        itemCount: categoryController.resultDataClass.length,
                        controller: scrollController,
                        itemBuilder: (BuildContext ctx, index) {
                          if (index == categoryController.resultDataClass.length - 1) {
                            return Center(child: spinKit);
                          }
                          return GestureDetector(
                            onTap: () {
                              //print(categoryController.resultDataClass[index].id);
                              //bController.setBusinessID(categoryController.resultDataClass[index].id);

                              Get.to(() => BusinessItems(categoryController.resultDataClass[index].id, categoryController.resultDataClass[index].name));
                            },
                            child: Container(
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.network(
                                    "https://dsqdpdmeibwm2.cloudfront.net/${categoryController.resultDataClass[index].icon}",
                                    height: 60,
                                    width: 60,
                                  ),
                                  size15,
                                  textUbuntu(categoryController.resultDataClass[index].name, kBlackColor, fontWeight: FontWeight.w500,fontSize: 18.0)
                                ],
                              ),
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                  color: kWhiteColor.withOpacity(0.2),
                                  spreadRadius: 5,
                                  blurRadius: 2,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
                            ),
                          );
                        }),
                  ),
                ),
        ),
      ),
    );
  }
}
