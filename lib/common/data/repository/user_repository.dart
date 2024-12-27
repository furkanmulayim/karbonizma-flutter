import 'package:karbonizma/common/data/model/recycle_model.dart';
import 'package:karbonizma/common/data/service/recycle_service/recycle_api_service.dart';

class RecycleRepository {
  RecycleRepository({required this.apiService});
  final RecycleApiService apiService;

  Future<List<RecycleModel>> getWaste() async {
    try {
      final wasteJson = await apiService.fetchWaste();
      return wasteJson
          .map((wasteJson) => RecycleModel.fromJson(wasteJson))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
