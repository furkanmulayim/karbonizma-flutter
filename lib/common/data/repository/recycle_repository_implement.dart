import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:karbonizma/common/data/model/recycle/recycle_model.dart';
import 'package:karbonizma/common/data/repository/recycle_repository.dart';

import '../service/recycle_service/recycle_api_service.dart';

class RecycleRepositoryImpl implements RecycleRepository {
  final RecycleApiService apiService;
  final String hiveBoxName = 'recycleBox';

  RecycleRepositoryImpl({required this.apiService});

  @override
  Future<List<RecycleModel>> getWaste() async {
    final box = await Hive.openBox<RecycleModel>(hiveBoxName);

    // Eğer Hive'de veri varsa döndür
    if (box.isNotEmpty) {
      return box.values.toList();
    }

    // Eğer Hive boşsa API'den veri çek
    final response = await apiService.getData();
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

class RecycleEntity {
}