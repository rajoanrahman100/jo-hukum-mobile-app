import 'package:get/get.dart';

class BusinessDataController extends GetxController{

  var annualTurnOver="select".obs;
  var numberOfEmployee="select".obs;
  var professAssc="select".obs;
  var certificate="select".obs;
  var selectBusinessType="select business type".obs;

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
