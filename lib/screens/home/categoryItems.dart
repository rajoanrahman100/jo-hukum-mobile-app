import 'package:flutter/material.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/widgets/textWidgets.dart';

class CategoryItems extends StatelessWidget {
  const CategoryItems({
    Key key,
    @required this.trending,
    @required this.title,
  }) : super(key: key);

  final String trending;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 110,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: kPrimaryPurple.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(trending,height: 60,color: kPrimaryPurple,),
          SizedBox(height: 7.0,),
          Text(title,style: textStyleUbuntu(color: kPrimaryPurple,fontSize: 16.0,fontWeight: weight500),)
        ],
      ),
    );
  }
}
