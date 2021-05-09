import 'package:get/get.dart';

class BusinessTagController extends GetxController{

  var tagList=[].obs;


  addTagList(value){
    print("length $tagList");
    tagList.add(value);
  }
}