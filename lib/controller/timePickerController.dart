import 'package:get/get.dart';

class TimePickerController extends GetxController{

  var startTime="9 am".obs;
  var endTime="10 pm".obs;

  var startLeisureTime="No Time Select".obs;
  var endLeisureTime="No Time Select".obs;


  setStartTime(selectStartTime){
    startTime.value=selectStartTime;
  }

  setEndTime(selectEndTime){
    endTime.value=selectEndTime;
  }


  leisureStartTime(startLTime){
    startLeisureTime.value=startLTime;
  }

  leisureEndTime(endLTime){
    endLeisureTime.value=endLTime;
  }

}