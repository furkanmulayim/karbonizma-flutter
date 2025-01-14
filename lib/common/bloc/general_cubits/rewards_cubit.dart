import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:karbonizma/common/data/model/history/history_model.dart';
import 'package:karbonizma/common/data/model/remaining/remaining_rewards.dart';
import 'package:karbonizma/common/data/model/rewards/rewards_model.dart';
import 'package:karbonizma/common/data/repository/local/history_repo/history_repository.dart';
import 'package:karbonizma/core/constants/app_texts.dart';

class RewardsCubit extends Cubit<List<RemainingModel>> {
  final HistoryRepository _repository;

  RewardsCubit(this._repository) : super([]);

  Future<List<HistoryModel>> _getHistoryList() async {
    final histories = await _repository.getAllHistories();
    if (histories.isEmpty) {
      return [];
    }
    return histories;
  }

  Future<void> fetchHistory(List<RewardsModel> rewardsList) async {
    List<HistoryModel> historyList = await _getHistoryList();
    final List<RemainingModel> remainingList = [];

    ///ÇALIŞMA ZAMANI n^2 oldu ama korkma liste küçük olduğu için perf. kaybı olmaz!!!
    for (var history in historyList) {
      for (var reward in rewardsList) {
        print('TOKE TYPE =  ${reward.tokentype}');
        //ID eşleşmesi -> herhangi bir recycle itemle eşleşmesi
        if (history.tokenID == reward.tokenID) {
          //Eğer history ödüle eşit veya geçtiyse
          if (int.parse(history.kg) >= reward.compare) {
            remainingList.add(
              RemainingModel(
                remainingPoint: AppTexts.ok,
                ownPoint: history.kg,
                details: reward.text,
                showingImage: reward.completedImageUrl,
              ),
            );
            //Eğer history ödülden küçükse
          } else if (int.parse(history.kg) < reward.compare) {
            remainingList.add(
              RemainingModel(
                remainingPoint: reward.compare.toString(),
                ownPoint: history.kg,
                details: reward.text,
                showingImage: reward.notCompletedImageUrl,
              ),
            );
          }
        }
      }
    }
    updateStateWithRemainingList(remainingList);
  }

  void updateStateWithRemainingList(List<RemainingModel> remainingList) {
    emit(remainingList);
    debugPrint("Güncellenen Rewards cubit listesi: ${remainingList.length}");
  }
}
