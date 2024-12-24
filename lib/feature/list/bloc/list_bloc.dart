import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:karbonizma/product/model/recycle_model.dart';

part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  ListBloc() : super(ListInitial()) {
    on<ListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
