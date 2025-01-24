import 'package:hive/hive.dart';
import 'package:karbonizma/common/data/model/history/history_model.dart';

class HistoryRepository {
  final String hiveBoxName = 'historyBox';

  //Box Aç
  Future<Box<HistoryModel>> _openBox() async {
    return await Hive.openBox<HistoryModel>(hiveBoxName);
  }

  //Veri Çek
  Future<List<HistoryModel>> getAllHistories() async {
    final box = await _openBox();
    return box.values.toList();
  }

  //Veri Ekle
  Future<void> addHistory(HistoryModel history) async {
    final box = await _openBox();
    await box.add(history);
  }

  //Veri Güncelle
  Future<void> updateHistory(int key, HistoryModel updatedHistory) async {
    final box = await _openBox();
    await box.put(key, updatedHistory);
  }

  //Key'e Göre Sil
  Future<void> deleteHistory(int index) async {
    final box = await _openBox();
    await box.deleteAt(index);
  }

  // Tüm verileri temizleme
  Future<void> clearAllHistories() async {
    final box = await _openBox();
    await box.clear();
  }

  //İD'ye göre Veri Çek
  Future<HistoryModel?> getHistoryById(int id) async {
    final box = await _openBox();
    return box.values.firstWhere((history) => history.id == id);
  }
}
