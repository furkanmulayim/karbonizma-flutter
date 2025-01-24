import 'package:bloc/bloc.dart';
import 'package:karbonizma/common/data/model/history/history_model.dart';
import 'package:karbonizma/common/data/model/remaining/remaining_rewards.dart';
import 'package:karbonizma/common/data/model/rewards/rewards_model.dart';
import 'package:karbonizma/common/data/repository/local/history_repo/history_repository.dart';

class RewardsCubit extends Cubit<List<RemainingModel>> {
  RewardsCubit(this._repository) : super([]);

  final HistoryRepository _repository;

  Future<void> fetchHistory(List<RewardsModel> rewardsList) async {
    final List<RemainingModel> remainingList = [];

    for (var reward in rewardsList) {
      print('FDEBUG: ${reward.tokenType}');
      if (reward.tokenType == 'eco') {
        remainingList.add(
          RemainingModel(
            remainingPoint: 'AppTexts.ok',
            ownPoint: 'history.kg',
            details: 'reward.text',
            showingImage: reward.notCompletedImageUrl,
          ),
        );
      } else if (reward.tokenType == 'co') {
      } else if (reward.tokenType == 're') {}
    }
    emit(remainingList);
  }

  Future<List<HistoryModel>> _getHistoryList() async {
    final histories = await _repository.getAllHistories();
    if (histories.isEmpty) {
      return [];
    }
    return histories;
  }
}
