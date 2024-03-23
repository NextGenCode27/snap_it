part of 'theme_bloc.dart';

@immutable
sealed class ThemeState {
  @override
  String toString() => 'Theme State';
}

final class ThemeInitial extends ThemeState {
  final ThemeData themeData;
  ThemeInitial({required this.themeData});
  @override
  String toString() => 'Theme Initial';
}

final class ThemeLoading extends ThemeState {
  @override
  String toString() => 'Theme Loading';
}

final class ThemeSuccess extends ThemeState {
  final ThemeData themeData;
  ThemeSuccess({required this.themeData});
  @override
  String toString() => 'Theme Success';
}

final class ThemeFailed extends ThemeState {
  final String message;
  ThemeFailed({required this.message});
  @override
  String toString() => 'Theme Failed';
}
