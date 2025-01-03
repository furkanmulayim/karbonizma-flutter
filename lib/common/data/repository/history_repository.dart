import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart';
import 'package:karbonizma/common/data/model/history/history_model.dart';

class HistoryRepository {
  final String hiveBoxName = 'historyBox';
  //Box Aç
  Future<Box<HistoryModel>> _openBox() async {
    return await Hive.openBox<HistoryModel>(hiveBoxName);
  }

  //Veri Çek
  Future<List<HistoryModel>> getAllHistories() async {
    debugPrint('HistoryRepository: getAllHistories()');
    final box = await _openBox();
    return box.values.toList();
  }

  //Veri Ekle
  Future<void> addHistory(HistoryModel history) async {
    debugPrint('HistoryRepository: addHistory()');
    final box = await _openBox();
    await box.add(history);
  }

  //Veri Güncelle
  Future<void> updateHistory(int key, HistoryModel updatedHistory) async {
    debugPrint('HistoryRepository: updateHistory()');
    final box = await _openBox();
    await box.put(key, updatedHistory);
  }

  //Key'e Göre Sil
  Future<void> deleteHistory(int key) async {
    debugPrint('HistoryRepository: deleteHistory()');
    final box = await _openBox();
    await box.delete(key);
  }

  // Tüm verileri temizleme
  Future<void> clearAllHistories() async {
    debugPrint('HistoryRepository: clearAllHistories()');
    final box = await _openBox();
    await box.clear();
  }

  //İD'ye göre Veri Çek
  Future<HistoryModel?> getHistoryById(int id) async {
    debugPrint('HistoryRepository: getHistoryById() calisti');
    final box = await _openBox();
    return box.values.firstWhere((history) => history.id == id);
  }
}
