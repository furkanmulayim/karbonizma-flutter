import 'package:hive/hive.dart';

part 'history_model.g.dart'; // Hive generator

@HiveType(typeId: 1)
class HistoryModel extends HiveObject {

  @HiveField(0)
  int ecoPoints;

  @HiveField(1)
  int co2Point;

  @HiveField(2)
  int totalPoint;

  HistoryModel(
      {
      required this.ecoPoints,
      required this.co2Point,
      required this.totalPoint});
}
