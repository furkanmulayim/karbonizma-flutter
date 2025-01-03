import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:karbonizma/common/data/model/recycle/recycle_model.dart';
import 'package:karbonizma/common/data/service/recycle_service/recycle_api_service.dart';

class RecycleRepository {
  RecycleRepository({required this.apiService});

  final RecycleApiService apiService;
  final String hiveBoxName = 'recycleBox';

  Future<List<RecycleModel>> getWaste() async {
    try {
      final box = await Hive.openBox<RecycleModel>(hiveBoxName);
      // hive veri var mı
      if (box.isNotEmpty) {
        debugPrint('RecycleRepository: box.isNotEmpty List');
        return box.values.toList();
      }
      // hivede yoksa apiden çek
      final waste = await apiService.fetchWaste();

      // hivea kaydet
      await box.addAll(waste);
        debugPrint('RecycleRepository: hivea kaydet');
      return waste;
    } catch (e) {
        debugPrint('RecycleRepository: hivea hatası: -> $e');
      rethrow;
    }
  }

  Future<RecycleModel> getWasteById(int id) async {
    try {
      final box = await Hive.openBox<RecycleModel>(hiveBoxName);

      // Hive'dan veriyi kontrol et
      final recycleItem = box.values.firstWhere(
        (item) => item.id == id,
        orElse: () => throw Exception('Veri bulunamadı! ID: $id'),
      );

      // Eğer recycleItem bulunduysa, onu döndür
      return recycleItem;
    } catch (e) {
      // Hata durumunda yeniden fırlatma
      throw Exception('Hata oluştu: $e');
    }
  }
}
