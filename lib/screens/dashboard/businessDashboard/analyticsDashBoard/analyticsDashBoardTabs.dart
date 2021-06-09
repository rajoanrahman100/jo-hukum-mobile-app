import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/controller/dashBoardController/analyticDashBoardController.dart';
import 'package:johukum/controller/dashBoardController/businessAnalytocsController.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/screens/dashboard/businessDashboard/analyticsDashBoard/thisMonth.dart';
import 'package:johukum/screens/dashboard/businessDashboard/analyticsDashBoard/thisWeek.dart';
import 'package:johukum/screens/dashboard/businessDashboard/analyticsDashBoard/today.dart';
import 'package:johukum/screens/dashboard/businessDashboard/analyticsDashBoard/total.dart';
import 'package:johukum/screens/dashboard/businessDashboard/widgets/line_chart.dart';
import 'package:johukum/screens/dashboard/businessDashboard/widgets/pie_chart.dart';
import 'package:johukum/screens/dashboard/businessDashboard/widgets/stayingTime.dart';
import 'package:johukum/screens/dashboard/businessDashboard/widgets/visitorByRegions.dart';
import 'package:johukum/widgets/textWidgets.dart';

class AnalyticsDashBoardTabs extends StatefulWidget {
  @override
  _AnalyticsDashBoardTabsState createState() => _AnalyticsDashBoardTabsState();
}

class _AnalyticsDashBoardTabsState extends State<AnalyticsDashBoardTabs> {

  var businessController = Get.put(BusinessAnalyticsController());

  var dashController=Get.put(DashController());

  var topKeywords = [
    "UX/UI design",
    "Graphic Design",
    "Movies",
    "Flutter/Dart",
    "Cross Platform",
    "Web Development "
        "and Design"
  ];

  @override
  void initState() {
    //businessController.getStayingData("602cfd2170050b2691a99bd7");
    businessController.getStayingData(boxStorage.read(MY_BUSINESS_ID));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Responsive(
        mobile: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: Obx(()=>Center(
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TabButton(
                            text: "Today",
                            pageNumber: 0,
                            color: kPinkColor,
                            selectedPage: dashController.page.value,
                            width: 120.0,
                            onPressed: () {
                              //_changePage(0);
                              dashController.changePage(0);
                            },
                          ),
                          TabButton(
                            text: "This Week",
                            pageNumber: 1,
                            selectedPage: dashController.page.value,
                            color: kBlueColor,
                            width: 120.0,
                            onPressed: () {
                              dashController.changePage(1);
                            },
                          ),
                          TabButton(
                            text: "Last 30 days",
                            pageNumber: 2,
                            selectedPage: dashController.page.value,
                            color: kAquaGreenColor,
                            width: 120.0,
                            onPressed: () {
                              dashController.changePage(2);
                            },
                          ),
                          TabButton(
                            text: "Total",
                            pageNumber: 3,
                            selectedPage: dashController.page.value,
                            color: kYellowColor,
                            width: 120.0,
                            onPressed: () {
                              dashController.changePage(3);
                            },
                          ),
                        ],
                      ),
                    )),
                  ),
                  Obx(()=>Container(
                    height: size.height / 3.2,
                    child: PageView(
                      onPageChanged: (int page) {
                        dashController.page.value=page;
                      },
                      controller: dashController.controller.value,
                      children: [Today(), ThisWeek(), ThisMonth(), Total()],
                    ),
                  ),),
                  size10,
                  LineChartSample2(),
                  size5,
                  textUbuntu("Business Visit Graph", kBlackColor, fontWeight: weight500, fontSize: 18),
                  size10,
                  Row(
                    children: [
                      textUbuntu("Top Keywords", kPrimaryPurple),
                      Expanded(
                          child: Divider(
                            color: kPrimaryPurple,
                            height: 2,
                          ))
                    ],
                  ),
                  size10,
                  Container(
                    height: 150,
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: topKeywords.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 5 / 1, crossAxisCount: 2, crossAxisSpacing: 3.0, mainAxisSpacing: 4.0),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            height: 40,
                            decoration: containerBoxDecoration(borderRadius: 10.0, color: kPrimaryPurple.withOpacity(0.3)),
                            child: Center(child: textUbuntu(topKeywords[index], kBlackColor, fontWeight: weight500)));
                      },
                    ),
                  ),
                  // size10,
                  PieChartSample2(),
                  size10,

                  Obx(() => BusinessStayTimeWidget(
                    size: size,
                    minValue: "${businessController.activeStay.value??0}",
                    title: "Customer Active Stay",
                    color: kPrimaryPurple,
                    minValueColor: kWhiteColor,
                    minTextColor: kWhiteColor,
                    titleColor: kWhiteColor,
                  )),
                  size10,
                  Obx(() => BusinessStayTimeWidget(
                    size: size,
                    minValue: "${businessController.idleStay.value??0}",
                    title: "Customer Idle Stay",
                    color: Colors.white,
                    minValueColor: kBlackColor,
                    minTextColor: kBlackColor,
                    titleColor: kBlackColor,
                  )),

                  size10,
                  VisitorByRegion(),
                  size10,
                ],
              ),
            ),
          ),
        ),
        tablet: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                    child: Obx(()=>Center(
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TabButton(
                            text: "Today",
                            pageNumber: 0,
                            color: kPinkColor,
                            height: 40.0,
                            width: 130.0,
                            fontSize: 18.0,
                            selectedPage: dashController.page.value,
                            onPressed: () {
                              //_changePage(0);
                              dashController.changePage(0);
                            },
                          ),
                          TabButton(
                            text: "This Week",
                            pageNumber: 1,
                            selectedPage: dashController.page.value,
                            color: kBlueColor,
                            height: 40.0,
                            width: 130.0,
                            fontSize: 18.0,
                            onPressed: () {
                              dashController.changePage(1);
                            },
                          ),
                          TabButton(
                            text: "Last 30 days",
                            pageNumber: 2,
                            selectedPage: dashController.page.value,
                            color: kAquaGreenColor,
                            height: 40.0,
                            width: 130.0,
                            fontSize: 18.0,
                            onPressed: () {
                              dashController.changePage(2);
                            },
                          ),
                          TabButton(
                            text: "Total",
                            pageNumber: 3,
                            selectedPage: dashController.page.value,
                            color: kYellowColor,
                            height: 40.0,
                            width: 130.0,
                            fontSize: 18.0,
                            onPressed: () {
                              dashController.changePage(3);
                            },
                          ),
                        ],
                      ),
                    )),
                  ),
                  Obx(()=>Container(
                    height: size.height / 2.9,
                    child: PageView(
                      onPageChanged: (int page) {
                        dashController.page.value=page;
                      },
                      controller: dashController.controller.value,
                      children: [Today(), ThisWeek(), ThisMonth(), Total()],
                    ),
                  ),),
                  size10,
                  LineChartSample2(height: size.height/3),
                  size5,
                  textUbuntu("Business Visit Graph", kBlackColor, fontWeight: weight500, fontSize: 18),
                  size10,
                  Row(
                    children: [
                      textUbuntu("Top Keywords", kPrimaryPurple,fontSize: 18.0),
                      Expanded(
                          child: Divider(
                            color: kPrimaryPurple,
                            height: 2,
                          ))
                    ],
                  ),
                  size10,
                  Container(
                    height: size.height/4,
                    child: GridView.builder(
                      //physics: NeverScrollableScrollPhysics(),
                      itemCount: topKeywords.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 5 / 1, crossAxisCount: 2, crossAxisSpacing: 3.0, mainAxisSpacing: 4.0),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            height: 40,
                            decoration: containerBoxDecoration(borderRadius: 10.0, color: kPrimaryPurple.withOpacity(0.3)),
                            child: Center(child: textUbuntu(topKeywords[index], kBlackColor, fontWeight: weight500,fontSize: 20)));
                      },
                    ),
                  ),
                  // size10,
                  PieChartSample2(containerHeight: 230.0,textSize: 20.0,radius: 70.0,iconSize: 18.0,titleSize: 20.0,),
                  size10,

                  Obx(() => BusinessStayTimeWidget(
                    size: size,
                    height: size.height/7,
                    titleText: 20.0,
                    minValue: "${businessController.activeStay.value??0}",
                    title: "Customer Active Stay",
                    minValueSize: 40.0,
                    minSize: 22.0,
                    color: kPrimaryPurple,
                    minValueColor: kWhiteColor,
                    minTextColor: kWhiteColor,
                    titleColor: kWhiteColor,
                  )),
                  size10,
                  Obx(() => BusinessStayTimeWidget(
                    size: size,
                    minValue: "${businessController.idleStay.value??0}",
                    height: size.height/7,
                    titleText: 20.0,
                    title: "Customer Idle Stay",
                    minValueSize: 40.0,
                    minSize: 22.0,
                    color: Colors.white,
                    minValueColor: kBlackColor,
                    minTextColor: kBlackColor,
                    titleColor: kBlackColor,
                  )),

                  size10,
                  VisitorByRegion(titleTextSize: 20.0,regionTitleTextSize: 20.0,regionTextSize: 18.0,countTextSize: 18.0,),
                  size10,
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}


class TabButton extends StatelessWidget {
  final String text;
  final int selectedPage;
  final int pageNumber;
  final IconData icon;
  final Function onPressed;
  final Color color;
  var height;
  var width;
  var fontSize;

  TabButton({this.text, this.selectedPage, this.pageNumber, this.icon, this.onPressed, this.color,this.height,this.width,this.fontSize});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        height:  50.0,
        width:  width?? 100.0,
        duration: Duration(milliseconds: 100),
        curve: Curves.fastLinearToSlowEaseIn,
        child: Column(
          children: [
            Container(
              height: height??30,
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: containerBoxDecoration(borderRadius: 10.0, color: color, boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ]),
              child: Center(
                child: textUbuntu(text, Colors.white, fontWeight: weight500,fontSize: fontSize??16),
              ),
            ),
            selectedPage == pageNumber
                ? Icon(
                    Icons.keyboard_arrow_down,
                    color: color,
                  )
                : Text("")
          ],
        ),
      ),
    );
  }
}
