import 'package:flutter/material.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/screens/dashboard/businessDashboard/analyticsDashBoard/thisMonth.dart';
import 'package:johukum/screens/dashboard/businessDashboard/analyticsDashBoard/thisWeek.dart';
import 'package:johukum/screens/dashboard/businessDashboard/analyticsDashBoard/today.dart';
import 'package:johukum/screens/dashboard/businessDashboard/analyticsDashBoard/total.dart';
import 'package:johukum/screens/dashboard/businessDashboard/widgets/line_chart.dart';
import 'package:johukum/screens/dashboard/businessDashboard/widgets/pie_chart.dart';
import 'package:johukum/widgets/textWidgets.dart';

class AnalyticsDashBoardTabs extends StatefulWidget {
  @override
  _AnalyticsDashBoardTabsState createState() => _AnalyticsDashBoardTabsState();
}

class _AnalyticsDashBoardTabsState extends State<AnalyticsDashBoardTabs> {
  var topKeywords = [
    "UX/UI design",
    "Graphic Design",
    "Movies",
    "Flutter/Dart",
    "Cross Platform",
    "Web Development "
        "and Design"
  ];
  int _selectedPage = 0;
  PageController _pageController;

  void _changePage(int pageNum) {
    setState(() {
      _selectedPage = pageNum;
      _pageController.animateToPage(
        pageNum,
        duration: Duration(milliseconds: 1000),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    });
  }

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TabButton(
                        text: "Today",
                        pageNumber: 0,
                        color: kPinkColor,
                        selectedPage: _selectedPage,
                        onPressed: () {
                          _changePage(0);
                        },
                      ),
                      TabButton(
                        text: "This Week",
                        pageNumber: 1,
                        selectedPage: _selectedPage,
                        color: kBlueColor,
                        onPressed: () {
                          _changePage(1);
                        },
                      ),
                      TabButton(
                        text: "This Month",
                        pageNumber: 2,
                        selectedPage: _selectedPage,
                        color: kAquaGreenColor,
                        onPressed: () {
                          _changePage(2);
                        },
                      ),
                      TabButton(
                        text: "Total",
                        pageNumber: 3,
                        selectedPage: _selectedPage,
                        color: kYellowColor,
                        onPressed: () {
                          _changePage(3);
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  height: size.height / 3.2,
                  child: PageView(

                    onPageChanged: (int page) {
                      setState(() {
                        _selectedPage = page;
                      });
                    },
                    controller: _pageController,
                    children: [Today(), ThisWeek(), ThisMonth(), Total()],
                  ),
                ),

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
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 5 / 1, crossAxisCount: 2, crossAxisSpacing: 3.0, mainAxisSpacing: 4.0),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          height: 40,
                          decoration:
                              containerBoxDecoration(borderRadius: 10.0, color: kPrimaryPurple.withOpacity(0.3)),
                          child: Center(child: textUbuntu(topKeywords[index], kBlackColor, fontWeight: weight500)));
                    },
                  ),
                ),
                // size10,
                PieChartSample2(),
                size10,
                Container(
                  height: size.height / 7.5,
                  width: size.width,
                  decoration: containerBoxDecoration(color: kPrimaryPurple, borderRadius: 10),
                  child: Column(
                    children: [
                      size5,
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: textUbuntu("Customers Average Active Stay", kWhiteColor, fontWeight: weight500),
                          )),
                      size20,
                      Row(
                        mainAxisAlignment: mainAxisAlignmentCenter,
                        children: [
                          textUbuntu("8.3", kWhiteColor, fontWeight: weight500, fontSize: 35),
                          textUbuntu(" min.", kWhiteColor, fontWeight: weight500, fontSize: 18),
                          width10,
                          textUbuntu("(", kWhiteColor, fontSize: 18, fontWeight: weight500),
                          Icon(
                            Icons.trending_up,
                            color: Colors.green,
                          ),
                          textUbuntu(" +2.4%", kWhiteColor, fontWeight: weight500, fontSize: 18),
                          textUbuntu(")", kWhiteColor, fontSize: 18, fontWeight: weight500),
                        ],
                      ),
                    ],
                  ),
                ),
                size10,
                Container(
                  height: size.height / 7.5,
                  width: size.width,
                  decoration: containerBoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: 10),
                  child: Column(
                    children: [
                      size5,
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: textUbuntu("Customers Idle Active Stay", kBlackColor, fontWeight: weight500),
                          )),
                      size20,
                      Row(
                        mainAxisAlignment: mainAxisAlignmentCenter,
                        children: [
                          textUbuntu("5.3", kBlackColor.withOpacity(0.5), fontWeight: weight500, fontSize: 35),
                          textUbuntu(" min.", kBlackColor.withOpacity(0.5), fontWeight: weight500, fontSize: 18),
                          width10,
                          textUbuntu("(", kBlackColor.withOpacity(0.5), fontSize: 18, fontWeight: weight500),
                          Icon(Icons.trending_down, color: Colors.red),
                          textUbuntu(" -0.8%", kBlackColor.withOpacity(0.5), fontWeight: weight500, fontSize: 18),
                          textUbuntu(")", kBlackColor.withOpacity(0.5), fontSize: 18, fontWeight: weight500),
                        ],
                      ),
                    ],
                  ),
                ),
                size10,
                Container(
                  height: size.height / 3,
                  width: size.width,
                  decoration: containerBoxDecoration(borderRadius: 10.0, color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    )
                  ]),
                  child: Column(
                    crossAxisAlignment: crossAxisAlignmentStart,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: textUbuntu("Visitors By Region", kBlackColor, fontWeight: weight500),
                      )
                    ],
                  ),
                ),
                size10,

              ],
            ),
          ),
        ),
      ),
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

  TabButton({this.text, this.selectedPage, this.pageNumber, this.icon, this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        //height: 30,
        width: 100,

        duration: Duration(milliseconds: 100),

        curve: Curves.fastLinearToSlowEaseIn,

        child: Column(
          children: [
            Container(
              height: 30,
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
                child: textUbuntu(text, kWhiteColor, fontWeight: weight500),
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
