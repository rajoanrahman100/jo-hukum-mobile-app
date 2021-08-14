import 'package:get/get.dart';

class BusinessDataController extends GetxController{

  var annualTurnOver="".obs;
  var numberOfEmployee="".obs;
  var professAssc="".obs;
  var certificate="".obs;
  var selectBusinessType="".obs;

  var selectYear="select year".obs;


  setSelectedYear(value){
    selectYear.value=value;
  }

  setAnnualTurnOver(value){
    annualTurnOver.value=value;
  }

  setEmployeeNumber(value){
    numberOfEmployee.value=value;
  }

  setAssc(value){
    professAssc.value=value;
  }

  setCertificate(value){
    certificate.value=value;
  }

  setBusinessType(value){
    selectBusinessType.value=value;
  }
}
