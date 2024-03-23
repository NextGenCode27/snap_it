import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_it/core/themes/light_theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial(themeData: lightMode)) {
    on<ThemeEvent>(_mapThemeEventToState);
    on<ThemeChangeEvent>(_mapThemeChangeEventToState);
  }

  FutureOr<void> _mapThemeEventToState(
      ThemeEvent event, Emitter<ThemeState> emit) async {
    emit(ThemeLoading());
  }

  FutureOr<void> _mapThemeChangeEventToState(
      ThemeChangeEvent event, Emitter<ThemeState> emit) async {
    emit(ThemeSuccess(themeData: event.themeData));
  }
}
