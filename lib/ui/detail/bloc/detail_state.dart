part of 'detail_bloc.dart';

@immutable
abstract class DetailState {}

final class DetailInitial extends DetailState {}

class DetailLoadingState extends DetailState {}

class DetailLoadingSuccessState extends DetailState {
  DetailLoadingSuccessState({
    required this.waste,
  });

  final RecycleModel waste;
}

class DetailErrorState extends DetailState {}