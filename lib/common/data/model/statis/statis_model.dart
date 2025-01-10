import 'package:hive/hive.dart';

part 'statis_model.g.dart';

@HiveType(typeId: 1)
class StatisModel extends HiveObject {
  @HiveField(0)
  int ecoPoints;

  @HiveField(1)
  int co2Point;

  @HiveField(2)
  int totalPoint;

  StatisModel(
      {required this.ecoPoints,
      required this.co2Point,
      required this.totalPoint});
}
