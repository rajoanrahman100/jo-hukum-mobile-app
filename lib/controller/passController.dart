import 'package:get/get.dart';

class PassWordController extends GetxController{

  var showPass=false.obs;
  var showConfirmPass=false.obs;

  var showLonInPass=false.obs;

  showPassWord(){
    showPass.value=!showPass.value;
  }

  showLogInPassWord(){
    showLonInPass.value=!showLonInPass.value;
  }

  showConfirmPassWord(){
    showConfirmPass.value=!showConfirmPass.value;
  }



}