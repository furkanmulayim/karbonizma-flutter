import 'package:bloc/bloc.dart';
import 'package:karbonizma/common/data/model/remaining/remaining_rewards.dart';
import 'package:karbonizma/common/data/model/rewards/rewards_model.dart';
import 'package:karbonizma/common/data/repository/local/statis_repo/statis_repository.dart';

class RewardsCubit extends Cubit<List<RemainingModel>> {
  RewardsCubit() : super([]);

  final List<RemainingModel> remainingList = [];
  final _statisRepo = StatisRepository();

  Future<void> fetchHistory(List<RewardsModel> rewardsList) async {
    final statis = await _statisRepo.getStatis();

    var eco = statis.ecoPoints;
    var co = statis.co2Point;
    var total = statis.totalPoint;

    for (var reward in rewardsList) {
      print("FURKAN : ${reward.tokenType}, ${reward.text}");
      var compare = reward.compare;
      var text = reward.text;
      var okImg = reward.completedImageUrl;
      var noImg = reward.notCompletedImageUrl;

      if (reward.tokenType == 'eco') {
        if (compare > eco) {
          // NOT COMPLETED
          addRemainList(eco, compare, text, noImg);
        } else {
          //COMPLETED
          addRemainList(eco, compare, text, okImg);
        }
      } else if (reward.tokenType == 'co') {
        if (compare > co) {
          // NOT COMPLETED
          addRemainList(co, compare, text, noImg);
        } else {
          //COMPLETED
          addRemainList(co, compare, text, okImg);
        }
      } else if (reward.tokenType == 're') {
        if (compare > total) {
          // NOT COMPLETED
          addRemainList(total, compare, text, noImg);
        } else {
          //COMPLETED
          addRemainList(total, compare, text, okImg);
        }
      }
    }
    emit(remainingList);
  }

  void addRemainList(
    eco,
    comp,
    text,
    image,
  ) {
    remainingList.add(
      RemainingModel(
        remainingPoint: '$eco/$comp',
        details: text,
        showingImage: image,
      ),
    );
  }
}
