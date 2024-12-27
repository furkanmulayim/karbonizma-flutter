import 'package:dio/dio.dart';
import 'package:karbonizma/common/data/service/api_constants.dart';
import 'dart:convert';
import 'package:karbonizma/common/data/model/recycle_model.dart';

class RecycleApiService {
  final Dio _dio = Dio();

  Future<List<RecycleModel>> fetchWaste() async {
    try {
      final response = await _dio.get(ApiConstants.githubBaseUrlForWastes);
  
      List<dynamic> data = json.decode(response.data);    
      
      return data.map((item) => RecycleModel.fromJson(item)).toList();
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}