import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:karbonizma/common/data/model/history/history_model.dart';
import 'package:karbonizma/core/constants/app_colors.dart';

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
      AppColors.pieChartColor5,
      AppColors.pieChartColor6,
      AppColors.pieChartColor7,
      AppColors.pieChartColor8,
      AppColors.pieChartColor9,
    ];

    // Group waste items by name
    final groupedItems = <String, double>{};
    for (var item in wasteItems) {
      groupedItems[item.name] =
          (groupedItems[item.name] ?? 0) + double.parse(item.kg);
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
      final percentage = (kg / totalKg) * 100;

      sections.add(PieChartSectionData(
          color: color,
          value: kg,
          title: '${percentage.floor()}',
          titleStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          radius: 60));

      legendItems.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                editedName,
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      );

      index++;
    });

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Pie Chart
        Expanded(
          flex: 2,
          child: AspectRatio(
            aspectRatio: 1,
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
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: legendItems,
          ),
        ),
      ],
    );
  }
}
