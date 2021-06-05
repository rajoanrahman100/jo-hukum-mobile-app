import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:johukum/components/apis.dart';
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

  var lineChartDataList=List<LineModel>();


  bool showAvg = false;
  TrackballBehavior _trackballBehavior;

  @override
  void initState() {
    // TODO: implement initState
    //controller.getSearchLineData("602cfcd270050b2691a99bd6");
  }

  @override
  Widget build(BuildContext context) {
    /*return Stack(
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
                        dataSource: controller.lineChartDataList,
                        xValueMapper: (LineModel line, _) => line.date,
                        yValueMapper: (LineModel line, _) => line.count,
                        pointColorMapper:(LineModel line, _) => line.color,

                        width: 8.0,
                        markerSettings: MarkerSettings(isVisible: true),
                        dataLabelSettings: DataLabelSettings(isVisible: true))
                  ]),
                )),
          ),
        ),
      ],
    );*/
    return FutureBuilder<List<LineModel>>(
      future: getLineData("602cfcd270050b2691a99bd6"),
      builder: (ctx, snapshot) {
        // Checking if future is resolved or not
        if (snapshot.connectionState == ConnectionState.done) {
          // If we got an error
          if (snapshot.hasError) {
            return Center(
              child: Text(
                '${snapshot.error} occured',
                style: TextStyle(fontSize: 18),
              ),
            );

            // if we got our data
          } else if (snapshot.hasData) {
            // Extracting data from snapshot object
           // final data = snapshot.data;
            print("snapShot Data: ${snapshot.data}");
            return Container(
              height:MediaQuery.of(context).size.height/4,
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
              child: SfCartesianChart(primaryXAxis: CategoryAxis(
                  title: AxisTitle(
                      text:"Date",textStyle: textStyleUbuntu(color: kPrimaryPurple)
                  )
              ),series: <ChartSeries>[
                SplineSeries<LineModel, String>(
                    enableTooltip: true,
                    dataSource: snapshot.data,
                    xValueMapper: (LineModel line, _) => line.date,
                    yValueMapper: (LineModel line, _) => line.count,
                    pointColorMapper:(LineModel line, _) => line.color,

                    width: 8.0,
                    markerSettings: MarkerSettings(isVisible: true),
                    dataLabelSettings: DataLabelSettings(isVisible: true))
              ]),
            );
          }
        }

        // Displaying LoadingSpinner to indicate waiting state
        return Center(
          child: CircularProgressIndicator(),
        );
      },

    );
  }

  Future<List<LineModel>> getLineData(businessId)async{
    var response = await get(Uri.parse(searchLineChartApi+"$businessId&year=2021&month=5"));

    print("Response pie chart= " + response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {

      Map<String,dynamic> dataMap = jsonDecode(response.body);

      dataMap.forEach((key, value) {
        if(key!="url"){
          lineChartDataList.add(LineModel(date: key,count: value));
        }
      });
      return lineChartDataList;
    } else {
      throw ("Error code " + response.statusCode.toString());
    }
  }
}
