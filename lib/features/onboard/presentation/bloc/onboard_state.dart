part of 'onboard_bloc.dart';

@immutable
sealed class OnboardState {
  @override
  String toString() => 'Onboard State';
}

final class OnboardInitial extends OnboardState {
  @override
  String toString() => 'Onboard Initial';
}

final class OnboardLoading extends OnboardState {
  @override
  String toString() => 'Onboard Loading';
}

final class OnboardSuccess extends OnboardState {
  final bool isLoaded;
  OnboardSuccess({required this.isLoaded});
  @override
  String toString() => 'Onboard Success';
}

final class OnboardFailed extends OnboardState {
  final String message;
  OnboardFailed({required this.message});
  @override
  String toString() => 'Onboard Failed';
}
