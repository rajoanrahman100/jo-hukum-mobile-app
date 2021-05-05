import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/components/config.dart';
import 'package:get/get.dart';
import 'package:johukum/controller/businessProfileController.dart';
import 'package:johukum/screens/welcomeScreen/welcomeButtonWidget.dart';
import 'package:johukum/widgets/fullScreenAlertForAuth.dart';
import 'package:johukum/widgets/textWidgets.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class BusinessReview extends StatelessWidget {
  var reviews = [];
  var businesssID;
  var businessName;

  BusinessReview({this.reviews,this.businesssID,this.businessName});

  var ratingValue;
  var ratingController=TextEditingController();
  var c=Get.put(BusinessProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryPurple,
        actions: [
          boxStorage.read(KEY_TOKEN) == null
              ? GestureDetector(
                  onTap: () {
                    openAddAuthDialog(context);
                  },
                  child: Center(child: textUbuntu("Add", kWhiteColor, fontWeight: weight500, fontSize: 18)))
              : GestureDetector(
                  onTap: () {
                    showBarModalBottomSheet(
                      context: context,

                      builder: (context) => SingleChildScrollView(
                        controller: ModalScrollController.of(context),
                        child: Container(
                          height: MediaQuery.of(context).size.height*0.7,
                          color: kWhiteColor,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                size20,
                                textUbuntu(businessName,kPrimaryPurple,fontSize: 20,maxLine: 2,fontWeight: weight500),
                                size10,
                                RatingBar.builder(
                                  initialRating: 0.0,
                                  minRating: 0,
                                  itemSize: 40.0,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5, itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    ratingValue=rating.toString();
                                    print("User rating: " +  rating.toString());
                                  },
                                ),

                                size20,
                                Container(
                                  height: 130.0,
                                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0), color: Colors.grey.withOpacity(0.3)),
                                  child: TextFormField(
                                    maxLines: 8,
                                    controller: ratingController,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
                                      hintText: 'Write your review',
                                    ),
                                    onChanged: (str) => print('Multi-line text change: $str'),
                                  ),
                                ),

                                SizedBox(height: 40,),
                                WelcomeScreenButton(
                                  edgeInsetsGeometry: EdgeInsets.symmetric(horizontal: 50.0),
                                  buttonColor: kPrimaryPurple,
                                  buttonText: "Submit",
                                  textColor: kWhiteColor,
                                  fontSize: 16,
                                  isIcon: false,
                                  height: 50.0,
                                  callback: () {
                                    print(boxStorage.read(KEY_USER_ID));
                                    print(boxStorage.read(KEY_USER_NAME));

                                    c.postUserReview(businesssID, boxStorage.read(KEY_USER_ID),
                                        boxStorage.read(KEY_USER_NAME), ratingValue, ratingController.text, context)
                                        .then((value) => ratingController.clear());
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  child: Center(child: textUbuntu("Add", kWhiteColor, fontWeight: weight500, fontSize: 18))),
          Container(
            width: 15,
          )
        ],
        title: Text(
          "Reviews",
          style: textStyleUbuntu(color: kWhiteColor),
        ),
        iconTheme: IconThemeData(color: kWhiteColor),
      ),
      body: reviews.length == 0
          ? Center(child: textUbuntu("No Reviews Found", kPrimaryPurple, fontWeight: weightBold, fontSize: 20))
          : ListView.builder(
              itemCount: reviews.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            reviews[index].addedBy,
                            style: textStyleUbuntu(color: kPrimaryPurple, fontWeight: weight500, fontSize: 18),
                          ),
                          RatingBar.builder(
                            initialRating: reviews[index].rating.toDouble(),
                            itemSize: 18.0,
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                          ),
                        ],
                      ),
                      size5,
                      Row(
                        children: [
                          textUbuntu("${DateFormat.yMMMMd('en_US').format(DateTime.parse(reviews[index].reviewedAt))}",
                              kBlackColor.withOpacity(0.4))
                        ],
                      ),
                      size10,
                      Text(
                        reviews[index].comment,
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
