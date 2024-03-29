import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/controller/dashBoardController/businessAnalytocsController.dart';
import 'package:johukum/screens/dashboard/businessDashboard/widgets/ctaClickWidget.dart';
import 'package:johukum/screens/dashboard/businessDashboard/widgets/visitorHistoryWidget.dart';
import 'package:johukum/widgets/textWidgets.dart';

import '../../../../responsive.dart';

class ThisMonth extends StatefulWidget {
  @override
  _ThisMonthState createState() => _ThisMonthState();
}

class _ThisMonthState extends State<ThisMonth> {
  var monthController = Get.put(BusinessAnalyticsController());

  @override
  void initState() {
    // TODO: implement initState
    print("My business slug:${boxStorage.read(MY_BUSINESS_SLUG)}");
    print("My business ID:${boxStorage.read(MY_BUSINESS_ID)}");
  //  monthController.getVisitorCount("602cfd2170050b2691a99bd7", 31);
    monthController.getVisitorCount(boxStorage.read(MY_BUSINESS_ID), 30);
   // monthController.getCtaCount("602ce10270050b2691a99bcc", 30);
    monthController.getCtaCount(boxStorage.read(MY_BUSINESS_ID), 31);
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
                      visitorCount: monthController.visitorCount.value.uniqueVisits??0,

                      title: "Unique Visitor",
                      color: kAquaGreenColor,
                    )),
                    width10,
                    Obx(()=>VisitorHistoryWidget(
                        size: size,

                        visitorCount: monthController.visitorCount.value.totalVisits??0,
                        title: "Total Visitor",
                        color: kAquaGreenColor)),
                  ],
                ),
                size10,
                Container(
                  height: 50,
                  decoration: containerBoxDecoration(color: kAquaGreenColor.withOpacity(0.6), borderRadius: 10),
                  child: Center(
                    child: textUbuntu("Total CTA count", Colors.white, fontWeight: weight500,fontSize: 20),
                  ),
                ),
                size10,
                Obx(()=>Row(
                  children: [
                    CtaCountWidget(
                      size: size,
                      count: monthController.ctaCount.value.fromMobile??0,

                      title: "Mobile",
                      color: kAquaGreenColor,
                    ),
                    width10,
                    CtaCountWidget(size: size, count: monthController.ctaCount.value.fromDesktop??0,
                        title: "Desktop", color:
                        kAquaGreenColor),
                  ],
                ),)
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
                      visitorCount: monthController.visitorCount.value.uniqueVisits??0,
                      height: size.height / 6,
                      titleFontSize: 20.0,
                      countFontSize: 35,
                      title: "Unique Visitor",
                      color: kAquaGreenColor,
                    )),
                    width10,
                    Obx(()=>VisitorHistoryWidget(
                        size: size,
                        height: size.height / 6,
                        titleFontSize: 20.0,
                        countFontSize: 35,
                        visitorCount: monthController.visitorCount.value.totalVisits??0,
                        title: "Total Visitor",
                        color: kAquaGreenColor)),
                  ],
                ),
                size10,
                Container(
                  height: 65,
                  decoration: containerBoxDecoration(color: kAquaGreenColor.withOpacity(0.6), borderRadius: 10),
                  child: Center(
                    child: textUbuntu("Total CTA count", Colors.white, fontWeight: weight500,fontSize: 20),
                  ),
                ),
                size10,
                Obx(()=>Row(
                  children: [
                    CtaCountWidget(
                      size: size,
                      count: monthController.ctaCount.value.fromMobile??0,
                      height: size.height/11,
                      countSize: 33.0,
                      titleSize: 20.0,
                      title: "Mobile",
                      color: kAquaGreenColor,
                    ),
                    width10,
                    CtaCountWidget(size: size, count: monthController.ctaCount.value.fromDesktop??0,height: size.height/11,
                        countSize: 33.0,
                        titleSize: 20.0,title: "Desktop", color:
                        kAquaGreenColor),
                  ],
                ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
