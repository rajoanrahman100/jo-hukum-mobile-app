import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashController extends GetxController{
  var page = 0.obs;
  var controller = PageController().obs;




  changePage(int pageNum) {
    page.value = pageNum;
    controller.value.animateToPage(
      pageNum,
      duration: Duration(milliseconds: 1000),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }
}