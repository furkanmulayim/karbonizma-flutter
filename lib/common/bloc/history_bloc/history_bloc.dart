import 'package:bloc/bloc.dart';
import 'package:karbonizma/common/data/model/history/history_model.dart';
import 'package:karbonizma/common/data/model/rec_items_history/rec_items_history_model.dart';
import 'package:karbonizma/common/data/repository/local/history_repo/history_repository.dart';
import 'package:karbonizma/common/data/repository/local/rec_items_history/rec_items_history.dart';
import 'package:meta/meta.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final HistoryRepository _historyRepository;
  final RecItemsRepository _recItemRepository;

  HistoryBloc(
    this._historyRepository,
    this._recItemRepository,
  ) : super(HistoryInitial()) {
    on<FetchAllHistories>((event, emit) async {
      try {
        emit(HistoryLoading());
        final histories = await _historyRepository.getAllHistories();
        emit(HistoryLoaded(histories));
      } catch (e) {
        emit(HistoryError('Veriler yüklenirken hata oluştu: $e'));
      }
    });

    on<AddHistory>((event, emit) async {
      try {
        await _historyRepository.addHistory(event.history);
        add(FetchAllHistories());
      } catch (e) {
        emit(HistoryError('Veri eklenirken hata oluştu: $e'));
      }
    });

    on<AddRecItems>((event, emit) async {
      try {
        await _recItemRepository.addOrUpdateHistory(event.recItem);
      } catch (e) {
        rethrow;
      }
    });

    on<UpdateHistory>((event, emit) async {
      try {
        await _historyRepository.updateHistory(event.key, event.updatedHistory);
        add(FetchAllHistories());
      } catch (e) {
        emit(HistoryError('Veri güncellenirken hata oluştu: $e'));
      }
    });

    on<DeleteHistory>((event, emit) async {
      try {
        await _historyRepository.deleteHistory(event.key);
        add(FetchAllHistories());
      } catch (e) {
        emit(HistoryError('Veri silinirken hata oluştu: $e'));
      }
    });

    on<ClearAllHistories>((event, emit) async {
      try {
        await _historyRepository.clearAllHistories();
        emit(HistoryLoaded([]));
      } catch (e) {
        emit(HistoryError('Tüm veriler temizlenirken hata oluştu: $e'));
      }
    });

    on<FetchHistoryById>((event, emit) async {
      try {
        emit(HistoryLoading());
        final history = await _historyRepository.getHistoryById(event.id);
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
