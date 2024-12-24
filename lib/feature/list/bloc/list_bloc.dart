import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:karbonizma/product/model/recycle_model.dart';
import 'package:karbonizma/product/repository/remoot/recycle_repository.dart';

part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  ListBloc() : super(ListInitial()) {
    on<ListInitialEvent>((event, emit) async {
      emit(ListLoadingState());
      await Future.delayed(const Duration(seconds: 3));
      emit(ListLoadSuccessState(wastes: RecycleRepository().recycleItems));
    });
  }
}
