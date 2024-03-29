import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/components/config.dart';
import 'package:johukum/controller/dashBoardController/businessAnalytocsController.dart';
import 'package:johukum/responsive.dart';
import 'package:johukum/screens/dashboard/businessDashboard/widgets/ctaClickWidget.dart';
import 'package:johukum/screens/dashboard/businessDashboard/widgets/visitorHistoryWidget.dart';
import 'package:johukum/widgets/textWidgets.dart';

class Today extends StatefulWidget {
  @override
  _TodayState createState() => _TodayState();
}

class _TodayState extends State<Today> {
  var topKeywords = [
    "UX/UI design",
    "Graphic Design",
    "Movies",
    "Flutter/Dart",
    "Cross Platform",
    "Web Development "
        "and Design"
  ];

  var c = Get.put(BusinessAnalyticsController());

  @override
  void initState() {
    // TODO: implement initState
    print("My business slug:${boxStorage.read(MY_BUSINESS_SLUG)}");
    print("My business ID:${boxStorage.read(MY_BUSINESS_ID)}");
    //c.getVisitorCount("602cfd2170050b2691a99bd7", 1);
    c.getVisitorCount(boxStorage.read(MY_BUSINESS_ID), 1);
    //c.getCtaCount("602ce10270050b2691a99bcc",1);
    c.getCtaCount(boxStorage.read(MY_BUSINESS_ID),1);
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
                    Obx(
                          () => VisitorHistoryWidget(
                          size: size,
                          visitorCount: c.visitorCount.value.uniqueVisits??0,
                          title: "Unique Visitor",
                          color: kPinkColor),
                    ),
                    width10,
                    Obx(()=> VisitorHistoryWidget(size: size, visitorCount: c.visitorCount.value.totalVisits??0, title: "T"
                        "otal "
                        "Visitor", color:
                    kPinkColor)),
                  ],
                ),
                size10,
                Container(
                  height: 50,
                  decoration: containerBoxDecoration(color: kPinkColor.withOpacity(0.6), borderRadius: 10),
                  child: Center(
                    child: textUbuntu("Total CTA count", Colors.white, fontWeight: weight500),
                  ),
                ),
                size10,
                Obx(()=>Row(
                  children: [
                    CtaCountWidget(
                      size: size,
                      count: c.ctaCount.value.fromMobile??0,
                      title: "Mobile",
                      color: kPinkColor,
                    ),
                    width10,
                    CtaCountWidget(size: size, count: c.ctaCount.value.fromDesktop??0, title: "Desktop", color:
                    kPinkColor),
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
                    Obx(
                          () => VisitorHistoryWidget(
                          size: size,
                          height: size.height/6,
                          titleFontSize: 20.0,
                          countFontSize: 35,
                          visitorCount: c.visitorCount.value.uniqueVisits??0,
                          title: "Unique Visitor",
                          color: kPinkColor),
                    ),
                    width10,
                    Obx(()=> VisitorHistoryWidget(size: size, height: size.height/6,titleFontSize: 20.0,countFontSize: 35,visitorCount: c.visitorCount.value.totalVisits??0, title: "T"
                        "otal "
                        "Visitor", color:
                    kPinkColor)),
                  ],
                ),
                size10,
                Container(
                  height: 65,
                  decoration: containerBoxDecoration(color: kPinkColor.withOpacity(0.6), borderRadius: 10),
                  child: Center(
                    child: textUbuntu("Total CTA count", Colors.white, fontWeight: weight500,fontSize: 20.0),
                  ),
                ),
                size10,
                Obx(()=>Row(
                  children: [
                    CtaCountWidget(
                      size: size,
                      count: c.ctaCount.value.fromMobile??0,
                      height: size.height/11,
                      countSize: 33.0,
                      titleSize: 20.0,
                      title: "Mobile",
                      color: kPinkColor,
                    ),
                    width10,
                    CtaCountWidget(size: size, height: size.height/11,count: c.ctaCount.value.fromDesktop??0, title: "Desktop", color:
                    kPinkColor),
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
