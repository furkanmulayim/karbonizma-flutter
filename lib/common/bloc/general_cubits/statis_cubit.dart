import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karbonizma/common/data/model/statis/statis_model.dart';
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
    await _repository.updateStatis(
      ecoPoints: ecoPoints,
      co2Point: co2Point,
      totalPoint: totalPoint,
    );
    emit(await _repository.getStatis());
  }

  // Puanları getirme işlemi
  Future<void> loadHistory() async {
    emit(await _repository.getStatis());
  }
}
