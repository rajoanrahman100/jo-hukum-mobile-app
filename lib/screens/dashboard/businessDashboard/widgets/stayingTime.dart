import 'package:flutter/material.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/widgets/textWidgets.dart';

class BusinessStayTimeWidget extends StatelessWidget {
  const BusinessStayTimeWidget({
    Key key,
    @required this.size,
    @required this.color,
    @required this.title,
    @required this.minValue,
    @required this.minValueColor,
    @required this.minTextColor,
    @required this.titleColor,
    @required this.height,
    @required this.titleText,
    @required this.minValueSize,
    @required this.minSize,
  }) : super(key: key);

  final Size size;
  final Color color;
  final String title;
  final String minValue;
  final Color minValueColor;
  final Color minTextColor;
  final Color titleColor;
  final height;
  final titleText;
  final minValueSize;
  final minSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height?? size.height / 7.5,
      width: size.width,
      decoration: containerBoxDecoration(color: color, borderRadius: 10,boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],),
      child: Column(
        children: [
          size5,
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: textUbuntu(title, titleColor, fontWeight: weight500,fontSize: titleText??16.0),
              )),
          size20,
          Row(
            mainAxisAlignment: mainAxisAlignmentCenter,
            children: [
              textUbuntu("${minValue ?? 0.0}", minValueColor, fontWeight: weight500, fontSize: minValueSize?? 35),
              textUbuntu(" min.", minTextColor, fontWeight: weight500, fontSize:minSize?? 18),
            ],
          ),
        ],
      ),
    );
  }
}
