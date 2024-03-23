part of 'onboard_bloc.dart';

@immutable
sealed class OnboardEvent {
  @override
  String toString() => 'Onboard Event';
}

final class LoadAppEvent extends OnboardEvent {}
