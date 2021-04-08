import 'package:flutter/material.dart';
import 'file:///C:/Users/Rifat/AndroidStudioProjects/johukum/lib/components/components.dart';

import 'home/homeScreen.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  PageController pageController;
  var getPageIndex = 0;

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
        onPressed: () {},
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
            BottomNavigationBarItem(
                icon: Icon(Icons.article), label: ''),
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