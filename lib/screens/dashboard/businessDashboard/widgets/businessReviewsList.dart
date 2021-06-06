import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/controller/dashBoardController/singleBusinessAllDataController.dart';
import 'package:johukum/widgets/textWidgets.dart';
import 'package:timeago/timeago.dart' as timeago;

class BusinessReviewsWidget extends StatelessWidget {
  const BusinessReviewsWidget({
    Key key,
    @required this.c,
  }) : super(key: key);

  final SingleBusinessAllDataController c;

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 500,
      child: ListView.builder(
        itemCount: c.reviewList.length,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (_, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      c.reviewList[index].addedBy,
                      style: textStyleUbuntu(color: kPrimaryPurple, fontWeight: weight500, fontSize: 18),
                    ),
                    RatingBar.builder(
                      initialRating: c.reviewList[index].rating.toDouble(),
                      itemSize: 16.0,
                      allowHalfRating: true,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: kPrimaryPurple,
                      ),
                    ),
                  ],
                ),
                size5,
                Row(
                  children: [
                    textUbuntu(
                        "${timeago.format(DateTime.parse(c.reviewList[index].reviewedAt))}",
                        kBlackColor.withOpacity(0.4),fontSize: 14)
                  ],
                ),
                size10,
                Text(
                  c.reviewList[index].comment,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: textStyleUbuntu(color: kBlackColor, fontWeight: weight400, fontSize: 16.0),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
