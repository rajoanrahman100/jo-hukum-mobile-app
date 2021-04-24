import 'package:get/get.dart';

class ListWidgetController extends GetxController{

  var list=[].obs;

  var questionList=[].obs;

  addWidget(item){
    list.add(item);
  }

  removeWidget(item){
    list.removeAt(item);
  }

  addQuestionWidget(item){
    questionList.add(item);
  }

  removeQuestionWidget(item){
    questionList.removeAt(item);
  }
}