import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:karbonizma/common/data/model/statis_model.dart';
import 'package:karbonizma/common/data/repository/statis_repository.dart';

class StatisCubit extends Cubit<StatisModel> {
  final StatisRepository _repository;

  StatisCubit(this._repository)
      : super(StatisModel(ecoPoints: 0, co2Point: 0, totalPoint: 0));

  // Puanları artırma işlemi
  Future<void> increasePoints({
    required int ecoPoints,
    required int co2Point,
    required int totalPoint,
  }) async {
    await _repository.updateHistory(
      ecoPoints: ecoPoints,
      co2Point: co2Point,
      totalPoint: totalPoint,
    );
    debugPrint('updateHistory calisti');
    emit(await _repository.getHistory());
  }

  Future<void> loadHistory() async {
    debugPrint('loadHistory calisti');

    emit(await _repository.getHistory());
  }
}
