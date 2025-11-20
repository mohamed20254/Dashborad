import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeeklySales {
  WeeklySales(this.day, this.value);
  final String day;
  final double value;
}

class BarChartPage extends StatelessWidget {
  BarChartPage({super.key});
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

  // توليد أعمدة تلقائيًا
  List<BarChartGroupData> getBarGroups() {
    return List.generate(salesData.length, (final index) {
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
  Widget getBottomTitles(final double value, final TitleMeta meta) {
    final style = const TextStyle(fontSize: 12);

    return Text(salesData[value.toInt()].day, style: style);
  }

  // توليد محور Y k بشكل ديناميكي
  Widget getLeftTitles(final double value, final TitleMeta meta) {
    if (value % 1000 == 0) {
      final double kValue = value / 1000;
      return Text(
        "${kValue.toStringAsFixed(1)}K",
        style: const TextStyle(fontSize: 12),
      );
    }
    return Container();
  }

  @override
  Widget build(final BuildContext context) {
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
          topTitles: const AxisTitles(),
          rightTitles: const AxisTitles(),
        ),

        barGroups: getBarGroups(),
      ),
    );
  }
}
