import 'package:hive/hive.dart';

part 'history_model.g.dart';

@HiveType(typeId: 2)
class HistoryModel extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(8)
  final String tokenID;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String image;

  @HiveField(3)
  final int topEcoPoints;

  @HiveField(4)
  final int topCo2Points;

  @HiveField(5)
  final String date;

  @HiveField(6)
  final String kg;

  @HiveField(7)
  final String category;

  HistoryModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.topEcoPoints,
      required this.topCo2Points,
      required this.date,
      required this.kg,
      required this.category,
      required this.tokenID});
}
