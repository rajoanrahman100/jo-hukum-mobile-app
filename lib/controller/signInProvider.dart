import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:johukum/components/apis.dart';
import 'package:johukum/widgets/johukumLoader.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class SignInProvider extends ChangeNotifier {



  Future getSignInUser(mobileNumber, password, context) async {
    JohukumLoaderAnimation.showLoaderAnimation(context: context);
    var res = await http.post(signIn,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{"mobile_number": mobileNumber, "password": password}));

    if (res.statusCode == 200 || res.statusCode == 201) {
      print("succes response " + res.body);
      JohukumLoaderAnimation.hideRokkhiLoaderAnimation(context);
      return;
    } else {
      print("error response " + res.body);
      JohukumLoaderAnimation.hideRokkhiLoaderAnimation(context);
      return;
    }
  }
}
