import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/controller/dashBoardController/businessAnalytocsController.dart';
import 'package:johukum/modelClass/broweByDeviceModel.dart';
import 'package:johukum/widgets/textWidgets.dart';
import 'package:get/get.dart';

class PieChartSample2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex = -1;

  var controller=Get.put(BusinessAnalyticsController());



  @override
  void initState() {
    // TODO: implement initState
    controller.getBrowseByDevice("602cfd2170050b2691a99bd7");
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: containerBoxDecoration(borderRadius: 10.0, color: kPrimaryPurple, boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ]),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: textUbuntu("Search By Devices", kWhiteColor, fontWeight: weight500),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Obx(()=>Container(
                  height: 140,
                  child: PieChart(
                    PieChartData(
                        borderData: FlBorderData(
                          show: false,
                        ),
                        sectionsSpace: 3,
                        centerSpaceRadius: 15,
                        sections: [
                          PieChartSectionData(
                            color: const Color(0xff0293ee),
                            value: controller.fromDesktop.value,
                            title: "${controller.browseByDevice.value.fromDesktop}%",
                            radius: 50,
                            titleStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
                          ),
                          PieChartSectionData(
                            color: const Color(0xfff8b250),
                            value: controller.fromMobile.value,
                            title: "${controller.browseByDevice.value.fromMobile}%",
                            radius: 50,
                            titleStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
                          ),
                          PieChartSectionData(
                            color:  Colors.redAccent,
                            value: controller.fromTablet.value,
                            title: "${controller.browseByDevice.value.fromTablet}%",
                            radius: 50,
                            titleStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
                          ),

                        ]),
                  ),
                ),)
              ),
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Column(
                  crossAxisAlignment: crossAxisAlignmentStart,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: Colors.blue,
                          size: 16,
                        ),
                        textUbuntu("Desktop", kWhiteColor)
                      ],
                    ),
                    size10,
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: Colors.amber,
                          size: 16,
                        ),
                        textUbuntu("Mobile", kWhiteColor)
                      ],
                    ),
                    size10,
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: Colors.redAccent,
                          size: 16,
                        ),
                        textUbuntu("Tab", kWhiteColor)
                      ],
                    ),

                  ],
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }

}
