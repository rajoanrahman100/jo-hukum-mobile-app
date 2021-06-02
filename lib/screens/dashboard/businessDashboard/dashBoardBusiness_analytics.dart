import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/screens/dashboard/businessDashboard/widgets/line_chart.dart';
import 'package:johukum/screens/dashboard/businessDashboard/widgets/pie_chart.dart';
import 'package:johukum/widgets/textWidgets.dart';

class AnalyticsDashBoardBusiness extends StatelessWidget {
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
                  physics: NeverScrollableScrollPhysics(),
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
              size10,
              Container(
                height: size.height/7.5,
                width: size.width,
                decoration: containerBoxDecoration(
                  color: kPrimaryPurple,
                  borderRadius: 10
                ),
                child: Column(
                  children: [
                    size5,

                    Align(alignment: Alignment.topLeft,child: Padding(
                      padding: const EdgeInsets.only(left:8),
                      child: textUbuntu("Customers Average Active Stay", kWhiteColor,
                          fontWeight:
                      weight500),
                    )),
                    size20,
                    Row(
                      mainAxisAlignment: mainAxisAlignmentCenter,

                      children: [
                        textUbuntu("8.3", kWhiteColor,fontWeight: weight500,fontSize: 35),
                        textUbuntu(" min.", kWhiteColor,fontWeight: weight500,fontSize: 18),
                        width10,
                        textUbuntu("(", kWhiteColor,fontSize: 18,fontWeight: weight500),
                        Icon(Icons.trending_up,color: Colors.green,),
                        textUbuntu(" +2.4%", kWhiteColor,fontWeight: weight500,fontSize: 18),
                        textUbuntu(")", kWhiteColor,fontSize: 18,fontWeight: weight500),

                      ],
                    ),

                  ],
                ),
              ),
              size10,
              Container(
                height: size.height/7.5,
                width: size.width,
                decoration: containerBoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),],
                    borderRadius: 10
                ),
                child: Column(
                  children: [
                    size5,

                    Align(alignment: Alignment.topLeft,child: Padding(
                      padding: const EdgeInsets.only(left:8),
                      child: textUbuntu("Customers Idle Active Stay", kBlackColor,
                          fontWeight:
                          weight500),
                    )),
                    size20,
                    Row(
                      mainAxisAlignment: mainAxisAlignmentCenter,

                      children: [
                        textUbuntu("5.3", kBlackColor.withOpacity(0.5),fontWeight: weight500,fontSize: 35),
                        textUbuntu(" min.", kBlackColor.withOpacity(0.5),fontWeight: weight500,fontSize: 18),
                        width10,
                        textUbuntu("(", kBlackColor.withOpacity(0.5),fontSize: 18,fontWeight: weight500),
                        Icon(Icons.trending_down,color: Colors.red),
                        textUbuntu(" -0.8%", kBlackColor.withOpacity(0.5),fontWeight: weight500,fontSize: 18),
                        textUbuntu(")", kBlackColor.withOpacity(0.5),fontSize: 18,fontWeight: weight500),

                      ],
                    ),

                  ],
                ),
              ),
              size10

            ],
          ),
        ),
      ),
    );
  }
}
