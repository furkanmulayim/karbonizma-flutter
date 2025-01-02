import 'package:hive/hive.dart';
import 'package:karbonizma/common/data/model/history_model.dart';

class HistoryRepository {
  final String hiveBoxName = 'historyBox';

  Future<void> updateHistory(
      int id, int ecoPoints, int co2Point, int totalPoint) async {
    final box = await Hive.openBox<HistoryModel>(hiveBoxName);

    final data = box.values.firstWhere((history) => history.id == 0);

    data
      ..ecoPoints += ecoPoints
      ..co2Point += co2Point
      ..totalPoint += totalPoint
      ..save();
  }

  Future<List<HistoryModel>> getAllHistories() async {
    final box = await Hive.openBox<HistoryModel>(hiveBoxName);
    if (box.isEmpty) {
      throw Exception("----> History Hive Boş");
    }
    return box.values.toList();
  }
}
