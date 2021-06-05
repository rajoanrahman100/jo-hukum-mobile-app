import 'package:flutter/cupertino.dart';
import 'package:johukum/components/components.dart';

class BusinessRatingCount {
  var count;
  var rating;
  Color color=kPrimaryPurple;

  BusinessRatingCount({this.count, this.rating,this.color});

  BusinessRatingCount.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['rating'] = this.rating;
    return data;
  }

  @override
  String toString() {
    return '{ ${this.count}, ${this.rating} }';
  }
}