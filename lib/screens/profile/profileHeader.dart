import 'package:flutter/material.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/widgets/textWidgets.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    Key key,
    @required this.profile,
  }) : super(key: key);

  final String profile;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [

          boxStorage.read(KEY_TOKEN) == null
              ? Text(
                  "Guest Login",
                  style: textStyleUbuntu(color: kBlackColor, fontSize: 20.0, fontWeight: weight500),
                )
              : Text(
                  boxStorage.read(KEY_USER_NAME),
                  style: textStyleUbuntu(color: kBlackColor, fontSize: 20.0, fontWeight: weight500),
                ),

          SizedBox(
            width: 10.0,
          ),
          Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kPrimaryPurple,
            ),
            child: Center(
              child: Icon(
                Icons.edit,
                color: kWhiteColor,
                size: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
