import 'package:get/get.dart';

class ListWidgetController extends GetxController {
  var list = [].obs;

  var questionList = [].obs;

  var addNoOne = false.obs;
  var addNoTwo = false.obs;

  var addQuestionOne = false.obs;
  var addQuestionTwo = false.obs;
  var addQuestionThree = false.obs;
  var addQuestionFour= false.obs;

  setQuestionCount(int value) {
    if (value == 1) {
      addQuestionOne.value=true;
    }if(value==2){
      addQuestionTwo.value=true;
    }if(value==3){
      addQuestionThree.value=true;
    }
  }

  addWidget(item) {
    list.add(item);
  }

  removeWidget(item) {
    list.removeAt(item);
  }

  addQuestionWidget(item) {
    questionList.add(item);
  }

  removeQuestionWidget(item) {
    questionList.removeAt(item);
  }
}
