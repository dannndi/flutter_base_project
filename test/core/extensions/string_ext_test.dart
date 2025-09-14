import 'package:base_project/core/extensions/string_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("toTheme function Extention", () {
    test(
      'should return system theme mode',
      () {
        final theme = "system";

        expect(theme.toTheme, equals(ThemeMode.system));
      },
    );

    test(
      'should return light theme mode',
      () {
        final theme = "light";

        expect(theme.toTheme, equals(ThemeMode.light));
      },
    );

    test(
      'should return dark theme mode',
      () {
        final theme = "dark";

        expect(theme.toTheme, equals(ThemeMode.dark));
      },
    );

    test(
      'should return default theme mode',
      () {
        final theme = "-";

        expect(theme.toTheme, equals(ThemeMode.system));
      },
    );
  });
}
