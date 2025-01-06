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
      AppColors.accentGreen50,
      AppColors.accentGreen100,
      AppColors.accentGreen200,
      AppColors.accentGreen300,
      AppColors.accentGreen500,
      AppColors.accentGreen900,
      AppColors.accentGreen1000,
    ];

    // Normalize data for pie chart
    final totalKg =
        wasteItems.fold(0.0, (sum, item) => sum + int.parse(item.kg));
    final List<PieChartSectionData> sections = wasteItems
        .asMap()
        .entries
        .take(9) // Max 9 items
        .map((entry) {
      final index = entry.key;
      final item = entry.value;
      final percentage = (double.parse(item.kg) / totalKg) * 100;

      return PieChartSectionData(
        color: colors[index % colors.length],
        value: double.parse(item.kg),
        title: '${percentage.toStringAsFixed(1)}%', // Display as percentage
        titleStyle: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        radius: 60, // Adjust radius as needed
      );
    }).toList();

    return AspectRatio(
      aspectRatio: 1.4,
      child: PieChart(
        PieChartData(
          sections: sections,
          centerSpaceRadius: 20, // Adjust space in the middle
          borderData: FlBorderData(show: false),
        ),
      ),
    );
  }
}
