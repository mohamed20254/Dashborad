import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieData {
  PieData(this.label, this.value, this.color);
  final String label;
  final double value;
  final Color color;
}

class PieChartPage extends StatelessWidget {
  PieChartPage({super.key});
  final List<PieData> pieData = [
    PieData("Electronics", 40, Colors.blue),
    PieData("Clothes", 25, Colors.orange),
    PieData("Food", 20, Colors.green),
    PieData("Others", 15, Colors.red),
  ];

  List<PieChartSectionData> getSections() {
    return pieData.map((final data) {
      return PieChartSectionData(
        value: data.value,
        color: data.color,
        title: "${data.value}%",
        radius: 70,
        titleStyle: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      );
    }).toList();
  }

  @override
  Widget build(final BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.yellowAccent.withValues(alpha: 0.2),

                  child: const Icon(
                    Icons.border_outer_rounded,
                    color: Colors.yellow,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "order Status",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            const SizedBox(height: 23),
            SizedBox(
              height: 200,
              child: Transform.scale(
                scale: 0.8,
                child: PieChart(
                  PieChartData(
                    sections: getSections(),
                    centerSpaceRadius: 40, // حفرة في النص
                    sectionsSpace: 3, // مسافة بين القطع
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 80,
                  child: Text(
                    "order",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
                Text("Count", style: Theme.of(context).textTheme.labelLarge),
                Text("Totail", style: Theme.of(context).textTheme.labelLarge),
              ],
            ),
            const Divider(),
            SizedBox(
              height: 150,
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),

                itemBuilder: (final context, final index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 80,
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: pieData[index].color,
                              radius: 6,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              pieData[index].label,
                              style: Theme.of(context).textTheme.labelSmall,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        pieData[index].value.toString(),
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      Text(
                        "\$${pieData[index].value.toStringAsFixed(2)}",
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  );
                },
                separatorBuilder: (final context, final index) =>
                    const Divider(),
                itemCount: pieData.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
