import 'package:bloc/bloc.dart';
import 'package:karbonizma/common/data/model/history/history_model.dart';
import 'package:karbonizma/common/data/repository/history_repository.dart';
import 'package:meta/meta.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final HistoryRepository _repository;

  HistoryBloc(this._repository) : super(HistoryInitial()) {
    on<FetchAllHistories>((event, emit) async {
      try {
        emit(HistoryLoading());
        final histories = await _repository.getAllHistories();
        emit(HistoryLoaded(histories));
      } catch (e) {
        emit(HistoryError('Veriler yüklenirken hata oluştu: $e'));
      }
    });

    on<AddHistory>((event, emit) async {
      try {
        await _repository.addHistory(event.history);
        print("EKLENDI LAAAN ${event.history.name}");
        add(FetchAllHistories());
      } catch (e) {
        emit(HistoryError('Veri eklenirken hata oluştu: $e'));
      }
    });

    on<UpdateHistory>((event, emit) async {
      try {
        await _repository.updateHistory(event.key, event.updatedHistory);
        add(FetchAllHistories());
      } catch (e) {
        emit(HistoryError('Veri güncellenirken hata oluştu: $e'));
      }
    });

    on<DeleteHistory>((event, emit) async {
      try {
        await _repository.deleteHistory(event.key);
        add(FetchAllHistories());
      } catch (e) {
        emit(HistoryError('Veri silinirken hata oluştu: $e'));
      }
    });

    on<ClearAllHistories>((event, emit) async {
      try {
        await _repository.clearAllHistories();
        emit(HistoryLoaded([]));
      } catch (e) {
        emit(HistoryError('Tüm veriler temizlenirken hata oluştu: $e'));
      }
    });

    on<FetchHistoryById>((event, emit) async {
      try {
        emit(HistoryLoading());
        final history = await _repository.getHistoryById(event.id);
        if (history != null) {
          emit(HistoryDetailLoaded(history));
        } else {
          emit(HistoryError('Veri bulunamadı.'));
        }
      } catch (e) {
        emit(HistoryError('Veri yüklenirken hata oluştu: $e'));
      }
    });
  }
}
