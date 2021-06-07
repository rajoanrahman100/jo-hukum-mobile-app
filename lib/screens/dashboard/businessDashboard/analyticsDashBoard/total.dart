import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/controller/dashBoardController/businessAnalytocsController.dart';
import 'package:johukum/screens/dashboard/businessDashboard/widgets/ctaClickWidget.dart';
import 'package:johukum/screens/dashboard/businessDashboard/widgets/visitorHistoryWidget.dart';
import 'package:johukum/widgets/textWidgets.dart';

class Total extends StatefulWidget {
  @override
  _TotalState createState() => _TotalState();
}

class _TotalState extends State<Total> {
  var totalController = Get.put(BusinessAnalyticsController());

  @override
  void initState() {
    // TODO: implement initState
    totalController.getVisitorCount("602cfd2170050b2691a99bd7", "");
    totalController.getCtaCount("602ce10270050b2691a99bcc", "");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            children: [
              Obx(
                () => Row(
                  children: [
                    VisitorHistoryWidget(
                      size: size,
                      visitorCount: totalController.visitorCount.value.uniqueVisits ?? 0,
                      height: size.height / 6,
                      titleFontSize: 20.0,
                      countFontSize: 35,
                      title: "Unique Visitor",
                      color: kYellowColor,
                    ),
                    width10,
                    VisitorHistoryWidget(
                        size: size,
                        visitorCount: totalController.visitorCount.value.totalVisits ?? 0,
                        height: size.height / 6,
                        titleFontSize: 20.0,
                        countFontSize: 35,
                        title: "Total"
                            " Visitor",
                        color: kYellowColor),
                  ],
                ),
              ),
              size10,
              Container(
                height: 65,
                decoration: containerBoxDecoration(color: kYellowColor.withOpacity(0.6), borderRadius: 10),
                child: Center(
                  child: textUbuntu("Total CTA count", Colors.white, fontWeight: weight500,fontSize: 20),
                ),
              ),
              size10,
              Obx(()=>Row(
                children: [
                  CtaCountWidget(
                    size: size,
                    count: totalController.ctaCount.value.fromMobile,
                    height: size.height/11,
                    countSize: 33.0,
                    titleSize: 20.0,
                    title: "Mobile",
                    color: kYellowColor,
                  ),
                  width10,
                  CtaCountWidget(size: size, height: size.height/11,
                      countSize: 33.0,
                      titleSize: 20.0,count: totalController.ctaCount.value.fromDesktop, title: "Desktop", color:
                  kYellowColor),
                ],
              ),)
            ],
          ),
        ),
      ),
    );
  }
}