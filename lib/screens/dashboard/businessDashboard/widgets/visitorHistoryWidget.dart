import 'package:flutter/material.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/widgets/textWidgets.dart';

class VisitorHistoryWidget extends StatelessWidget {
  const VisitorHistoryWidget(
      {Key key, @required this.size, @required this.visitorCount, @required this.title,
        @required this.color,@required this.height,@required this.titleFontSize,@required this.countFontSize})
      : super(key: key);

  final Size size;
  final int visitorCount;
  final String title;
  final Color color;
  final height;
  final titleFontSize;
  final countFontSize;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          height:height??size.height / 8,
          decoration: containerBoxDecoration(borderRadius: 10, color: color),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: textUbuntu("$title", Colors.white, fontWeight: weight500,fontSize: titleFontSize??16),
                ),
              ),
              Align(
                  alignment: Alignment.center,
                  child: textUbuntu("$visitorCount", Colors.white, fontWeight: weight500, fontSize: 30)),
            ],
          )),
    );
  }
}
