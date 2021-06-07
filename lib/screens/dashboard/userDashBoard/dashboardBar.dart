import 'package:flutter/material.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/screens/dashboard/businessDashboard/analyticsDashBoard/analyticsDashBoardTabs.dart';
import 'package:johukum/screens/dashboard/businessDashboard/dashBoardBusiness_analytics.dart';
import '../businessDashboard/dashBoardBusiness_home.dart';
import '../businessDashboard/dashBoardBusiness_message.dart';
import '../businessDashboard/dashBoardBusiness_review.dart';
import '../businessDashboard/dashBoardBusiness_save.dart';
import '../businessDashboard/dashBoardBusiness_setting.dart';
import 'package:johukum/widgets/textWidgets.dart';

class UserDashBoardTabs extends StatefulWidget {
  @override
  _UserDashBoardTabsState createState() => _UserDashBoardTabsState();
}

class _UserDashBoardTabsState extends State<UserDashBoardTabs> {

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
    return SafeArea(
      child: Scaffold(
        appBar:AppBar(
          backgroundColor: kPrimaryPurple,
          title: Text(
            "Business Dashboard",
            style: textStyleUbuntu(color: kWhiteColor),
          ),
          iconTheme: IconThemeData(color: kWhiteColor),
        ),
        body:Responsive(
          mobile: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 75,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TabButton(
                          text: "First Tab",
                          pageNumber: 0,
                          selectedPage: _selectedPage,
                          icon: Icons.home,
                          onPressed: () {
                            _changePage(0);
                          },
                        ),
                        TabButton(
                          text: "Sixth Tab",
                          pageNumber: 1,
                          selectedPage: _selectedPage,
                          icon: Icons.analytics,
                          onPressed: () {
                            _changePage(1);
                          },
                        ),
                        TabButton(
                          text: "Second Tab",
                          pageNumber: 2,
                          selectedPage: _selectedPage,
                          icon: Icons.email,
                          onPressed: () {
                            _changePage(2);
                          },
                        ),
                        TabButton(
                          text: "Third Tab",
                          pageNumber: 3,
                          selectedPage: _selectedPage,
                          icon: Icons.reviews,
                          onPressed: () {
                            _changePage(3);
                          },
                        ),
                        TabButton(
                          text: "Fourth Tab",
                          pageNumber: 4,
                          selectedPage: _selectedPage,
                          icon: Icons.settings,
                          onPressed: () {
                            _changePage(4);
                          },
                        ),
                        TabButton(
                          text: "Fifth Tab",
                          pageNumber: 5,
                          selectedPage: _selectedPage,
                          icon: Icons.save,
                          onPressed: () {
                            _changePage(5);
                          },
                        ),

                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: PageView(
                    onPageChanged: (int page) {
                      setState(() {
                        _selectedPage = page;
                      });
                    },
                    controller: _pageController,
                    children: [
                      HomeDashBoardBusiness(),
                      AnalyticsDashBoardTabs(),
                      MessageDashBoardBusiness(),
                      ReviewDashBoardBusiness(),
                      SettingDashBoardBusiness(),
                      SaveDashBoardBusiness(),
                    ],
                  ),
                )
              ],
            ),
          ),
          tablet: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 95,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TabButton(
                          text: "First Tab",
                          pageNumber: 0,
                          selectedPage: _selectedPage,
                          icon: Icons.home,
                          height: 85.0,
                          width: 80.0,
                          iconSize: 28.0,
                          onPressed: () {
                            _changePage(0);
                          },
                        ),
                        TabButton(
                          text: "Sixth Tab",
                          pageNumber: 1,
                          selectedPage: _selectedPage,
                          icon: Icons.analytics,
                          height: 85.0,
                          width: 80.0,
                          iconSize: 28.0,
                          onPressed: () {
                            _changePage(1);
                          },
                        ),
                        TabButton(
                          text: "Second Tab",
                          pageNumber: 2,
                          selectedPage: _selectedPage,
                          icon: Icons.email,
                          height: 85.0,
                          width: 80.0,
                          iconSize: 28.0,
                          onPressed: () {
                            _changePage(2);
                          },
                        ),
                        TabButton(
                          text: "Third Tab",
                          pageNumber: 3,
                          selectedPage: _selectedPage,
                          icon: Icons.reviews,
                          height: 85.0,
                          width: 80.0,
                          iconSize: 28.0,
                          onPressed: () {
                            _changePage(3);
                          },
                        ),
                        TabButton(
                          text: "Fourth Tab",
                          pageNumber: 4,
                          selectedPage: _selectedPage,
                          icon: Icons.settings,
                          height: 85.0,
                          width: 80.0,
                          iconSize: 28.0,
                          onPressed: () {
                            _changePage(4);
                          },
                        ),
                        TabButton(
                          text: "Fifth Tab",
                          pageNumber: 5,
                          selectedPage: _selectedPage,
                          icon: Icons.save,
                          height: 85.0,
                          width: 80.0,
                          iconSize: 28.0,
                          onPressed: () {
                            _changePage(5);
                          },
                        ),

                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: PageView(
                    onPageChanged: (int page) {
                      setState(() {
                        _selectedPage = page;
                      });
                    },
                    controller: _pageController,
                    children: [
                      HomeDashBoardBusiness(),
                      AnalyticsDashBoardTabs(),
                      MessageDashBoardBusiness(),
                      ReviewDashBoardBusiness(),
                      SettingDashBoardBusiness(),
                      SaveDashBoardBusiness(),
                    ],
                  ),
                )
              ],
            ),
          ),
        )


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
  var height;
  var width;
  var iconSize;

  TabButton({this.text, this.selectedPage, this.pageNumber,this.icon,this.onPressed,this.height,this.width,this.iconSize});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        height:height??50,
        width: width??60,
        duration: Duration(
            milliseconds: 100
        ),
        curve: Curves.fastLinearToSlowEaseIn,
        decoration: BoxDecoration(
          color: selectedPage == pageNumber ? kPrimaryPurple : Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(
          vertical: selectedPage == pageNumber ? 12.0 : 12.0,
          horizontal: selectedPage == pageNumber ? 12.0 : 12.0,
        ),
        margin: EdgeInsets.symmetric(
          vertical: selectedPage == pageNumber ? 12.0 : 12.0,
          horizontal: selectedPage == pageNumber ? 12.0 : 12.0,
        ),
        child: Center(
          child: Icon(
            icon,color: selectedPage == pageNumber?Colors.white:kPrimaryPurple,
            size: iconSize??23,
          ),
        ),
      ),
    );
  }
}