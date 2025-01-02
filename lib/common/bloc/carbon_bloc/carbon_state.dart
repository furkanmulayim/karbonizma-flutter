part of 'carbon_bloc.dart';

@immutable
abstract class CarbonState {}

class CarbonInitial extends CarbonState {}

class CarbonLoadingState extends CarbonState {}

class CarbonLoadingSuccessState extends CarbonState {
  CarbonLoadingSuccessState({
    required this.waste,
  });

  final List<RecycleModel> waste;
}

class CarbonLoadingSuccessStateById extends CarbonState {
  CarbonLoadingSuccessStateById({
    required this.waste,
  });

  final RecycleModel waste;
}

class CarbonErrorState extends CarbonState {}
