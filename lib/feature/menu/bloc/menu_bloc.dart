import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc() : super(MenuInitial()) {
    on<MenuRecycleButtonNavigateEvent>((event, emit) {
      debugPrint("MenuNavigateToListPageActionState emit");
      emit(MenuNavigateToListPageActionState());
    });
  }
}
