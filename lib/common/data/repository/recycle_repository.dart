import 'package:karbonizma/common/data/model/recycle/recycle_model.dart';

abstract class RecycleRepository {
  Future<List<RecycleModel>> getWaste();
  Future<RecycleModel> getWasteById(int id);
}