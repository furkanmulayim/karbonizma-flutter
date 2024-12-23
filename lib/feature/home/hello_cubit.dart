import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karbonizma/feature/home/hello_state.dart';

///Hello View Model
class HelloCubit extends Cubit<TestState> {
  ///Constructor
  HelloCubit() : super(TestInit());

  Locale _locale = const Locale('tr'); // Varsayılan
  Locale get locale => _locale;

  ///set Language
  void setLocale(Locale locale) {
    if (_locale == locale) return;
    _locale = locale;
  }
}
