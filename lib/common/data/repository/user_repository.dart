import 'package:karbonizma/common/data/model/recycle_model.dart';
import 'package:karbonizma/common/data/service/recycle_service/recycle_api_service.dart';

class RecycleRepository {
  RecycleRepository({required this.apiService});

  final RecycleApiService apiService;

  Future<List<RecycleModel>> getWaste() async {
    try {
      final waste = await apiService.fetchWaste(); // List<RecycleModel> dönecek
      return waste;
    } catch (e) {
      rethrow;
    }
  }
}