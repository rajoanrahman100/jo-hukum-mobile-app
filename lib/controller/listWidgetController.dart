import 'package:get/get.dart';
import 'package:johukum/screens/addBusiness/monileNumbersModel.dart';

class ListWidgetController extends GetxController {
  var list = [].obs;

  var nameTitle="Mr.".obs;
  var designationTitle="Owner.".obs;

  var openTime = "9.00 am".obs;
  var closeTime = "9.00 pm".obs;

  var questionList = [].obs;

  var addNoOne = false.obs;
  var addNoTwo = false.obs;

  var addQuestionOne = false.obs;
  var addQuestionTwo = false.obs;
  var addQuestionThree = false.obs;
  var addQuestionFour= false.obs;

  var mobileNumbers=[].obs;
  //var mobileNumbers=List<MobileNumberModel>().obs;

  List<WeekDays> weekDaysList=weekList.obs;

  changeStatus(index){
    weekDaysList[index].selected.value=!weekDaysList[index].selected.value;
    print(weekDaysList[index].selected);
  }


  addNumbers(value){
    mobileNumbers.add(value);
    print(mobileNumbers.length);
    print(mobileNumbers);

    mobileNumbers.forEach((element) {
      print("element $element");
    });
  }


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

class WeekDays {

  String title;
  RxBool selected;

  WeekDays({this.title,this.selected});


}

List<WeekDays> weekList=[
  WeekDays(title: "Sat",selected: true.obs),
  WeekDays(title: "Sun",selected: true.obs),
  WeekDays(title: "Mon",selected: true.obs),
  WeekDays(title: "Tue",selected: true.obs),
  WeekDays(title: "Wed",selected: true.obs),
  WeekDays(title: "Thu",selected: true.obs),
  WeekDays(title: "Fri",selected: false.obs),
];