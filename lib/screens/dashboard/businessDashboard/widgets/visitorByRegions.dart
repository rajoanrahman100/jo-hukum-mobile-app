import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/controller/dashBoardController/businessAnalytocsController.dart';
import 'package:johukum/widgets/textWidgets.dart';

class VisitorByRegion extends StatefulWidget {


  @override
  _VisitorByRegionState createState() => _VisitorByRegionState();
}

class _VisitorByRegionState extends State<VisitorByRegion> {

  var c=Get.put(BusinessAnalyticsController());

  @override
  void initState() {
    // TODO: implement initState
    c.getRegionVisit("602cfd2170050b2691a99bd7");
  }

  @override
  Widget build(BuildContext context) {

    Size size=MediaQuery.of(context).size;

    return Container(
      height: size.height / 3,
      width: size.width,
      decoration: containerBoxDecoration(borderRadius: 10.0, color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        )
      ]),
      child: Column(
        crossAxisAlignment: crossAxisAlignmentStart,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: textUbuntu("Visitors By Region", kBlackColor, fontWeight: weight500),
          ),
          size10,
          Row(
            children: [
              Expanded(
                child: Container(
                  width: size.width,
                  height: 230,
                  child: Column(
                    crossAxisAlignment: crossAxisAlignmentCenter,
                    children: [
                      textUbuntu("Region", kBlackColor,fontSize: 18.0,fontWeight: weight500),
                      size10,
                      textUbuntu("Dhaka", kBlackColor,fontSize: 16.0,fontWeight: weight400),
                      size5,
                      textUbuntu("Chittagong ", kBlackColor,fontSize: 16.0,fontWeight: weight400),
                      size5,
                      textUbuntu("Barishal ", kBlackColor,fontSize: 16.0,fontWeight: weight400),
                      size5,
                      textUbuntu("Mymensingh ", kBlackColor,fontSize: 16.0,fontWeight: weight400),
                      size5,
                      textUbuntu("Khulna ", kBlackColor,fontSize: 16.0,fontWeight: weight400),
                      size5,
                      textUbuntu("Rajshahi ", kBlackColor,fontSize: 16.0,fontWeight: weight400),
                      size5,
                      textUbuntu("Rangpur ", kBlackColor,fontSize: 16.0,fontWeight: weight400),
                      size5,
                      textUbuntu("Sylhet ", kBlackColor,fontSize: 16.0,fontWeight: weight400),

                    ],
                  ),
                ),
              ),
              Expanded(
                child: Obx(()=>Container(
                  width: size.width,
                  height: 230,
                  child: Column(
                    crossAxisAlignment: crossAxisAlignmentCenter,
                    children: [
                      textUbuntu("Visits", kBlackColor,fontSize: 18.0,fontWeight: weight500),
                      size10,
                      textUbuntu("${c.regionVisit.value.dhaka??0}", kBlackColor,fontSize: 16.0,fontWeight: weight400),
                      size5,
                      textUbuntu("0", kBlackColor,fontSize: 16.0,fontWeight: weight400),
                      size5,
                      textUbuntu("0", kBlackColor,fontSize: 16.0,fontWeight: weight400),
                      size5,
                      textUbuntu("0", kBlackColor,fontSize: 16.0,fontWeight: weight400),
                      size5,
                      textUbuntu("0", kBlackColor,fontSize: 16.0,fontWeight: weight400),
                      size5,
                      textUbuntu("0", kBlackColor,fontSize: 16.0,fontWeight: weight400),
                      size5,
                      textUbuntu("0", kBlackColor,fontSize: 16.0,fontWeight: weight400),
                      size5,
                      textUbuntu("0", kBlackColor,fontSize: 16.0,fontWeight: weight400),

                    ],
                  ),
                ),)
              )
            ],
          )
        ],
      ),
    );
  }
}