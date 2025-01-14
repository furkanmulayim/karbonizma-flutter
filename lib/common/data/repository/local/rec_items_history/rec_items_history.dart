import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:karbonizma/common/data/model/rec_items_history/rec_items_history_model.dart';

class RecItemsRepository {
  final String hiveBoxName = 'recItemsHistory';

  Future<void> addOrUpdateHistory(RecItemsModel recItem) async {
    debugPrint('HistoryRepository: addOrUpdateHistory()');
    final box = await Hive.openBox<RecItemsModel>(hiveBoxName);
    final existingKey = box.keys.firstWhere(
      (key) {
        final existingHistory = box.get(key) as RecItemsModel;
        return existingHistory.tokenID == recItem.tokenID;
      },
      orElse: () => null,
    );

    if (existingKey != null) {
      /// güncelle
      debugPrint('RecItemsRepository: Record exists, updating...');
      await box.put(existingKey, recItem);
    } else {
      /// yeni kayıt
      debugPrint('RecItemsRepository: Record does not exist, adding...');
      await box.add(recItem);
    }
  }

  // Tüm kayıtları getir
  Future<List<RecItemsModel>> getAllHistory() async {
    debugPrint('RecItemsRepository: getAllHistory()');
    final box = await Hive.openBox<RecItemsModel>(hiveBoxName);

    return box.values.toList().cast<RecItemsModel>();
  }
}
