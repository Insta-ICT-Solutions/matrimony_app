
import 'package:bright_weddings/Helper/size_config.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SuccessGraph extends StatefulWidget {
  SuccessGraph({super.key});

  @override
  _SuccessGraphState createState() => _SuccessGraphState();
}

class _SuccessGraphState extends State<SuccessGraph> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h, // Sufficient height for better visibility
      width: 80.w, // Sufficient width for the chart
      padding: EdgeInsets.all(16), // Padding around the chart
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
        primaryXAxis: CategoryAxis(),
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
            // Enable tooltip for the series
            enableTooltip: true,
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

