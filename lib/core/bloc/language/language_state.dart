part of 'language_cubit.dart';

@freezed
abstract class LanguageState with _$LanguageState {
  const LanguageState._();

  factory LanguageState({@Default(Locale("en")) Locale current}) =
      _LanguageState;
}
