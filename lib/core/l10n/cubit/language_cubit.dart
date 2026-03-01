import 'package:base_project/core/local_storage/local_storage.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'language_cubit.freezed.dart';
part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit(this._storage) : super(LanguageState());
  final LocalStorage _storage;

  void init() async {
    final currentSaved = await _storage.getString(LocalStorage.savedLanguage);
    emit(state.copyWith(current: Locale(currentSaved ?? "en")));
  }

  void changeLanguage(Locale locale) {
    _storage.saveString(LocalStorage.savedLanguage, locale.languageCode);
    emit(state.copyWith(current: locale));
  }
}
