import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:karbonizma/common/data/model/history_model.dart';

class HistoryRepository {
  final String hiveBoxName = 'historyBox';

  // Hive box'u açma ve veriyi kontrol etme
  Future<Box<HistoryModel>> _openBox() async {
    var box = await Hive.openBox<HistoryModel>(hiveBoxName);

    // Box boşsa, başlangıç verisini oluştur ve kaydet
    if (box.isEmpty) {
      debugPrint('Box boş, veriler sıfırlanıyor.');
      await box.put(0, HistoryModel(ecoPoints: 0, co2Point: 0, totalPoint: 0));
    }
    return box;
  }

  // Veritabanındaki mevcut kaydı al
  Future<HistoryModel> getHistory() async {
    final box = await _openBox();
    return box.get(0)!; // İlk kaydı al (veya varsayılan 0 değerini döndür)
  }

  // Puanları güncelle
  Future<void> updateHistory({
    required int ecoPoints,
    required int co2Point,
    required int totalPoint,
  }) async {
    final box = await _openBox();
    final history = box.get(0)!;

    final updatedHistory = HistoryModel(
      ecoPoints: (history.ecoPoints + ecoPoints),
      co2Point: history.co2Point + co2Point,
      totalPoint: history.totalPoint + totalPoint,
    );

    // Yeni veriyi kaydet
    await box.put(0, updatedHistory);
  }
}
