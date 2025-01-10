import 'package:bloc/bloc.dart';
import 'package:karbonizma/common/data/model/rewards/rewards_model.dart';
import 'package:karbonizma/common/data/repository/rewards_repo/rewards_repository.dart';
import 'package:meta/meta.dart';

part 'rewards_bloc_event.dart';

part 'rewards_bloc_state.dart';

class RewardsBloc extends Bloc<RewardsEvent, RewardsState> {
  RewardsBloc({required this.rewardsRepository}) : super(RewardsBlocInitial()) {
    on<ReweardsInitialEvent>((event, emit) async {
      try {
        final rewards = await rewardsRepository.getRewards();
        if (rewards.isEmpty) {
          throw Exception('Rewards data is empty');
        }
        emit(RewardsLoadingSuccessState(rewards: rewards));
      } catch (e) {
        emit(RewardsErrorState());
        rethrow;
      }
    });
  }

  final RewardsRepository rewardsRepository;
}
