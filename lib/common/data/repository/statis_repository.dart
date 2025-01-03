import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:karbonizma/common/data/model/statis/statis_model.dart';

class StatisRepository {
  final String hiveBoxName = 'historyBox';

  // Hive box'u açma ve veriyi kontrol etme
  Future<Box<StatisModel>> _openBox() async {
    var box = await Hive.openBox<StatisModel>(hiveBoxName);

    // Box boşsa, başlangıç verisini oluştur ve kaydet
    if (box.isEmpty) {
      debugPrint('StatisRepository: box.isEmpty');
      await box.put(0, StatisModel(ecoPoints: 0, co2Point: 0, totalPoint: 0));
    }
    return box;
  }

  // Veritabanındaki mevcut kaydı al
  Future<StatisModel> getStatis() async {
    final box = await _openBox();
    debugPrint('StatisRepository: getStatis() ');
    return box.get(0)!; // İlk kaydı al (veya varsayılan 0 değerini döndür)
  }

  // Puanları güncelle
  Future<void> updateStatis({
    required int ecoPoints,
    required int co2Point,
    required int totalPoint,
  }) async {
    final box = await _openBox();
    final history = box.get(0)!;
    debugPrint('StatisRepository: updateStatis() ');
    final updatedHistory = StatisModel(
      ecoPoints: (history.ecoPoints + ecoPoints),
      co2Point: history.co2Point + co2Point,
      totalPoint: history.totalPoint + totalPoint,
    );

    // Yeni veriyi kaydet
    await box.put(0, updatedHistory);
  }
}
