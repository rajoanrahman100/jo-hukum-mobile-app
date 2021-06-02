import 'package:flutter/material.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/screens/dashboard/businessDashboard/widgets/ctaClickWidget.dart';
import 'package:johukum/screens/dashboard/businessDashboard/widgets/visitorHistoryWidget.dart';
import 'package:johukum/widgets/textWidgets.dart';

class Today extends StatelessWidget {

  var topKeywords = ["UX/UI design", "Graphic Design", "Movies", "Flutter/Dart", "Cross Platform","Web Development "
      "and Design"];

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            children: [
              Row(
                children: [
                  VisitorHistoryWidget(size: size,visitorCount: 17,title: "Unique Visitor",color: kPinkColor,),
                  width10,
                  VisitorHistoryWidget(size: size,visitorCount: 17,title: "Total Visitor",color: kPinkColor),
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
              Row(
                children: [
                  CtaCountWidget(size: size,count: 10,title: "Mobile",color: kPinkColor,),
                  width10,
                  CtaCountWidget(size: size,count: 20,title: "Desktop",color: kPinkColor),
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}


