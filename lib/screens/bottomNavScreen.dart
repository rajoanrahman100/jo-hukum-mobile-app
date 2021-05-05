import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/controller/elasticController.dart';
import 'package:johukum/widgets/searchResultWidget.dart';
import 'package:johukum/widgets/textWidgets.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'home/homeScreen.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  PageController pageController;

  var getPageIndex = 0;

  var elasticController = Get.put(ElasticController());

  var searchController = TextEditingController();

  ScrollController scrollController=ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    pageController = PageController();
  }

  onTapChangePage(pageIndex) {
    pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  whenPageChanges(int pageIndex) {
    setState(() {
      this.getPageIndex = pageIndex;
    });
  }

  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: PageView(
        children: <Widget>[
          HomeScreen(),
        ],
        controller: pageController,
        onPageChanged: whenPageChanges,
        physics: NeverScrollableScrollPhysics(),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        child: Icon(
          Icons.search,
          color: Colors.white,
          size: 28,
        ),
        backgroundColor: kPrimaryPurple,
        onPressed: () {
          showBarModalBottomSheet(
              context: context,
              expand: true,
              backgroundColor: kWhiteColor,
              builder: (context) => Container(
                    height: MediaQuery.of(context).size.height,

                    // padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                    child: Column(
                      children: [
                        size10,
                        textUbuntu("WHAT YOU NEED?", kBlackColor, fontWeight: weightBold, fontSize: 18.0),
                        size10,
                        Container(
                          height: 45,
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0), color: kPrimaryPurple.withOpacity(0.2)),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  textUbuntu("Choose Category", kBlackColor),
                                  GestureDetector(onTap: () {}, child: Icon(Icons.arrow_drop_down))
                                ],
                              ),
                              Container(
                                height: 10,
                                width: 1,
                                color: kBlackColor,
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: searchController,
                                  autofocus: false,
                                  onChanged: (value) async {
                                   // await elasticController.fetchElasticeData(value, 0);
                                  },
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "serach anything you want",
                                      contentPadding: EdgeInsets.only(bottom: 5, left: 10)),
                                ),
                              )
                            ],
                          ),
                        ),
                        size5,
                        textUbuntu("65847+ Verified Business Enlisted", kBlackColor,
                            fontWeight: weight400, fontSize: 16.0),
                        size10,
                        Obx(() => elasticController.elasticData.value.hits == null
                            ? textUbuntu("", kPrimaryPurple)
                            : elasticController.elasticData.value.hits.hits.length == 0
                                ? textUbuntu("No Result Found", kPrimaryPurple, fontWeight: weight500)
                                : Expanded(
                                    child: ListView.builder(
                                      itemCount: elasticController.elasticData.value.hits.hits.length,
                                      itemBuilder: (_, index) {
                                        var dataList = elasticController.elasticData.value.hits.hits;
                                        return SearchItemWidget(
                                            image: "https://dsqdpdmeibwm2.cloudfront.net/${dataList[index].sSource.logo}",
                                            businessName: dataList[index].sSource.businessName,
                                            distance: dataList[index].sort[0].toString().substring(0, 4),
                                            street: dataList[index].sSource.street,
                                            size: size);
                                      },
                                    ),
                                  )),
                      ],
                    ),
                  ));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFFFFFEFE),
        elevation: 6.0,
        shape: CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 5,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.article), label: ''),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: '',
            ),
          ],
          currentIndex: getPageIndex,
          onTap: onTapChangePage,
          backgroundColor: Colors.white,
          selectedItemColor: kPrimaryPurple,
        ),
      ),
    );
  }
}

//                        AddBusinessForm(
//                         // controller: searchController,
//                          isSuffix: true,
//                          hintText: "search anything you want",
//                          onChange: (str) async {
//                            print(str);
//                            await elasticController.fetchElasticeData(str);
//                          },
//                          suffixIcon: GestureDetector(
//                              onTap: () async {
//                                await elasticController
//                                    .fetchElasticeData(searchController.text);
//                              },
//                              child: Icon(
//                                Icons.search,
//                                color: kPrimaryPurple,
//                              )),
//                        ),
