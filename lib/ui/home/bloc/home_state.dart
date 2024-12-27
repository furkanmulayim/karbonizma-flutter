part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadingSuccessState extends HomeState {
  HomeLoadingSuccessState({
    required this.waste,
  });

  final List<RecycleModel> waste;
}

class HomeErrorState extends HomeState {}
