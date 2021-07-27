import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/widgets/textWidgets.dart';

class TimeSetWidget extends StatelessWidget {
  String hrSet;
  Function callBack;

  TimeSetWidget({this.hrSet, this.callBack});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callBack,
      child: Container(
        height: 25,
        width: 80,
        decoration: BoxDecoration(border: Border.all(color: kBlackColor), borderRadius: BorderRadius.circular(5.0)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textUbuntu("$hrSet", kPrimaryPurple, fontSize: 14.0, fontWeight: weight500),
              Icon(
                Icons.arrow_drop_down,
                color: kPrimaryPurple,
                size: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}


Future<DateTime> timerWidget(BuildContext context, {Function onConfirm}) {
  return DatePicker.showTime12hPicker(context,
      showTitleActions: true, onConfirm: onConfirm, currentTime: DateTime(2008, 12, 31, 9, 00, 34));
}