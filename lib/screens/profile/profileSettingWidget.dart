import 'package:flutter/material.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/widgets/textWidgets.dart';

class ProfileSettingsOptions extends StatelessWidget {

  String title;
  IconData icon;

  ProfileSettingsOptions({this.title,this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: textStyleUbuntu(
                color: kBlackColor.withOpacity(0.5),
                fontWeight: weight400,
                fontSize: 18),
          ),
          Icon(
            icon,
            color: kBlackColor.withOpacity(0.5),
            size: 17.0,
          )
        ],
      ),
    );
  }
}
