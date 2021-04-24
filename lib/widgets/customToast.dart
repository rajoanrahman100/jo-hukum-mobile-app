import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:johukum/components/components.dart';

void showToast(String message) {
  CustomToast(message).show();

}

void showErrorToast(String message) {
  CustomToast(message,bgColor: kPrimaryPurple).show();

}

void showSuccessToast(String message) {
  CustomToast(message,bgColor: Colors.deepPurple).show();

}

class CustomToast {
  final String message;
  Toast length = Toast.LENGTH_LONG;
  ToastGravity gravity = ToastGravity.BOTTOM;
  double fontSize = 16.0;
  Color bgColor = Colors.black87;
  Color txtColor = Colors.white;

  CustomToast(this.message, {this.bgColor, this.txtColor, this.fontSize, this.length, this.gravity}) : super();

  void show() {
    Fluttertoast.showToast(
        msg: message, backgroundColor: bgColor, toastLength: length, gravity: gravity, textColor: txtColor, fontSize: fontSize);
  }
}


showSnackBar({BuildContext context, String message}){

  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    action: SnackBarAction(
      label: '',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  )
  );

}