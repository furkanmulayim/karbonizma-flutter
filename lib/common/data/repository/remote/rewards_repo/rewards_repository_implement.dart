import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:karbonizma/common/data/model/rewards/rewards_model.dart';
import 'package:karbonizma/common/data/repository/remote/rewards_repo/rewards_repository.dart';
import 'package:karbonizma/common/data/service/api_constants.dart';

import '../../../service/recycle_service/recycle_api_service.dart';

class RewardsRepositoryImpl implements RewardsRepository {
  final GithubApiService apiService;
  final String hiveBoxName = 'rewardsBox';

  RewardsRepositoryImpl({required this.apiService});

  @override
  Future<List<RewardsModel>> getRewards() async {
    final box = await Hive.openBox<RewardsModel>(hiveBoxName);

    if (box.isNotEmpty) {
      return box.values.toList();
    }

    final response =
        await apiService.getData(ApiConstants.githubBaseUrlForRewards);
    List<dynamic> data = json.decode(response.data);
    final rewardsList =
        data.map((item) => RewardsModel.fromJson(item)).toList();

    await box.addAll(rewardsList);
    return data.map((item) => RewardsModel.fromJson(item)).toList();
  }
}
