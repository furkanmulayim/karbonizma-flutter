import 'package:hive/hive.dart';

part 'history_model.g.dart';

@HiveType(typeId: 2)
class HistoryModel extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String image;

  @HiveField(3)
  int topEcoPoints;

  @HiveField(4)
  int topCo2Points;

  @HiveField(5)
  String date;

  HistoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.topEcoPoints,
    required this.topCo2Points,
    required this.date,
  });
}
