import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/controller/categoryController.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/screens/home/drawerClass.dart';
import 'package:johukum/widgets/items.dart';
import 'package:johukum/widgets/textWidgets.dart';

import 'businessItems.dart';
import 'carousalSlider.dart';
import 'header.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  var categoryController = Get.put(CategoryController());

  var scrollController = ScrollController();

  //var bController=Get.put(CategoryBusinessDataController());

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

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        body: Responsive(
          mobile: Container(
            height: size.height,
            child: Column(
              children: [
                Header(
                  size: size,
                  callBack: () => _scaffoldKey.currentState.openDrawer(),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: crossAxisAlignmentStart,
                      children: [
                        size5,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: textUbuntu("Your Nearby", kPrimaryPurple, fontWeight: weight500, fontSize: 16.0),
                        ),
                        size10,
                        Obx(() => categoryController.resultDataClass.length == 0
                            ? Center(child: spinKit)
                            : Container(
                                height: size.height / 8,
                                color: kPrimaryPurple.withOpacity(0.1),
                                child: ListView.builder(
                                  itemCount: 10,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (_, index) {
                                    return HomeScreenItems(
                                      callBack: () {
                                        Get.to(() => BusinessItems(categoryController.resultDataClass[index].id, categoryController.resultDataClass[index].name));
                                      },
                                      categoryController: categoryController,
                                      image: "https://dsqdpdmeibwm2.cloudfront.net/${categoryController.resultDataClass[index].icon}",
                                      title: categoryController.resultDataClass[index].name,
                                    );
                                  },
                                ),
                              )),
                        size10,
                        //PosterShow(images: images),
                        CarasoulSlider(),
                        size10,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              textUbuntu("Categories", kPrimaryPurple, fontWeight: weight500, fontSize: 16.0),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/seeAllCategories');
                                  },
                                  child: textUbuntu("See All", kPrimaryPurple, fontWeight: weight500, fontSize: 16.0))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Obx(
                          () => categoryController.resultDataClass.length == 0
                              ? Center(child: spinKit)
                              : Container(
                                  //margin: EdgeInsets.symmetric(horizontal: 10),
                                  height: size.height / 4,
                                  width: size.width,
                                  color: kPrimaryPurple.withOpacity(0.1),
                                  child: Center(
                                    child: GridView.builder(
                                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 150, childAspectRatio: 4 / 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
                                        itemCount: 6,
                                        controller: scrollController,
                                        itemBuilder: (BuildContext ctx, index) {
                                          if (index == categoryController.resultDataClass.length - 1) {
                                            return Center(child: spinKit);
                                          }
                                          return GestureDetector(
                                            onTap: () {
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
                                            ),
                                          );
                                        }),
                                  ),
                                ),
                        ),
                        size10,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: textUbuntu("Top Rated", kPrimaryPurple, fontWeight: weight500, fontSize: 16.0),
                        ),
                        size10,
                        Obx(() => categoryController.resultDataClass.length == 0
                            ? Center(child: spinKit)
                            : Container(
                                height: size.height / 8,
                                color: kPrimaryPurple.withOpacity(0.1),
                                child: ListView.builder(
                                  itemCount: 10,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (_, index) {
                                    return HomeScreenItems(
                                      callBack: () {
                                        Get.to(() => BusinessItems(categoryController.resultDataClass[index].id, categoryController.resultDataClass[index].name));
                                      },
                                      categoryController: categoryController,
                                      image: "https://dsqdpdmeibwm2.cloudfront.net/${categoryController.resultDataClass[index].icon}",
                                      title: categoryController.resultDataClass[index].name,
                                    );
                                  },
                                ),
                              )),
                        size20,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          tablet: Container(
            height: size.height,
            child: Column(
              children: [
                Header(
                  size: size,
                  containerHeight: 170.0,
                  callBack: () => _scaffoldKey.currentState.openDrawer(),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: crossAxisAlignmentStart,
                      children: [
                        size5,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: textUbuntu("Your Nearby", kPrimaryPurple, fontWeight: weight500, fontSize: 18.0),
                        ),
                        size10,
                        Obx(() => categoryController.resultDataClass.length == 0
                            ? Center(child: spinKit)
                            : Container(
                          height: size.height / 7,
                          color: kPrimaryPurple.withOpacity(0.1),
                          child: ListView.builder(
                            itemCount: 10,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) {
                              return HomeScreenItems(
                                callBack: () {
                                  Get.to(() => BusinessItems(categoryController.resultDataClass[index].id, categoryController.resultDataClass[index].name));
                                },
                                categoryController: categoryController,
                                image: "https://dsqdpdmeibwm2.cloudfront.net/${categoryController.resultDataClass[index].icon}",
                                title: categoryController.resultDataClass[index].name,
                              );
                            },
                          ),
                        )),
                        size10,
                        //PosterShow(images: images),
                        CarasoulSlider(height: 200.0,),
                        size10,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              textUbuntu("Categories", kPrimaryPurple, fontWeight: weight500, fontSize: 18.0),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/seeAllCategories');
                                  },
                                  child: textUbuntu("See All", kPrimaryPurple, fontWeight: weight500, fontSize: 18.0))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),

                        Obx(
                              () => categoryController.resultDataClass.length == 0
                              ? Center(child: spinKit)
                              : Container(
                            //margin: EdgeInsets.symmetric(horizontal: 10),
                            height: size.height / 4,
                            width: size.width,
                            color: kPrimaryPurple.withOpacity(0.1),
                            child: Center(
                              child: GridView.builder(
                                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 150, childAspectRatio: 4 / 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
                                  itemCount: 10,
                                  controller: scrollController,
                                  itemBuilder: (BuildContext ctx, index) {
                                    if (index == categoryController.resultDataClass.length - 1) {
                                      return Center(child: spinKit);
                                    }
                                    return GestureDetector(
                                      onTap: () {
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
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        ),
                        size10,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: textUbuntu("Top Rated", kPrimaryPurple, fontWeight: weight500, fontSize: 18.0),
                        ),
                        size10,
                        Obx(() => categoryController.resultDataClass.length == 0
                            ? Center(child: spinKit)
                            : Container(
                          height: size.height / 8,
                          color: kPrimaryPurple.withOpacity(0.1),
                          child: ListView.builder(
                            itemCount: 10,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) {
                              return HomeScreenItems(
                                callBack: () {
                                  Get.to(() => BusinessItems(categoryController.resultDataClass[index].id, categoryController.resultDataClass[index].name));
                                },
                                categoryController: categoryController,
                                image: "https://dsqdpdmeibwm2.cloudfront.net/${categoryController.resultDataClass[index].icon}",
                                title: categoryController.resultDataClass[index].name,
                              );
                            },
                          ),
                        )),
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

class HomeScreenItems extends StatelessWidget {
  const HomeScreenItems({
    Key key,
    @required this.categoryController,
    @required this.image,
    @required this.title,
    @required this.callBack,
  }) : super(key: key);

  final CategoryController categoryController;
  final image;
  final title;
  final Function callBack;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callBack,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.network(
              image,
              height: 40,
              width: 40,
            ),
            size10,
            textUbuntu(title, kBlackColor, fontWeight: FontWeight.w500)
          ],
        ),
      ),
    );
  }
}
