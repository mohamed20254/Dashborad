import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeeklySales {
  final String day;
  final double value;

  WeeklySales(this.day, this.value);
}

class BarChartPage extends StatelessWidget {
  // بيانات ديناميكية — تقدر تغيرها أو تجيبها من API
  final List<WeeklySales> salesData = [
    WeeklySales("Sat", 1500),
    WeeklySales("Sun", 2200),
    WeeklySales("Mon", 1800),
    WeeklySales("Tue", 2500),
    WeeklySales("Wed", 3200),
    WeeklySales("Thu", 2800),
    WeeklySales("Fri", 4000),
  ];

  BarChartPage({super.key});

  // توليد أعمدة تلقائيًا
  List<BarChartGroupData> getBarGroups() {
    return List.generate(salesData.length, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: salesData[index].value,
            color: Colors.blueAccent,
            width: 18,
          ),
        ],
      );
    });
  }

  // توليد عناوين الأيام تحت الأعمدة
  Widget getBottomTitles(double value, TitleMeta meta) {
    final style = TextStyle(fontSize: 12);

    return Text(salesData[value.toInt()].day, style: style);
  }

  // توليد محور Y k بشكل ديناميكي
  Widget getLeftTitles(double value, TitleMeta meta) {
    if (value % 1000 == 0) {
      double kValue = value / 1000;
      return Text(
        "${kValue.toStringAsFixed(1)}K",
        style: TextStyle(fontSize: 12),
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        backgroundColor: Colors.white,
        maxY: 4000,
        minY: 0,
        borderData: FlBorderData(show: false),

        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: getLeftTitles,
              reservedSize: 45,
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: getBottomTitles,
              reservedSize: 32,
            ),
          ),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),

        barGroups: getBarGroups(),
      ),
    );
  }
}
