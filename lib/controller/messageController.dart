import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:johukum/components/apis.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/widgets/customToast.dart';
import 'package:johukum/widgets/johukumLoader.dart';

class MessageController extends GetxController {

/*  sendMessage() async {
    var response = await post(Uri.parse(addBusiness), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': boxStorage.read(KEY_TOKEN),
    }, body: {

    });
  }*/


  void sendMessage(businessID,message,context)async{

    print("--------Calling------------");
    log("------User token ${boxStorage.read(KEY_TOKEN)}");
    JohukumLoaderAnimation.showLoaderAnimation(context: context, colorTextBottom: kWhiteColor);

    var result;

    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': boxStorage.read(KEY_TOKEN),

    };
    var uri = Uri.parse("$sendMessageToBusiness/$businessID/messages/");
    var request = new http.MultipartRequest("POST", uri);
    request.headers.addAll(headers);

   /* if (imageFile != null) {
      var stream = new http.ByteStream(imageFile.openRead());
      var length = await imageFile.length();
      var multipartFile = new http.MultipartFile('profile_image', stream, length,
          filename: imageFile.path);
      request.files.add(multipartFile);
    }*/

    request.fields.addAll({
      "message":message,
    });

    var response = await request.send();

    await response.stream.transform(utf8.decoder).listen((value) {
      result = value;
    });

    if(response.statusCode==200 || response.statusCode==201){
      JohukumLoaderAnimation.hideRokkhiLoaderAnimation(context);
      showSuccessToast("Send message successfully");
      Map<String,dynamic> dataMap=json.decode(result);
      print(dataMap);
    }else{
      JohukumLoaderAnimation.hideRokkhiLoaderAnimation(context);
      print(response.statusCode);
      print(result);
    }


  }
}
