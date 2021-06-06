import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBarWidget extends StatelessWidget {

  double ratingInit;
  Color ratingColor;
  double size;

  RatingBarWidget({this.ratingInit,this.ratingColor,this.size});

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: ratingInit??0.0,
      minRating: 0,
      itemSize: size??16.0,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: ratingColor??Colors.amber,
      ),
    );
  }
}