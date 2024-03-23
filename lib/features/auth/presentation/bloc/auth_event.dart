part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {
  @override
  String toString() => 'Auth Event';
}

final class RegisterEvent extends AuthEvent {
  final RegisterParams registerParams;

  RegisterEvent({required this.registerParams});

  @override
  String toString() => 'Register Event';
}

final class LoginEvent extends AuthEvent {
  final LoginParams loginParams;

  LoginEvent({required this.loginParams});

  @override
  String toString() => 'Login Event';
}
