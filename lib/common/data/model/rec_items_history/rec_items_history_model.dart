import 'package:hive/hive.dart';

part 'rec_items_history_model.g.dart';

@HiveType(typeId: 5)
class RecItemsModel extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  final String tokenID;

  @HiveField(2)
  final String kg;

  @HiveField(3)
  final int topEcoPoints;

  @HiveField(4)
  final int topCo2Points;

  RecItemsModel(
      {required this.id,
      required this.kg,
      required this.tokenID,
      required this.topEcoPoints,
      required this.topCo2Points});
}
