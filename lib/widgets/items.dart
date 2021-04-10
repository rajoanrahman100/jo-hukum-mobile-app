import 'package:flutter/cupertino.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/widgets/textWidgets.dart';

class Items extends StatelessWidget {
  const Items({
    Key key,
    @required this.topRated,
    @required this.title,
    this.callBack,
  }) : super(key: key);

  final String topRated;
  final String title;
  final Function callBack;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:callBack,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(topRated, height: 50),
          SizedBox(
            height: 5.0,
          ),
          Text(
            title,
            style: textStyleUbuntu(
                color: kPrimaryPurple, fontWeight: FontWeight.w400, fontSize: 13),
          )
        ],
      ),
    );
  }
}
