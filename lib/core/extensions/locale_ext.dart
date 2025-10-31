import 'package:flutter/material.dart';

extension LocaleExt on Locale {
  String get emoji {
    return switch (languageCode) {
      "en" => "🇺🇸",
      "id" => "🇮🇩",
      _ => "-",
    };
  }

  String get text {
    return switch (languageCode) {
      "en" => "English",
      "id" => "Indonesia",
      _ => "-",
    };
  }
}
