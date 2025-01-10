import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class GithubApiService {
  final Dio _dio = Dio();

  Future<Response> getData(url) async {
    try {
      final response = await _dio.get(url);
      return response;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
