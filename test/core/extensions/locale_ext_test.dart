import 'dart:ui';

import 'package:base_project/core/extensions/locale_ext.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LocaleExt - emoji', () {
    test('returns 🇺🇸 for English locale', () {
      const locale = Locale('en');

      expect(locale.emoji, '🇺🇸');
    });

    test('returns 🇮🇩 for Indonesian locale', () {
      const locale = Locale('id');

      expect(locale.emoji, '🇮🇩');
    });

    test('returns "-" for unsupported locale', () {
      const locale = Locale('fr');

      expect(locale.emoji, '-');
    });
  });

  group('LocaleExt - text', () {
    test('returns English for en locale', () {
      const locale = Locale('en');

      expect(locale.text, 'English');
    });

    test('returns Indonesia for id locale', () {
      const locale = Locale('id');

      expect(locale.text, 'Indonesia');
    });

    test('returns "-" for unsupported locale', () {
      const locale = Locale('jp');

      expect(locale.text, '-');
    });
  });
}
