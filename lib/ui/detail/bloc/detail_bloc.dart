import 'package:bloc/bloc.dart';
import 'package:karbonizma/common/data/model/recycle_model.dart';
import 'package:karbonizma/common/data/repository/user_repository.dart';
import 'package:meta/meta.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc({required this.recycleRepo, required this.id})
      : super(DetailInitial()) {
    on<DetailInitialEvent>((event, emit) async {
      try {
        final waste = await recycleRepo.getWasteById(id);
        emit(DetailLoadingSuccessState(waste: waste));
      } catch (e) {
        emit(DetailErrorState());
      }
    });
  }

  final RecycleRepository recycleRepo;
  final int id;
}
