part of 'theme_bloc.dart';

@immutable
sealed class ThemeEvent {
  @override
  String toString() => 'Theme Event';
}

final class ThemeChangeEvent extends ThemeEvent {
  final ThemeData themeData;
  ThemeChangeEvent({required this.themeData});
  @override
  String toString() => 'Theme Change Event';
}
