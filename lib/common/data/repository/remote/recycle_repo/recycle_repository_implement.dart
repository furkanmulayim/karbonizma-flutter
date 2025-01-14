import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:karbonizma/common/data/model/recycle/recycle_model.dart';
import 'package:karbonizma/common/data/repository/remote/recycle_repo/recycle_repository.dart';

import '../../../service/api_constants.dart';
import '../../../service/recycle_service/recycle_api_service.dart';

class RecycleRepositoryImpl implements RecycleRepository {
  final GithubApiService apiService;
  final String hiveBoxName = 'recycleBox';

  RecycleRepositoryImpl({required this.apiService});

  @override
  Future<List<RecycleModel>> getWaste() async {

    final box = await Hive.openBox<RecycleModel>(hiveBoxName);

    if (box.isNotEmpty) {
      return box.values.toList();
    }

    final response =
        await apiService.getData(ApiConstants.githubBaseUrlForWastes);
    List<dynamic> data = json.decode(response.data);
    final wasteList = data.map((item) => RecycleModel.fromJson(item)).toList();

    // Hive'a kaydet
    await box.addAll(wasteList);
    return data.map((item) => RecycleModel.fromJson(item)).toList();
  }

  @override
  Future<RecycleModel> getWasteById(int id) async {
    final box = await Hive.openBox<RecycleModel>(hiveBoxName);
    // Hive'den ID'ye göre veri getir
    final item = box.values.firstWhere((item) => item.id == id);
    return item;
  }
}
