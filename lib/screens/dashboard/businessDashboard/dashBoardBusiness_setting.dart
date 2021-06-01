import 'package:flutter/material.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/widgets/textWidgets.dart';

class SettingDashBoardBusiness extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  textUbuntu("Setting", kPrimaryPurple),
                  Expanded(child: Divider(color: kPrimaryPurple,height: 2,))
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}