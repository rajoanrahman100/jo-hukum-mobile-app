import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BusinessDashBoardTabsController extends GetxController{

  var page = 0.obs;
  var controller = PageController().obs;


  @override
  void dispose(){
    print('dispose');
    controller.close();
    super.dispose();
  }

  changePage(int pageNum) {
    page.value = pageNum;
    controller.value.animateToPage(
      pageNum,
      duration: Duration(milliseconds: 1000),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

}