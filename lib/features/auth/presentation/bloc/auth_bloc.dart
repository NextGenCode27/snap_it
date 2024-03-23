import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_it/features/auth/domain/usecase/login_usecase.dart';
import 'package:snap_it/features/auth/domain/usecase/register_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterUsecase _registerUsecase;
  final LoginUsecase _loginUsecase;
  AuthBloc({
    required RegisterUsecase registerUsecase,
    required LoginUsecase loginUsecase,
  })  : _registerUsecase = registerUsecase,
        _loginUsecase = loginUsecase,
        super(AuthInitial()) {
    on<AuthEvent>(_mapAuthEventToState);
    on<RegisterEvent>(_mapRegiterEventToState);
    on<LoginEvent>(_mapLoginEventToState);
  }

  FutureOr<void> _mapAuthEventToState(
      AuthEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
  }

  FutureOr<void> _mapRegiterEventToState(
      RegisterEvent event, Emitter<AuthState> emit) async {
    final res = await _registerUsecase.call(
      RegisterParams(
        userName: event.registerParams.userName,
        email: event.registerParams.email,
        phone: event.registerParams.phone,
        password: event.registerParams.password,
      ),
    );
    res.fold(
      (error) => emit(AuthFailed(message: error.message)),
      (user) => emit(AuthSuccess()),
    );
  }

  FutureOr<void> _mapLoginEventToState(
      LoginEvent event, Emitter<AuthState> emit) async {
    final res = await _loginUsecase.call(
      LoginParams(
        email: event.loginParams.email,
        password: event.loginParams.password,
      ),
    );
    res.fold(
      (error) => emit(AuthFailed(message: error.message)),
      (user) => emit(AuthSuccess()),
    );
  }
}
