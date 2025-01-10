import 'package:karbonizma/common/data/model/rewards/rewards_model.dart';

abstract class RewardsRepository {
  Future<List<RewardsModel>> getRewards();
}
