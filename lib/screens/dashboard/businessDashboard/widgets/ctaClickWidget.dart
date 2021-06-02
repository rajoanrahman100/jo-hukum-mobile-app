import 'package:flutter/material.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/widgets/textWidgets.dart';

class CtaCountWidget extends StatelessWidget {
  const CtaCountWidget({
    Key key,
    @required this.size,
    @required this.count,
    @required this.title,
    @required this.color,
  }) : super(key: key);

  final Size size;
  final int count;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          height: size.height / 12,
          decoration: containerBoxDecoration(borderRadius: 10, color: color.withOpacity(0.6)),
          child: Row(
            mainAxisAlignment: mainAxisAlignmentCenter,
            children: [
              textUbuntu("$count", Colors.white, fontWeight: weight500, fontSize: 30),
              width10,
              Row(
                children: [
                  Icon(
                    Icons.circle,
                    color: Colors.white,
                    size: 12,
                  ),
                  textUbuntu(" $title", Colors.white, fontWeight: weight500),
                ],
              )
            ],
          )),
    );
  }
}
