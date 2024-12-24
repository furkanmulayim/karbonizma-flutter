part of 'list_bloc.dart';

@immutable
abstract class ListState{}

final class ListInitial extends ListState {}

class ListLoadingState extends ListState {}

class ListLoadSuccessState extends ListState {
  ListLoadSuccessState({
    required this.wastes,
  });
  final List<RecycleModel> wastes;
}

class MenuErrorState extends ListState {}