part of 'history_bloc.dart';

@immutable
abstract class HistoryState {}

class HistoryInitial extends HistoryState {}

class HistoryLoading extends HistoryState {}

class HistoryLoaded extends HistoryState {
  final List<HistoryModel> histories;

  HistoryLoaded(this.histories);
}

class HistoryDetailLoaded extends HistoryState {
  final HistoryModel history;

  HistoryDetailLoaded(this.history);
}

class HistoryError extends HistoryState {
  final String message;

  HistoryError(this.message);
}