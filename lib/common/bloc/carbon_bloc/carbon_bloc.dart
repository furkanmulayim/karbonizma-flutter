import 'package:bloc/bloc.dart';
import 'package:karbonizma/common/data/model/recycle_model.dart';
import 'package:karbonizma/common/data/repository/recycle_repository.dart';
import 'package:meta/meta.dart';

part 'carbon_event.dart';
part 'carbon_state.dart';

class CarbonBloc extends Bloc<CarbonEvent, CarbonState> {
  CarbonBloc({required this.recycleRepo, this.id}) : super(CarbonInitial()) {
    // HomeInitialEvent tetiklendiğinde yapılacak işlemler
    on<CarbonInitialEvent>((event, emit) async {
      try {
        final waste = await recycleRepo.getWaste();
        if (waste.isEmpty) {
          throw Exception("Wastes data is empty");
        }
        emit(CarbonLoadingSuccessState(waste: waste));
      } catch (e) {
        emit(CarbonErrorState());
      }
    });

    on<CarbonInitialEventById>((event, emit) async {
      try {
        final waste = await recycleRepo.getWasteById(id!);
        emit(CarbonLoadingSuccessStateById(waste: waste));
      } catch (e) {
        emit(CarbonErrorState());
      }
    });
  }
  final RecycleRepository recycleRepo;
  final int? id;
}
