import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:johukum/components/apis.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/controller/dashBoardController/businessReviewsController.dart';
import 'package:johukum/modelClass/ratingCountModel.dart';
import 'package:johukum/widgets/textWidgets.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ReviewDashBoardBusiness extends StatefulWidget {
  @override
  _ReviewDashBoardBusinessState createState() => _ReviewDashBoardBusinessState();
}

class _ReviewDashBoardBusinessState extends State<ReviewDashBoardBusiness> {
  var ratingValue = 4.0;

  var ratingList=[];


  var txt = "Loren gypsum dolor sit mate, ad prompts feud gait, quid exercise emeritus bis e.Usu cu ores quid am, me "
      "rides sapper croquet ex. Ed ea clit a elect ram referent,at diode imper diet enc";

  var ratingCountController = Get.put(BusinessRatingController());

  @override
  void initState() {
    // TODO: implement initState
    //ratingCountController.getRatingData("602ce10270050b2691a99bcc");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 6,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: size.height,
                        width: size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            textUbuntu("$ratingValue", kBlackColor, fontWeight: weight500, fontSize: 35),
                            RatingBar.builder(
                              initialRating: ratingValue,
                              minRating: 1,
                              itemSize: 16.0,
                              direction: Axis.horizontal,
                              allowHalfRating: false,
                              itemCount: 5,
                              //itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: kPrimaryPurple,
                              ),
                            ),
                            size5,
                            textUbuntu("( 30 review )", kBlackColor, fontWeight: weight400),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: FutureBuilder<List<BusinessRatingCount>>(
                          future: getRatingData("602ce10270050b2691a99bcc"),
                          builder: (ctx, snapshot) {
                            // Checking if future is resolved or not
                            if (snapshot.connectionState == ConnectionState.done) {
                              // If we got an error
                              if (snapshot.hasError) {
                                return Center(
                                  child: Text(
                                    '${snapshot.error} occured',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                );

                                // if we got our data
                              } else if (snapshot.hasData) {
                                // Extracting data from snapshot object
                                // final data = snapshot.data;
                                print("snapShot Data: ${snapshot.data}");
                                return Container(
                                  //height:MediaQuery.of(context).size.height/4,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0, 3), // changes position of shadow
                                        ),
                                      ],
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      color: Colors.white),
                                  child: SfCartesianChart(primaryXAxis: CategoryAxis(),series: <ChartSeries>[
                                    BarSeries<BusinessRatingCount, int>(
                                        dataSource: snapshot.data,
                                        width: 0.4,
                                        // Width of the bars
                                        spacing: 0.2,
                                        pointColorMapper:(BusinessRatingCount line, _) => line.color,
                                        borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight:
                                        Radius.circular(10.0)),
                                        xValueMapper: (BusinessRatingCount line, _) => line.rating.toInt(),
                                        yValueMapper: (BusinessRatingCount line, _) => line.count.toInt())
                                  ],),
                                );
                              }
                            }

                            // Displaying LoadingSpinner to indicate waiting state
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        ),

                    )
                  ],
                ),
              ),
              Container(
                height: size.height / 6,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ], color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textUbuntu("Ratul Rahman", kPrimaryPurple, fontWeight: weight500),
                              size5,
                              textUbuntu("5 minit ago", kPrimaryPurple.withOpacity(0.6)),
                            ],
                          ),
                          RatingBar.builder(
                            initialRating: 5.0,
                            minRating: 1,
                            itemSize: 16.0,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            itemCount: 5,
                            //itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: kPrimaryPurple,
                            ),
                          )
                        ],
                      ),
                      size10,
                      textUbuntu(txt, kPrimaryPurple.withOpacity(0.7), maxLine: 5)
                    ],
                  ),
                ),
              ),
              size10,


            ],
          ),
        ),
      ),
    );
  }

  Future<List<BusinessRatingCount>> getRatingData(businessId) async {
    var response = await get(Uri.parse(reviewCountApi + "$businessId" + "/ratings-count/"), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization':
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI1ZmYwNzNjOTI2NGVmNTU3ZjEwNzkxYzciLCJlbWFpbCI6InJhZmFlYXR1bDJAZ21haWwuY29tIiwibW9iaWxlX251bWJlciI6IjAxOTU2MzIwNTY3IiwiaXNfYWN0aXZlIjp0cnVlLCJkYXRlX2pvaW5lZCI6IjIwMjEtMDEtMDJUMTM6MjM6MjEuMDk0WiIsInNob3BfdWlkIjoxOSwiYm9va2luZ191aWQiOm51bGwsImlhdCI6MTYxODgyMTEzMn0.01J0SBCPPQpc9rc-MN2cMEf2gdGWX0z-c09MCHhrv9g',
    });

    print("Response rating value= " + response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      var dataMap = jsonDecode(response.body) as List;
      ratingList= dataMap.map((tagJson) => BusinessRatingCount.fromJson(tagJson)).toList();
      return ratingList;

    } else {
      throw ("Error code " + response.statusCode.toString());
    }
  }
}
