import 'package:flutter_bloc/flutter_bloc.dart';

class DetailCubit extends Cubit<int> {
  DetailCubit() : super(1);

  /// state++
  void increase() {
    if (state < 10) {
      emit(state + 1);
    }
  }

  /// state--
  void decrease() {
    if (state > 1) {
      emit(state - 1);
    }
  }
}