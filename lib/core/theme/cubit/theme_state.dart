part of 'theme_cubit.dart';

@freezed
abstract class ThemeState with _$ThemeState {
  const ThemeState._();

  factory ThemeState({@Default(ThemeMode.system) ThemeMode current}) =
      _ThemeState;
}
