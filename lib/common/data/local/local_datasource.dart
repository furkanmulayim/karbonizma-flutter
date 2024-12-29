import 'package:hive/hive.dart';
import 'package:karbonizma/common/data/model/recycle_model.dart';

class LocalDataSource {
  final String _boxName = 'recycleBox';

  Future<void> saveWaste(List<RecycleModel> data) async {
    final box = await Hive.openBox<RecycleModel>(_boxName);
    await box.clear();
    await box.addAll(data);
  }

  Future<List<RecycleModel>> getWaste() async {
    final box = await Hive.openBox<RecycleModel>(_boxName);
    return box.values.toList();
  }

  Future<bool> hasCachedData() async {
    final box = await Hive.openBox<RecycleModel>(_boxName);
    return box.isNotEmpty;
  }
}