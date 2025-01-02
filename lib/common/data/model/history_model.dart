import 'package:hive/hive.dart';

part 'history_model.g.dart'; // Hive generator

@HiveType(typeId: 1)
class HistoryModel extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  int ecoPoints;

  @HiveField(2)
  int co2Point;

  @HiveField(3)
  int totalPoint;

  HistoryModel(
      {required this.id,
      required this.ecoPoints,
      required this.co2Point,
      required this.totalPoint});
}
