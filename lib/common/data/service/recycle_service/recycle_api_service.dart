import 'package:dio/dio.dart';
import 'package:karbonizma/common/data/service/api_constants.dart';
import 'dart:convert';
import 'package:karbonizma/common/data/model/recycle/recycle_model.dart';

class RecycleApiService {
  final Dio _dio = Dio();

  Future<Response> getData() async {
    try {
      final response = await _dio.get(ApiConstants.githubBaseUrlForWastes);
      return response;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}