import 'package:dio/dio.dart';
import 'package:karbonizma/common/data/service/api_constants.dart';

class RecycleApiService {
  final Dio _dio = Dio();

  Future<List<Map<String, dynamic>>> fetchWaste() async {
    try {
      final response = await _dio.get(ApiConstants.githubBaseUrlForWastes);
      return List<Map<String, dynamic>>.from(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
