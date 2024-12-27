import 'package:bloc/bloc.dart';
import 'package:karbonizma/common/data/model/recycle_model.dart';
import 'package:karbonizma/common/data/repository/user_repository.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.recycleRepo}) : super(HomeInitial()) {
    // HomeInitialEvent tetiklendiğinde yapılacak işlemler
    on<HomeInitialEvent>((event, emit) async {
      try {
        final waste = await recycleRepo.getWaste();
        emit(HomeLoadingSuccessState(waste: waste));
      } catch (e) {
        emit(HomeErrorState());
      }
    });
  }
  final RecycleRepository recycleRepo;
}
