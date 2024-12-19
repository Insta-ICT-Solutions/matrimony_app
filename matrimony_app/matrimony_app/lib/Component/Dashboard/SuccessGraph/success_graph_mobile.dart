import 'package:bright_weddings/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SuccessGraphMobile extends StatefulWidget {
  SuccessGraphMobile({super.key});

  @override
  _SuccessGraphMobileState createState() => _SuccessGraphMobileState();
}

class _SuccessGraphMobileState extends State<SuccessGraphMobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h, // Adjust height responsively
      width: 90.w, // Adjust width responsively
      padding: EdgeInsets.all(2.h), // Adjust padding responsively
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(0, 4),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(
          labelRotation: 90, // Rotate labels to make them vertical
        ),
        primaryYAxis: NumericAxis(), // Y-axis now for values
        series: <ChartSeries>[
          ColumnSeries<ChartData, String>(
            dataSource: [
              ChartData('Male', 70, Colors.blue),
              ChartData('Female', 80, Colors.pink),
              ChartData('Second Male', 60, Colors.green),
              ChartData('Second Female', 65, Colors.purple),
              ChartData('Success Rate', 90, Colors.orange),
            ],
            xValueMapper: (ChartData data, _) => data.category,
            yValueMapper: (ChartData data, _) => data.value,
            pointColorMapper: (ChartData data, _) => data.color, // Assign color dynamically
            enableTooltip: true, // Enable tooltip for the series
          )
        ],
        tooltipBehavior: TooltipBehavior(
          enable: true,
          duration: 1,
          format: 'Category: point.x\nValue: point.y',
          textStyle: TextStyle(color: Colors.white),
          builder: (dynamic data, dynamic point, dynamic series, int pointIndex, int seriesIndex) {
            return Container(
              padding: EdgeInsets.all(8),
              color: Colors.black54,
              child: Text(' ${data.category}\nValue: ${data.value}', style: TextStyle(color: Colors.white)),
            );
          },
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.category, this.value, this.color);
  final String category;
  final double value;
  final Color color;
}
