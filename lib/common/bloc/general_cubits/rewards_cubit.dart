import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:karbonizma/common/data/model/remaining/remaining_rewards.dart';
import 'package:karbonizma/common/data/model/rewards/rewards_model.dart';
import 'package:karbonizma/common/data/repository/local/statis_repo/statis_repository.dart';

class RewardsCubit extends Cubit<List<RemainingModel>> {
  RewardsCubit({required StatisRepository statisRepository})
      : _statisRepository = statisRepository,
        super([]);

  final StatisRepository _statisRepository;

  Future<void> fetchHistory(List<RewardsModel> rewardsList) async {
    try {
      emit([]); // Temiz başlangıç
      final statis = await _statisRepository.getStatis();

      final List<RemainingModel> remainingList = [];
      for (var reward in rewardsList) {
        remainingList.add(_evaluateReward(statis, reward));
        emit(remainingList);
      }

    } catch (error) {
      debugPrint("Error in fetchHistory: $error");
      emit([]);
    }
  }

  RemainingModel _evaluateReward(dynamic statis, RewardsModel reward) {
    final compare = reward.compare;
    final text = reward.text;
    final okImg = reward.completedImageUrl;
    final noImg = reward.notCompletedImageUrl;

    final int currentPoints = reward.tokenType == 'eco'
        ? statis.ecoPoints
        : reward.tokenType == 'co'
        ? statis.co2Point
        : statis.totalPoint;

    final bool isCompleted = compare <= currentPoints;
    return RemainingModel(
      remainingPoint: isCompleted
          ? '$compare/$compare'
          : '$currentPoints/$compare',
      details: text,
      showingImage: isCompleted ? okImg : noImg,
    );
  }
}