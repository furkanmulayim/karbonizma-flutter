part of 'rewards_bloc_bloc.dart';

@immutable
abstract class RewardsState {}

final class RewardsBlocInitial extends RewardsState {}

class RewardsLoadingState extends RewardsState {}

class RewardsLoadingSuccessState extends RewardsState {
  RewardsLoadingSuccessState({required this.rewards});

  final List<RewardsModel> rewards;
}

class RewardsErrorState extends RewardsState {}
