import 'package:get/get.dart';

class ContactDetailsSettingController extends GetxController{

  var addedMobileNumber=[].obs;

  addMoreNumbers(value){
    addedMobileNumber.add(value);
  }
}