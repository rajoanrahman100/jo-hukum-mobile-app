import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/widgets/textWidgets.dart';

class PieChartSample2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex = -1;

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
                child: Container(
                  height: 140,
                  child: PieChart(
                    PieChartData(
                        borderData: FlBorderData(
                          show: false,
                        ),
                        sectionsSpace: 3,
                        centerSpaceRadius: 15,
                        sections: showingSections()),
                  ),
                ),
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
                        textUbuntu("Mobile", kWhiteColor)
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
                        textUbuntu("Desktop", kWhiteColor)
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
                    size10,
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: Colors.green,
                          size: 16,
                        ),
                        textUbuntu("Iphone", kWhiteColor)
                      ],
                    )
                  ],
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.redAccent,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        default:
          throw Error();
      }
    });
  }
}
