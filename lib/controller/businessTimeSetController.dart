import 'package:get/get.dart';

class BusinessTimeController extends GetxController {
  var open24check = false.obs;
  var satCheck = true.obs;
  var sunCheck = true.obs;
  var monCheck = true.obs;
  var tueCheck = true.obs;
  var wedCheck = true.obs;
  var thuCheck = true.obs;
  var friCheck = false.obs;



  ///Time set controller

  var satStartTime = "9.00 am".obs;
  var sunStartTime = "9.00 am".obs;
  var monStartTime = "9.00 am".obs;
  var tueStartTime = "9.00 am".obs;
  var wedStartTime = "9.00 am".obs;
  var thursStartTime = "9.00 am".obs;
  var friStartTime = "9.00 am".obs;


  var satEndTime = "10.00 pm".obs;
  var sunEndTime = "10.00 pm".obs;
  var monEndTime = "10.00 pm".obs;
  var tueEndTime = "10.00 pm".obs;
  var wedEndTime = "10.00 pm".obs;
  var thursEndTime = "10.00 pm".obs;
  var friEndTime = "10.00 pm".obs;

  setWeeklyStartHour(String weekDays, startTime) {
    switch (weekDays) {
      case "Sat":
        satStartTime.value = startTime;
        break;
      case "Sun":
        sunStartTime.value = startTime;
        break;
      case "Mon":
        monStartTime.value = startTime;
        break;
      case "Tue":
        tueStartTime.value = startTime;
        break;
      case "Wed":
        wedStartTime.value = startTime;
        break;
      case "Thurs":
        thursStartTime.value = startTime;
        break;
      case "Fri":
        friStartTime.value = startTime;
        break;
    }
  }


  setWeeklyEndHour(String weekDays, endTime) {
    switch (weekDays) {
      case "Sat":
        satEndTime.value = endTime;
        break;
      case "Sun":
        sunEndTime.value = endTime;
        break;
      case "Mon":
        monEndTime.value = endTime;
        break;
      case "Tue":
        tueEndTime.value = endTime;
        break;
      case "Wed":
        wedEndTime.value = endTime;
        break;
      case "Thurs":
        thursEndTime.value = endTime;
        break;
      case "Fri":
        friEndTime.value = endTime;
        break;
    }
  }



  check24Hour() {
    open24check.value = !open24check.value;
  }

  checkSatHour() {
    satCheck.value = !satCheck.value;
  }

  checkSunHour() {
    sunCheck.value = !sunCheck.value;
  }

  checkMonHour() {
    monCheck.value = !monCheck.value;
  }

  checkTueHour() {
    tueCheck.value = !tueCheck.value;
  }

  checkWedHour() {
    wedCheck.value = !wedCheck.value;
  }

  checkThursHour() {
    thuCheck.value = !thuCheck.value;
  }

  checkFriHour() {
    friCheck.value = !friCheck.value;
  }
}
