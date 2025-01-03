import 'package:flutter_bloc/flutter_bloc.dart';

class WasteCubit extends Cubit<int> {
  WasteCubit() : super(1);

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

  int calcPersentageValue(int persentage) {
    int percent = ((persentage * state) / 10).round();
    return percent;
  }

  int calcRatioValue(int ratio) {
    int rat = ((ratio * state) / 10).round();
    return rat;
  }
}
