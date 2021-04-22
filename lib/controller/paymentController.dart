import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:johukum/components/apis.dart';
import 'dart:convert';
import 'package:johukum/modelClass/paymentModel.dart';

class PaymentController extends GetxController{

  var paymentModelClass=PaymentModelClass().obs;

  var paymentList=[].obs;


  onSelect(item,bool value){
    print("select");
    paymentList.add(item);
    print("add length${paymentList.length}");

  }

  onRemove(item,bool value){
    paymentList.remove(item);
    print("remove length${paymentList.length}");

  }


  Future<void> fetchPayment() async {
    // make GET request
    var response = await get(Uri.parse(paymentMethod));

    print("Response = " + response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      var dataMap = jsonDecode(response.body);
      PaymentModelClass paymentDataClass = PaymentModelClass.fromJson(dataMap);
      paymentModelClass.value = paymentDataClass;
    } else {
      throw ("Error code " + response.statusCode.toString());
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchPayment();
  }

}