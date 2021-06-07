import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/controller/dashBoardController/businessAnalytocsController.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/screens/dashboard/businessDashboard/widgets/ctaClickWidget.dart';
import 'package:johukum/screens/dashboard/businessDashboard/widgets/visitorHistoryWidget.dart';
import 'package:johukum/widgets/textWidgets.dart';

class ThisWeek extends StatefulWidget {
  @override
  _ThisWeekState createState() => _ThisWeekState();
}

class _ThisWeekState extends State<ThisWeek> {
  var weekController = Get.put(BusinessAnalyticsController());

  @override
  void initState() {
    // TODO: implement initState
    weekController.getVisitorCount("602cfd2170050b2691a99bd7", 7);
    weekController.getCtaCount("602ce10270050b2691a99bcc", 7);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Responsive(
      mobile: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            children: [
              Row(
                children: [
                  Obx(() => VisitorHistoryWidget(
                        size: size,
                        visitorCount: weekController.visitorCount.value.uniqueVisits ?? 0,
                        title: "Unique Visitor",
                        color: kBlueColor,
                      )),
                  width10,
                  Obx(() => VisitorHistoryWidget(
                      size: size,
                      visitorCount: weekController.visitorCount.value.totalVisits ?? 0,
                      title: "To"
                          "tal Visitor",
                      color: kBlueColor)),
                ],
              ),
              size10,
              Container(
                height: 50,
                decoration: containerBoxDecoration(color: kBlueColor.withOpacity(0.6), borderRadius: 10),
                child: Center(
                  child: textUbuntu("Total CTA count", Colors.white, fontWeight: weight500),
                ),
              ),
              size10,
              Obx(
                () => Row(
                  children: [
                    CtaCountWidget(
                      size: size,
                      count: weekController.ctaCount.value.fromMobile ?? 0,
                      title: "Mobile",
                      color: kBlueColor,
                    ),
                    width10,
                    CtaCountWidget(size: size, count: weekController.ctaCount.value.fromDesktop ?? 0, title: "Desktop", color: kBlueColor),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      tablet: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            children: [
              Row(
                children: [
                  Obx(() => VisitorHistoryWidget(
                        size: size,
                        height: size.height / 6,
                        titleFontSize: 20.0,
                        countFontSize: 35,
                        visitorCount: weekController.visitorCount.value.uniqueVisits ?? 0,
                        title: "Unique Visitor",
                        color: kBlueColor,
                      )),
                  width10,
                  Obx(() => VisitorHistoryWidget(
                      size: size,
                      height: size.height / 6,
                      titleFontSize: 20.0,
                      countFontSize: 35,
                      visitorCount: weekController.visitorCount.value.totalVisits ?? 0,
                      title: "To"
                          "tal Visitor",
                      color: kBlueColor)),
                ],
              ),
              size10,
              Container(
                height: 65,
                decoration: containerBoxDecoration(color: kBlueColor.withOpacity(0.6), borderRadius: 10),
                child: Center(
                  child: textUbuntu("Total CTA count", Colors.white, fontWeight: weight500,fontSize: 20.0),
                ),
              ),
              size10,
              Obx(
                () => Row(
                  children: [
                    CtaCountWidget(
                      size: size,
                      count: weekController.ctaCount.value.fromMobile ?? 0,
                      height: size.height/11,
                      countSize: 33.0,
                      titleSize: 20.0,
                      title: "Mobile",
                      color: kBlueColor,
                    ),
                    width10,
                    CtaCountWidget(size: size, height: size.height/11,
                        countSize: 33.0,
                        titleSize: 20.0,count: weekController.ctaCount.value.fromDesktop ?? 0, title: "Desktop", color: kBlueColor),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
