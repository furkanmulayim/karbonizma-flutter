part of 'history_bloc.dart';

@immutable
abstract class HistoryEvent {}

class FetchAllHistories extends HistoryEvent {}

class AddHistory extends HistoryEvent {
  final HistoryModel history;
  AddHistory(this.history);
}

class UpdateHistory extends HistoryEvent {
  final int key;
  final HistoryModel updatedHistory;
  UpdateHistory(this.key, this.updatedHistory);
}

class DeleteHistory extends HistoryEvent {
  final int key;
  DeleteHistory(this.key);
}

class ClearAllHistories extends HistoryEvent {}

class FetchHistoryById extends HistoryEvent {
  final int id;
  FetchHistoryById(this.id);
}