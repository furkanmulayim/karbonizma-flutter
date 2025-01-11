import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:karbonizma/common/data/model/history/history_model.dart';
import 'package:karbonizma/core/constants/app_colors.dart';
import 'package:karbonizma/core/constants/app_dimens.dart';

class PieChartFromWasteItems extends StatelessWidget {
  final List<HistoryModel> wasteItems;

  const PieChartFromWasteItems({super.key, required this.wasteItems});

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [
      AppColors.pieChartColor1,
      AppColors.pieChartColor2,
      AppColors.pieChartColor3,
      AppColors.pieChartColor4,
    ];

    // Group waste items by name
    final groupedItems = <String, double>{};
    for (var item in wasteItems) {
      groupedItems[item.category] =
          (groupedItems[item.category] ?? 0) + double.parse(item.kg);
    }

    // Calculate total kg
    final totalKg = groupedItems.values.fold(0.0, (sum, kg) => sum + kg);

    // Create sections and legend entries
    final sections = <PieChartSectionData>[];
    final legendItems = <Widget>[];

    int index = 0;
    groupedItems.forEach((name, kg) {
      final editedName = name.split(' ').first;
      final color = colors[index % colors.length];
      //final percentage = (kg / totalKg) * 100;

      sections.add(PieChartSectionData(
          color: color,
          value: kg,
          title: '',
          radius: 20));

      legendItems.add(
        Row(
          children: [
            Container(
              width: 35,
              height: 13,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
            Text(
              editedName,
              style: TextStyle(fontSize: 16, color: AppColors.accentGreen1000),
            ),
          ],
        ),
      );

      index++;
    });

    return Padding(
      padding: const EdgeInsets.only(left: 45, top: 15, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Pie Chart
          Expanded(
            child: AspectRatio(
              aspectRatio: 1.2,
              child: PieChart(
                PieChartData(
                  sections: sections,
                  centerSpaceRadius: 40,
                  borderData: FlBorderData(show: false),
                ),
              ),
            ),
          ),
          // Legend
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: legendItems,
            ),
          ),
        ],
      ),
    );
  }
}
