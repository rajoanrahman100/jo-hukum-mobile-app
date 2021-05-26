import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/controller/categoryBusinessDataController.dart';
import 'package:johukum/controller/categoryController.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/screens/home/categorySubcategories.dart';
import 'package:johukum/screens/home/drawerClass.dart';
import 'package:johukum/screens/home/posterShow.dart';
import 'package:johukum/widgets/items.dart';
import 'package:johukum/widgets/textWidgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'businessItems.dart';
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

  var scrollController=ScrollController();

  //var bController=Get.put(CategoryBusinessDataController());

  @override
  void initState() {
    // TODO: implement initState
    scrollController.addListener(() async{
      if(scrollController.position.pixels==scrollController.position.maxScrollExtent){
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
                      children: [
                        PosterShow(images: images),
                        Container(
                          height: 100.0,
                          color: kPrimaryPurple.withOpacity(0.1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Items(
                                topRated: topRated,
                                title: "Top Rated",
                                callBack: () => Navigator.pushNamed(context, '/businessProfile'),
                              ),
                              Items(
                                topRated: nearBy,
                                title: "Your Nearby",
                              ),
                              Items(
                                topRated: fav,
                                title: "Your Favorite",
                              ),
                              Items(
                                topRated: trending,
                                title: "Trending",
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),

                        Obx(()=>categoryController.resultDataClass.length==0?Center(child: textUbuntu("loading...", kPrimaryPurple)):Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          height: 450,
                          child: GridView.builder(

                              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 150,
                                  childAspectRatio: 4 / 3,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10),
                              itemCount: categoryController.resultDataClass.length,
                              controller: scrollController,
                              itemBuilder: (BuildContext ctx, index) {
                                if(index==categoryController.resultDataClass.length-1){

                                  return Center(child: CircularProgressIndicator(backgroundColor: kPrimaryPurple,));
                                }
                                return GestureDetector(
                                  onTap: (){

                                    //print(categoryController.resultDataClass[index].id);
                                    //bController.setBusinessID(categoryController.resultDataClass[index].id);

                                    Get.to(()=>BusinessItems(categoryController.resultDataClass[index].id,
                                        categoryController.resultDataClass[index].name));

                                    /*Get.to(()=>CategorySubcategories(sublist:categoryController.resultDataClass[index]
                                        .subCategories,categoryName: categoryController
                                        .resultDataClass[index]
                                        .name));*/
                                  },
                                  child: Container(
                                    alignment: Alignment.center,

                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [

                                        SvgPicture.network("https://dsqdpdmeibwm2.cloudfront.net/${categoryController
                                            .resultDataClass[index].icon}",height: 30,width: 30,),

                                        size10,
                                        textUbuntu(categoryController.resultDataClass[index].name, kPrimaryPurple,
                                            fontWeight: FontWeight.w500)
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: kWhiteColor.withOpacity(0.1),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: Offset(0, 3), // changes position of shadow
                                          ),
                                        ],
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10)),
                                  ),
                                );
                              }),
                        ),)
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
