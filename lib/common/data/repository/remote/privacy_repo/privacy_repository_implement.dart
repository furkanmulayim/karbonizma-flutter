import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:karbonizma/common/data/model/privacy/privacy_model.dart';
import 'package:karbonizma/common/data/repository/remote/privacy_repo/privacy_repository.dart';
import 'package:karbonizma/common/data/service/api_constants.dart';

import '../../../service/recycle_service/recycle_api_service.dart';

class PrivacyRepositoryImplement implements PrivacyRepository {
  final GithubApiService apiService;
  final String hiveBoxName = 'privacyBox';

  PrivacyRepositoryImplement({required this.apiService});

  @override
  Future<PrivacyModel> getPrivacy() async {
    final box = await Hive.openBox<PrivacyModel>(hiveBoxName);

    // Eğer Hive kutusunda veriler varsa, ilk veriyi döndür
    if (box.isNotEmpty) {
      return box.values.first;
    }

    // API'den veri al
    final response =
        await apiService.getData(ApiConstants.githubBaseUrlForPrivacy);
    dynamic singledata = json.decode(response.data);

    // singledata'dan PrivacyModel listesi oluştur
    final List<PrivacyModel> singlePrivacy = singledata
        .map<PrivacyModel>((item) => PrivacyModel.fromJson(item))
        .toList();

    // Hive kutusuna listeyi ekle
    await box.addAll(singlePrivacy);

    // Eğer tek bir PrivacyModel döndürmek istiyorsanız, ilk öğeyi döndürün
    return singlePrivacy.first;
  }
}
