import 'package:flutter/material.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/widgets/textWidgets.dart';

class NoInterConnectionWidget extends StatelessWidget {
  const NoInterConnectionWidget({
    Key key,
    @required this.size,
    @required this.height,
  }) : super(key: key);

  final Size size;
  final height;

  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.bottomCenter,child: Container(
      height: height??45.0,width:size.width,color: kPrimaryPurple,
      child: Center(child: textUbuntu("No Internet Connection Found", Colors.white)),
    ),);
  }
}