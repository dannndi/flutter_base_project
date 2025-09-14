import 'package:base_project/core/extensions/build_context_ext.dart';
import 'package:base_project/core/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("AppLocalization ext", () {
    testWidgets('should return AppLocalization with en / english language', (
      tester,
    ) async {
      AppLocalizations? localizations;
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale("en"),
          home: Builder(
            builder: (context) {
              localizations = context.intl;

              return SizedBox();
            },
          ),
        ),
      );

      expect(localizations, isNotNull);
    });

    testWidgets(
      'should return AppLocalization with id / indonesian language',
      (tester) async {
        AppLocalizations? localizations;
        await tester.pumpWidget(
          MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale("id"),
            home: Builder(
              builder: (context) {
                localizations = context.intl;

                return SizedBox();
              },
            ),
          ),
        );

        expect(localizations, isNotNull);
      },
    );
  });
}
