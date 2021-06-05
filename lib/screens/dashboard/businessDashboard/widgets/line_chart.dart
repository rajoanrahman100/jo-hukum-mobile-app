import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/controller/dashBoardController/businessAnalytocsController.dart';
import 'package:johukum/modelClass/lineChartModel.dart';
import 'package:johukum/widgets/textWidgets.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChartSample2 extends StatefulWidget {
  @override
  _LineChartSample2State createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    Color(0xFF482080),
    Color(0xFF482080)
    //kPrimaryPurple,
  ];

  var controller = Get.put(BusinessAnalyticsController());

  bool showAvg = false;
  TrackballBehavior _trackballBehavior;

  @override
  void initState() {
    // TODO: implement initState
    controller.getSearchLineData("602cfcd270050b2691a99bd6");
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Colors.white),
            child: Padding(
                padding: EdgeInsets.only(top: 5),
                child: Obx(
                  () => SfCartesianChart(primaryXAxis: CategoryAxis(
                    title: AxisTitle(
                      text:"Date",textStyle: textStyleUbuntu(color: kPrimaryPurple)
                    )
                  ),series: <ChartSeries>[
                    SplineSeries<LineModel, String>(
                        enableTooltip: true,
                        dataSource: controller.elasticDataList,
                        xValueMapper: (LineModel line, _) => line.date,
                        yValueMapper: (LineModel line, _) => line.count,
                        markerSettings: MarkerSettings(isVisible: true),
                        dataLabelSettings: DataLabelSettings(isVisible: true))
                  ]),
                )),
          ),
        ),
      ],
    );
  }

}
