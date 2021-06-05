import 'package:flutter/material.dart';

class LineModel{
  var date;
  var count;
  Color color=Colors.red;

  LineModel({this.date,this.count,this.color});

  @override
  String toString() {
    return '{ ${this.date}, ${this.count} }';
  }
}