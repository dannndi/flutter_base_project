import 'package:flutter/material.dart';

extension StringExt on String {
  ThemeMode get toTheme {
    return switch (this) {
      "system" => ThemeMode.system,
      "light" => ThemeMode.light,
      "dark" => ThemeMode.dark,
      _ => ThemeMode.system,
    };
  }
}
