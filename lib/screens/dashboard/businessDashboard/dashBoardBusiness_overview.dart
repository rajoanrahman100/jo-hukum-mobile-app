import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/screens/dashboard/businessDashboard/widgets/line_chart.dart';
import 'package:johukum/screens/dashboard/businessDashboard/widgets/pie_chart.dart';
import 'package:johukum/widgets/textWidgets.dart';

class OverViewDashBoardBusiness extends StatelessWidget {
  var topKeywords = ["UX/UI design", "Graphic Design", "Movies", "Flutter/Dart", "Cross Platform","Web Development "
      "and Design"];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                        height: size.height / 8,
                        decoration: containerBoxDecoration(borderRadius: 10, color: kPrimaryPurple),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: textUbuntu("Unique Visitor", kWhiteColor, fontWeight: weight500),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: textUbuntu("20", kWhiteColor, fontWeight: weight500, fontSize: 30),
                            ),
                          ],
                        )),
                  ),
                  width10,
                  Expanded(
                    child: Container(
                        height: size.height / 8,
                        decoration: containerBoxDecoration(borderRadius: 10, color: kPrimaryPurple),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: textUbuntu("Total Visitor", kWhiteColor, fontWeight: weight500),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: textUbuntu("30", kWhiteColor, fontWeight: weight500, fontSize: 30),
                            ),
                          ],
                        )),
                  )
                ],
              ),
              size10,
              Container(
                height: 50,
                decoration: containerBoxDecoration(color: kSecondaryPurple, borderRadius: 10),
                child: Center(
                  child: textUbuntu("Total CTA count", kWhiteColor, fontWeight: weight500),
                ),
              ),
              size10,
              Row(
                children: [
                  Expanded(
                    child: Container(
                        height: size.height / 12,
                        decoration: containerBoxDecoration(borderRadius: 10, color: kSecondaryPurple),
                        child: Row(
                          mainAxisAlignment: mainAxisAlignmentCenter,
                          children: [
                            textUbuntu("5", kWhiteColor, fontWeight: weight500, fontSize: 30),
                            width10,
                            Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: kWhiteColor,
                                  size: 12,
                                ),
                                textUbuntu(" Mobile", kWhiteColor, fontWeight: weight500),
                              ],
                            )
                          ],
                        )),
                  ),
                  width10,
                  Expanded(
                    child: Container(
                        height: size.height / 12,
                        decoration: containerBoxDecoration(borderRadius: 10, color: kSecondaryPurple),
                        child: Row(
                          mainAxisAlignment: mainAxisAlignmentCenter,
                          children: [
                            textUbuntu("15", kWhiteColor, fontWeight: weight500, fontSize: 30),
                            width10,
                            Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: kWhiteColor,
                                  size: 12,
                                ),
                                textUbuntu(" Desktop", kWhiteColor, fontWeight: weight500),
                              ],
                            )
                          ],
                        )),
                  ),
                ],
              ),
              size10,
              size10,
              Row(
                children: [
                  textUbuntu("Search Result", kPrimaryPurple),
                  Expanded(
                      child: Divider(
                        color: kPrimaryPurple,
                        height: 2,
                      ))
                ],
              ),
              size10,
              /*Container(
                height: 270,
                child: LineChart(LineChartData(
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                          spots: [
                            FlSpot(0, 1),
                            FlSpot(1, 3),
                            FlSpot(2, 10),
                            FlSpot(3, 7),
                            FlSpot(4, 12),
                            FlSpot(5, 13),
                            FlSpot(6, 17),
                          ]
                      )
                    ]
                ),
                ),
              ),*/
              LineChartSample2(),
              size5,
              textUbuntu("Business Visit Graph", kBlackColor, fontWeight: weight500, fontSize: 18),
              size10,

              Row(
                children: [
                  textUbuntu("Top Keywords", kPrimaryPurple),
                  Expanded(
                      child: Divider(
                    color: kPrimaryPurple,
                    height: 2,
                  ))
                ],
              ),
              size10,
              Container(
                height: 150,
                child: GridView.builder(
                  itemCount: topKeywords.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 5 / 1, crossAxisCount: 2, crossAxisSpacing: 3.0, mainAxisSpacing: 4.0),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(height: 40, decoration: containerBoxDecoration(
                      borderRadius: 10.0,
                      color: kPrimaryPurple.withOpacity(0.3)
                    ), child: Center(child: textUbuntu(topKeywords[index],kBlackColor,fontWeight: weight500)));
                  },
                ),
              ),
             // size10,
              PieChartSample2(),
              size20,
            ],
          ),
        ),
      ),
    );
  }
}
