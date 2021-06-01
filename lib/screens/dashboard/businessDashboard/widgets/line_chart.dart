import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:johukum/components/components.dart';
import 'package:johukum/widgets/textWidgets.dart';

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

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Container(
            decoration:BoxDecoration(
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
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: LineChart(
                mainData(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 15,
          getTextStyles: (value) => TextStyle(color: Color(0xff68737d), fontWeight: FontWeight.bold, fontSize: 12),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return 'Jan';
              case 2:
                return 'Feb';
              case 4:
                return 'Mar';
              case 6:
                return 'Apr';
              case 8:
                return 'May';
              case 10:
                return 'Jun';
              case 12:
                return 'Jul';
              case 14:
                return 'Aug';
              case 16:
                return 'Sep';
              case 18:
                return 'Oct';
              case 20:
                return 'Nov';
              case 22:
                return 'Dec';
            }
            return '';
          },
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10';
              case 3:
                return '50';
              case 5:
                return '100';
              case 7:
                return '150';
              case 9:
                return '200';
              case 11:
                return '250';
              case 13:
                return '300';
              case 15:
                return '350';
              case 17:
                return '400';
              case 19:
                return '450';
              case 20:
                return '500';
              case 21:
                return '550';
            }
            return '';
          },
          reservedSize: 15,
        ),
      ),
      borderData: FlBorderData(show: true, border: Border.all(color: kPrimaryPurple, width: 1,)),
      minX: 0,
      maxX: 24,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3),
            FlSpot(1.6, 2),
            FlSpot(3.9, 5),
            FlSpot(5.8, 3.1),
            FlSpot(7, 4),
            FlSpot(9.5, 3),
            FlSpot(10, 4),
            FlSpot(11, 3),
            FlSpot(13, 2),
            FlSpot(15, 5),
            FlSpot(17, 3.1),
            FlSpot(19, 4),
            FlSpot(21, 4),
            FlSpot(23, 4),

          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(show: true, colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)
                .withOpacity(0.1),
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)
                .withOpacity(0.1),
          ]),
        ),
      ],
    );
  }
}
