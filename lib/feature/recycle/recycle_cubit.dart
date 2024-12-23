import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karbonizma/product/repository/local/recycle_local_repo.dart';

///
class RecycleCubit extends Cubit<int> {
  ///
  RecycleCubit(super.initialState);

  ///
  RecycleLocalReposity localRepo = RecycleLocalReposity();

  inc() {
    if (state < 10) {
      emit(localRepo.inc(state));
    }
  }

  dec() {
    if (state > 1) {
      emit(localRepo.dec(state));
    }
  }
}
