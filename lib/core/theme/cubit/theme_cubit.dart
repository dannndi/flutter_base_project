import 'package:base_project/core/local_storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:base_project/core/extensions/string_ext.dart';

part 'theme_state.dart';
part 'theme_cubit.freezed.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(this._storage) : super(ThemeState());

  final LocalStorage _storage;

  void init() async {
    final currentSaved = await _storage.getString(LocalStorage.savedTheme);
    emit(state.copyWith(current: currentSaved?.toTheme ?? ThemeMode.light));
  }

  void changeTheme(ThemeMode theme) {
    _storage.saveString(LocalStorage.savedTheme, theme.name);
    emit(state.copyWith(current: theme));

    if (theme == ThemeMode.dark) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          // on android is icon color
          statusBarIconBrightness: Brightness.light,
          // on iOS is background color,
          // and system will decide from the background color
          statusBarBrightness: Brightness.dark,
        ),
      );
    } else {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          // on android is icon color
          statusBarIconBrightness: Brightness.dark,
          // on iOS is background color
          // and system will decide from the background color
          statusBarBrightness: Brightness.light,
        ),
      );
    }
  }
}
