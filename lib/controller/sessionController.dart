import 'dart:convert';

import 'package:get/get.dart';
import 'package:johukum/components/apis.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/modelClass/sessionModel.dart';
import 'package:wifi_info_flutter/wifi_info_flutter.dart';
import 'package:http/http.dart' as http;

class SessionController extends GetxController{

  var deviceIp="".obs;

  var sessionModelData=SessionModel().obs;

  getDeviceIP()async{
    deviceIp.value = await WifiInfo().getWifiIP();
    print("IP $deviceIp");
  }



  Future<void> getSessionWithoutIDData()async{
    var res = await http.post(Uri.parse(sessionIP),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },

        body:jsonEncode(<String, dynamic>{
          "ip": boxStorage.read(DEVICE_IPI),
          "state": "Dhaka",
          "country": "Bangladesh",
          "device_type": "mobile"
          //"user_id": "optional (only user logged in thakle pathaben"
        }));
    if(res.statusCode==200 || res.statusCode==201){
      print(res.body);

      var data=jsonDecode(res.body);

      SessionModel sessionModel=SessionModel.fromJson(data);
      sessionModelData.value=sessionModel;
      boxStorage.write(SESSION_ID, sessionModel.sId);

    }else{
      print("error ${res.body}");
    }
  }

  Future<void> getSessionWithIDData(userID)async{
    var res = await http.post(Uri.parse(sessionIP),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },

        body:jsonEncode(<String, dynamic>{
          "ip": boxStorage.read(DEVICE_IPI),
          "state": "Dhaka",
          "country": "Bangladesh",
          "device_type": "mobile",
          "user_id": userID
        }));
    if(res.statusCode==200){

      var data=jsonDecode(res.body);
      print(res.body);

      SessionModel sessionModel=SessionModel.fromJson(data);
      sessionModelData.value=sessionModel;
      boxStorage.write(SESSION_ID, sessionModel.sId);
    }else{
      print(res.statusCode);
      print("error ${res.body}");
    }
  }
}