import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatelessWidget {
  final List points;

  const LineChartWidget(this.points, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: LineChart(
        LineChartData(
          maxY: 50,
          titlesData: const FlTitlesData(
              show: true,
              bottomTitles: AxisTitles(
                axisNameSize: 22.0, // タイトルの表示エリアの幅
                sideTitles: SideTitles(
                  // サイドタイトル設定
                  showTitles: true, // サイドタイトルの有無
                  interval: 1, // サイドタイトルの表示間隔
                  reservedSize: 40.0, // サイドタイトルの表示エリアの幅
                  // getTitlesWidget: bottomTitleWidgets, // サイドタイトルの表示内容
                ),
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                ),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 10,
                  reservedSize: 40.0,
                ),
              )),
          lineBarsData: [
            LineChartBarData(
                belowBarData: BarAreaData(show: true),
                spots: points.map((point) => FlSpot(point.x, point.y)).toList(),
                isCurved: true,
                dotData: const FlDotData(show: true))
          ],
        ),
      ),
    );
  }
}
