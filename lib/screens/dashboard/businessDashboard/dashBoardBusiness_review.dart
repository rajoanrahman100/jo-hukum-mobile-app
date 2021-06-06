import 'dart:convert';
import 'package:johukum/screens/dashboard/businessDashboard/widgets/businessReviewsList.dart';
import 'package:johukum/screens/dashboard/businessDashboard/widgets/ratingWidget.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:johukum/components/apis.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/controller/dashBoardController/singleBusinessAllDataController.dart';
import 'package:johukum/modelClass/ratingCountModel.dart';
import 'package:johukum/widgets/textWidgets.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ReviewDashBoardBusiness extends StatefulWidget {
  @override
  _ReviewDashBoardBusinessState createState() => _ReviewDashBoardBusinessState();
}

class _ReviewDashBoardBusinessState extends State<ReviewDashBoardBusiness> {

  var ratingList = [];

  var c = Get.put(SingleBusinessAllDataController());
  var txt = "Loren gypsum dolor sit mate, ad prompts feud gait, quid exercise emeritus bis e.Usu cu ores quid am, me "
      "rides sapper croquet ex. Ed ea clit a elect ram referent,at diode imper diet enc";

  @override
  void initState() {
    // TODO: implement initState
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
                decoration: containerBoxDecoration(color: Colors.white, borderRadius: 10.0, boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ]),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Obx(()=>Container(
                        height: size.height,
                        width: size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            textUbuntu("${c.totalReviewAvg.value.toStringAsFixed(1)??0}", kBlackColor, fontWeight: weight500, fontSize: 35),
                            RatingBarWidget(
                              ratingInit: c.totalReviewAvg.value,
                              ratingColor: kPrimaryPurple,
                              size: 15.0,
                            ),
                            size5,
                            textUbuntu("( ${c.totalReviewCount.value??0} reviews )", kBlackColor, fontWeight: weight400),
                          ],
                        ),
                      )),
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
                            } else if (snapshot.hasData) {
                              print("snapShot Data: ${snapshot.data}");
                              return Container(
                                //height:MediaQuery.of(context).size.height/4,
                                child: SfCartesianChart(
                                  primaryXAxis: CategoryAxis(
                                    //Hide the gridlines of x-axis
                                    majorGridLines: MajorGridLines(width: 0),
                                    //Hide the axis line of x-axis
                                    axisLine: AxisLine(width: 1),
                                  ),
                                  series: <ChartSeries>[
                                    BarSeries<BusinessRatingCount, String>(
                                        dataSource: snapshot.data,
                                        width: 0.4,
                                        spacing: 0.2,
                                        pointColorMapper: (BusinessRatingCount line, _) => line.color,
                                        borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10.0)),
                                        xValueMapper: (BusinessRatingCount line, _) => "${line.rating.toInt()}*",
                                        yValueMapper: (BusinessRatingCount line, _) => line.count.toInt())
                                  ],
                                ),
                              );
                            }
                          }
                          // Displaying LoadingSpinner to indicate waiting state
                          return Center(
                            child: spinKit,
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              size20,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    textUbuntu("Reviews", kPrimaryPurple),
                    Expanded(child: Divider(color: kPrimaryPurple,height: 2,))
                  ],
                ),
              ),
              Obx(() =>c.reviewList.length == 0
                  ? Center(child: textUbuntu("No Reviews Found", kPrimaryPurple, fontWeight: weightBold, fontSize: 20))
                  : BusinessReviewsWidget(c: c)),
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
      ratingList = dataMap.map((tagJson) => BusinessRatingCount.fromJson(tagJson)).toList();
      return ratingList;
    } else {
      throw ("Error code " + response.statusCode.toString());
    }
  }
}

