import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_it/core/usecase/usecase.dart';
import 'package:snap_it/features/onboard/domain/usecase/load_app_usecase.dart';

part 'onboard_event.dart';
part 'onboard_state.dart';

class OnboardBloc extends Bloc<OnboardEvent, OnboardState> {
  final LoadAppUsecase _loadAppUsecase;
  OnboardBloc({required LoadAppUsecase loadAppUsecase})
      : _loadAppUsecase = loadAppUsecase,
        super(OnboardInitial()) {
    on<OnboardEvent>(_mapOnboardEventToState);
    on<LoadAppEvent>(_mapLoadAppEventToState);
  }

  FutureOr<void> _mapOnboardEventToState(
      OnboardEvent event, Emitter<OnboardState> emit) {
    emit(OnboardLoading());
  }

  FutureOr<void> _mapLoadAppEventToState(
      LoadAppEvent event, Emitter<OnboardState> emit) async {
    final res = await _loadAppUsecase.call(NoParams());
    res.fold(
      (error) => emit(OnboardFailed(message: error.message)),
      (loaded) => emit(OnboardSuccess(isLoaded: loaded)),
    );
  }
}
