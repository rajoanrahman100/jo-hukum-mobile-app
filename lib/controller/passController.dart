import 'package:get/get.dart';

class PassWordController extends GetxController{

  var showPass=false.obs;
  var showConfirmPass=false.obs;

  showPassWord(){
    showPass.value=!showPass.value;
  }

  showConfirmPassWord(){
    showConfirmPass.value=!showConfirmPass.value;
  }



}