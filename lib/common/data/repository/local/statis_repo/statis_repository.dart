import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:karbonizma/common/data/model/statis/statis_model.dart';

class StatisRepository {
  final String hiveBoxName = 'StatisBox';

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
  Future<void> increaseStatis({
    required int ecoPoints,
    required int co2Point,
  }) async {
    final box = await _openBox();
    final history = box.get(0)!;
    debugPrint('StatisRepository: increaseStatis() ');
    final updatedHistory = StatisModel(
      ecoPoints: history.ecoPoints + ecoPoints,
      co2Point: history.co2Point + co2Point,
      totalPoint: history.totalPoint + 1,
    );
    // Yeni veriyi kaydet
    await box.put(0, updatedHistory);
  }

  // Puanları güncelle
  Future<void> decreaseStatis({
    required int ecoPoints,
    required int co2Point,
  }) async {
    final box = await _openBox();
    final history = box.get(0)!;
    debugPrint('StatisRepository: decreaseStatis() ');
    final updatedHistory = StatisModel(
      ecoPoints: history.ecoPoints - ecoPoints,
      co2Point: history.co2Point - co2Point,
      totalPoint: history.totalPoint - 1,
    );
    // Yeni veriyi kaydet
    await box.put(0, updatedHistory);
  }
}
